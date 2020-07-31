import os 
import json
import gensim

path = "/Users/reynoldbascos/SwiftAppProjects/CongressionalAppChallengePandemic/Research_Analysis/NLPModel/DatasetCORD"
json_folder = os.listdir(path)
with open("corpus_file.txt", "w") as output_text:
    for file in json_folder:
        
        file_path = f"{path}/{file}"
        
        if ".json" in file:
            j = json.load(open(file_path))
            
            #j = dictionary, j['abstract'] = list, par = dictionary, par['text'] = String
            if j["abstract"] != []:
                for par in j["abstract"]:
                    par_text = par["text"]
                    output_text.write(par_text)
                output_text.write("\n")
