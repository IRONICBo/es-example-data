import json

with open("mockaroo_data.json", "r") as f:
    data = json.load(f)

# 100 * 10000 = 1000000
bulk_data = []
index_num = 100
data_num = len(data) * 10
for i in range(1, index_num + 1):
    index_name = "mockaroo_data_" + str(i)
    for j in range(1, data_num + 1):
        bulk_data.append({"index": {"_index": index_name, "_id": j}})
        bulk_data.append(data[j%len(data)])
    # for i, record in enumerate(data):
    #     bulk_data.append({"index": {"_index": index_name, "_id": i + 1}})
    #     bulk_data.append(record)

with open("bulk_data.json", "w") as f:
    for entry in bulk_data:
        f.write(json.dumps(entry) + "\n")
