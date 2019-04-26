# Example ptwikiquote

wget -r -l1 --no-parent -A "$1*cirrussearch-content.json.gz" -nd https://dumps.wikimedia.org/other/cirrussearch/current/
cd chunks
zcat ../$1*cirrussearch-content.json.gz | split -a 10 -l 50000 - $1
