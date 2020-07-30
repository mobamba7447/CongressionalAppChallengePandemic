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
            
          
def read_corpus(corpus_file, tokens_only=False):
    with smart_open.open(corpus_file, encoding="iso-8859-1") as corpus:
        for i, doc in enumerate(corpus):
            token = gensim.utils.simple_preprocess(doc)
            if tokens_only:
                yield token
            else:
                yield gensim.models.doc2vec.TaggedDocument(token, [i])
train_corpus = list(read_corpus("stringprocessing.txt"))
print(train_corpus)

model = gensim.models.doc2vec.Doc2Vec(vector_size=100, min_count=7, epochs=40)
model.build_vocab(train_corpus)
model.train(train_corpus, total_examples=model.corpus_count, epochs=model.epochs)