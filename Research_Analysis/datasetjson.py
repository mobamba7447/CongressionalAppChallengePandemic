import os 
import json
import gensim
import smart_open
os.chdir("/Users/jahankhan/CongressionalAppChallengePandemic/Research_Analysis/NLPModel")
path = "/Users/jahankhan/CongressionalAppChallengePandemic/Research_Analysis/NLPModel/DatasetCORD"
json_folder = os.listdir(path)
with open("stringprocessing.txt", "w") as output_text:
    for file in json_folder:
        
        file_path = f"{path}/{file}"
        
        if ".json" in file:
            j = json.load(open(file_path))
            for par in j["abstract"]:
                par_text = par["text"]
                output_text.write(par_text + "\n")
            
          
def read_corpus(file_name, tokens_only=False):
    with smart_open.open(file_name, encoding="iso-8859-1") as file:
        for i, line in enumerate(file):
            tokens = gensim.utils.simple_preprocess(line)
            if tokens_only:
                yield tokens
            else:
                yield gensim.models.doc2vec.TaggedDocument(tokens, [i])
train_corpus = list(read_corpus("stringprocessing.txt"))
print(train_corpus)
