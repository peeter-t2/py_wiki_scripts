
import _pickle as cPickle



links = cPickle.load(open('outputs/contribs_all_max.p', 'rb'))
#cPickle.dump(links, open('save2.p', 'wb'), 2) 


out_file = open("outputs/output20152.txt",'w', encoding="utf-8")
out_file.write('\n'.join(links))
out_file.close()
