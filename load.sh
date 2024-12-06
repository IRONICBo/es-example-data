#!/bin/bash
# Test throughput of Elasticsearch using curl, do not use bulk API

start_time=$(date +%s%3N)

for index in {1..100}
do
  ES_URL="http://localhost:9200/your_index$index/_doc"

  for i in {1..1000}
  do
    curl -X GET "$ES_URL/$i"
  done
done

end_time=$(date +%s%3N)

elapsed_time=$((end_time - start_time))
echo "Total time for queries: $elapsed_time milliseconds"