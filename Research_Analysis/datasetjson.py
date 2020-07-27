import os 
import json
path = '/Users/jahankhan/CongressionalAppChallengePandemic/Research_Analysis/NLPModel/DatasetCORD'
res = os.listdir(path) 
with open("stringprocessing.txt", "w") as textholder:
    for x in res:
     # print(x)
        file_path = f'{path}/{x}'
        j = json.load(open(file_path, "rb"))
      

        print(j['paper_id'])
        textholder.write(str(j['paper_id']))

        break


