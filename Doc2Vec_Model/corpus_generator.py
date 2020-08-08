import os
import json
import gensim

path = "/Users/reynoldbascos/Doc2Vec_Model_Test/551982_1395193_bundle_archive/document_parses/pdf_json"
json_folder = os.listdir(path)
with open("cord-19_corpus.txt", "w") as output_text:
    for file in json_folder:
        
        file_path = f"{path}/{file}"
        
        if ".json" in file:
            j = json.load(open(file_path))
            
            #j = dictionary, j['abstract'] = list, par = dictionary, par['text'] = String
            if j["body_text"] != []:
                for par in j["body_text"]:
                    par_text = par["text"]
                    output_text.write(par_text)
                output_text.write("\n")
