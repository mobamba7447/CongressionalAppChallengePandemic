import os
import json
import pandas
import gensim
import nltk
nltk.download('punkt')
path = "/Users/jahankhan/CongressionalAppChallengePandemic/Research_Analysis/NLPModel/DatasetCORD"
json_folder = os.listdir(path)
with open("stringprocessing.txt", "w") as textholder:
    for file in json_folder:
        file_path = f"{path}/{file}"

        if ".json" in file:
            j = json.load(open(file_path))
            for par in j["abstract"]:
                par_text = par["text"]
                textholder.write(par_text)

            
            # 
# import nltk
# file_content = open("myfile.txt").read()
# tokens = nltk.word_tokenize(file_content)
# print tokens
with open("/Users/jahankhan/CongressionalAppChallengePandemic/Research_Analysis/stringprocessing.txt", "r") as aggregate_content:
    aggregate_content_text = aggregate_content.read()
    token = nltk.word_tokenize(aggregate_content_text)
    print(token)