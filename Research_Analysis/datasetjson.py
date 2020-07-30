import os 
import json
import gensim
import smart_open
from gensim.models.doc2vec import Doc2Vec, TaggedDocument

path = "/Users/reynoldbascos/SwiftAppProjects/CongressionalAppChallengePandemic/Research_Analysis/NLPModel/DatasetCORD"
json_folder = os.listdir(path)
with open("stringprocessing.txt", "w") as output_text:
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

def read_corpus(corpus_file, tokens_only=False):
    with smart_open.open(corpus_file, encoding="iso-8859-1") as corpus:
        for i, doc in enumerate(corpus):
            token = gensim.utils.simple_preprocess(doc)
            if tokens_only:
                yield token
            else:
                yield TaggedDocument(token, [i])
train_corpus = list(read_corpus("stringprocessing.txt"))
print(train_corpus)
