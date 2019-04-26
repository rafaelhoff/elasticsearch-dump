FROM docker.elastic.co/elasticsearch/elasticsearch:6.0.0

#RUN plugin install elasticsearch/elasticsearch-analysis-icu/2.6.0
RUN bin/elasticsearch-plugin install analysis-icu

# COPY --chown=elasticsearch:elasticsearch elasticsearch.yml /usr/share/elasticsearch/config/
COPY elasticsearch.yml /usr/share/elasticsearch/config/

#https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html
#https://www.elastic.co/guide/en/elasticsearch/reference/5.0/modules-http.html

## docker build . --tag elasticsearch
## docker run -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -d --name elasticsearch elasticsearch 
