import os 
import json
path = '/Users/jahankhan/CongressionalAppChallengePandemic/Research_Analysis/NLPModel/DatasetCORD'
res = os.listdir(path) 
with open("stringprocessing.txt", "w") as textholder:
    for x in res:
     # print(x)
        file_path = f'{path}/{x}'
        j = json.load(open(file_path, "rb"))
      
        for x in j['abstract']:
            par_text = str(x['text'])
            textholder.write(par_text)
        # print(j['paper_id'])
        # textholder.write(str(j['paper_id']))

        break


# with open('output.txt', 'w') as out:
#   for x in j['abstract']:
#     par_text = x['text']
#     out.write(par_text)

