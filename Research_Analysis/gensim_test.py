import os
import gensim
import smart_open
from gensim.models.doc2vec import Doc2Vec, TaggedDocument
import collections
import random
from gensim.test.utils import get_tmpfile

# Set file names for train and test data
test_data_dir = os.path.join(gensim.__path__[0], 'test', 'test_data')
lee_train_file = os.path.join(test_data_dir, 'lee_background.cor')
lee_test_file = os.path.join(test_data_dir, 'lee.cor')

def read_corpus(corpus_file, tokens_only=False):
    with smart_open.open(corpus_file, encoding="iso-8859-1") as corpus:
        for i, doc in enumerate(corpus):
            token = gensim.utils.simple_preprocess(doc)
            if tokens_only:
                yield token
            else:
                yield TaggedDocument(token, [i])
train_corpus = list(read_corpus("corpus_file.txt")) #each item in the train_corpus is a TaggedDocument of the token (the training corpus MUST consist of TaggedDocuments)
test_corpus = list(read_corpus(lee_test_file, tokens_only=True))

model = Doc2Vec(vector_size=50, min_count=2, epochs=40)
model.build_vocab(train_corpus)
model.train(train_corpus, total_examples=model.corpus_count, epochs=model.epochs)

model.save("cac_model.txt")

model = Doc2Vec.load("cac_model.txt")  # you can continue training with the loaded model!

# Pick a random document from the test corpus and infer a vector from the model
doc_id = random.randint(0, len(test_corpus) - 1)
inferred_vector = model.infer_vector(test_corpus[doc_id])
sims = model.docvecs.most_similar([inferred_vector], topn=len(model.docvecs))

# Compare and print the most/median/least similar documents from the train corpus
print('Test Document ({}): «{}»\n'.format(doc_id, ' '.join(test_corpus[doc_id])))
print(u'SIMILAR/DISSIMILAR DOCS PER MODEL %s:\n' % model)
for label, index in [('MOST', 0), ('MEDIAN', len(sims)//2), ('LEAST', len(sims) - 1)]:
    print(u'%s %s: «%s»\n' % (label, sims[index], ' '.join(train_corpus[sims[index][0]].words)))
