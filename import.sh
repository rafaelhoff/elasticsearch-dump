export es=localhost:9200
cd chunks

for file in $1*; do
  echo -n "${file}:  "
  took=$(curl -s -XPOST $es/$1/_bulk -H 'content-type: application/x-ndjson' --data-binary @$file |
    grep took | cut -d':' -f 2 | cut -d',' -f 1)
  printf '%7s\n' $took
  [ "x$took" = "x" ] || rm $file
done


# curl -s -XPOST http://localhost:9200/ptwikiquote/_bulk -H 'content-type: application/x-ndjson' --data-binary @chunks/ptwikiquote-20171204-cirrussearch-content.json

# curl -s -XPOST http://localhost:9200/eswikiquote/_bulk -H 'content-type: application/x-ndjson' --data-binary @chunks/eswikiquote-20171204-cirrussearch-content.json

# curl -s -XPOST http://localhost:9200/dewiktionary/_bulk -H 'content-type: application/x-ndjson' -v --data-binary @chunks/dewiktionary-20171204-cirrussearch-content.json
