import os
import json
import pandas as pd
from gensim.models import Word2Vec
path = "/Users/*****NAME******/CongressionalAppChallengePandemic/Research_Analysis/NLPModel/DatasetCORD"
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
with open("/Users/*****NAME*********/CongressionalAppChallengePandemic/Research_Analysis/stringprocessing.txt", "r") as aggregate_content:
    aggregate_content_text = aggregate_content.read()
    token_jar = []
    token = aggregate_content_text.split(".")
    for i in token:
        token_jar.append(gensim.utils.simple_preprocess(i))
    print(token_jar)
    print(token)
