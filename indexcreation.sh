export es=localhost:9200
export site=de.wiktionary.org
export index=dewiktionary

curl -XDELETE $es/$index
echo 'Index deleted.'

settings=`curl -s 'https://'$site'/w/api.php?action=cirrus-settings-dump&format=json&formatversion=2'`
mapping=`curl -s 'https://'$site'/w/api.php?action=cirrus-mapping-dump&format=json&formatversion=2'`

# curl -s https://de.wiktionary.org/w/api.php?action=cirrus-settings-dump&format=json&formatversion=2

echo $settings

  jq '{
    analysis: .content.page.index.analysis,
    number_of_shards: 1,
    number_of_replicas: 0
  }' |
  curl -XPUT --header "Content-Type: application/json" $es/$index -d $settings

  # curl -XPUT localhost:9200/ptwikiquote

  jq .content |
  sed 's/"index_analyzer"/"analyzer"/' |
  sed 's/"position_offset_gap"/"position_increment_gap"/' |
  curl -XPUT $es/$index/_mapping/page?pretty -d $mapping
