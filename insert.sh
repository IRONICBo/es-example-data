#!/bin/bash
# Test throughput of Elasticsearch using curl, do not use bulk API

start_time=$(date +%s%3N)

for index in {1..100}
do
  ES_URL="http://localhost:9200/your_index$index/_doc"

  for i in {1..1000}
  do
    curl -X POST "$ES_URL/$i" \
         -H "Content-Type: application/json" \
         -d "{\"field1\": \"value$index-$i\", \"field2\": \"value$((index + i))\"}"
  done
done

end_time=$(date +%s%3N)

elapsed_time=$((end_time - start_time))
echo "Total time for inserts: $elapsed_time milliseconds"