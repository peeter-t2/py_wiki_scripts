
import _pickle as cPickle



links = cPickle.load(open('outputs/save.p', 'rb'))
cPickle.dump(links, open('outputs/save2.p', 'wb'), 2) 
