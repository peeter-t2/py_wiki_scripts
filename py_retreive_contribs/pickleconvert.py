
import _pickle as cPickle



links = cPickle.load(open('save.p', 'rb'))
cPickle.dump(links, open('save2.p', 'wb'), 2) 
