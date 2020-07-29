import os 
import json
import nltk
import gensim
nltk.download("punkt")

path = "/Users/*****NAME*****/SwiftAppProjects/CongressionalAppChallengePandemic/Research_Analysis/NLPModel/DatasetCORD"
json_folder = os.listdir(path)
with open("stringprocessing.txt", "w") as output_text:
    for file in json_folder:
        
        file_path = f"{path}/{file}"
        
        if ".json" in file:
            j = json.load(open(file_path))
            output_text.write("key: " + j["paper_id"] + "\n")
            
            #j = dictionary, j['abstract'] = list, par = dictionary, par['text'] = String
            for par in j["abstract"]:
                par_text = par["text"]
                output_text.write(par_text + "\n")
            
            output_text.write("\n")

with open("stringprocessing.txt") as token_text:
    token_list = list(token_text)
    
    for token in token_list:
        new_token = gensim.utils.simple_preprocess(token)
        print(new_token)
