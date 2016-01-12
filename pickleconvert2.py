
import _pickle as cPickle



links = cPickle.load(open('save2015.p', 'rb'))
#cPickle.dump(links, open('save2.p', 'wb'), 2) 


out_file = open("output2015.txt",'w', encoding="utf-8")
out_file.write('\n'.join(links))
out_file.close()

links = cPickle.load(open('save2012.p', 'rb'))
#cPickle.dump(links, open('save2.p', 'wb'), 2) 


out_file = open("output2012.txt",'w', encoding="utf-8")
out_file.write('\n'.join(links))
out_file.close()


links = cPickle.load(open('save2013.p', 'rb'))
#cPickle.dump(links, open('save2.p', 'wb'), 2) 


out_file = open("output2013.txt",'w', encoding="utf-8")
out_file.write('\n'.join(links))
out_file.close()


links = cPickle.load(open('save2014.p', 'rb'))
#cPickle.dump(links, open('save2.p', 'wb'), 2) 


out_file = open("output2014.txt",'w', encoding="utf-8")
out_file.write('\n'.join(links))
out_file.close()
