#import wikipedia
import mwclient
from pprint import pprint
import cPickle



links = cPickle.load(open('save2.p', 'rb'))


site = mwclient.Site('et.wikipedia.org')

allusers = site.allusers(witheditsonly=False)

pprint(allusers)
test=[]
total = 85157

for counter in range(total):
    print(counter, "/", total)
    rev = allusers.next()
    #pprint(rev["name"])
    contribs = site.usercontributions(rev["name"])
    #rev2 = contribs.next()
    #pprint(rev2)
#pprint(contribs.uclimit())
    try:
        for counter in range(20):
            rev2 = contribs.next()
            #pprint(rev2)
            test.append(rev2)
    except StopIteration:
        #if a "PageError" was raised, ignore it and continue to next link
        pass
    
out_file = open("contribs_all.txt",'w')
#out_file.write('\n***************************\n'.join(test))
out_file.write("\n".join(str(s) for s in test))
out_file.close()

cPickle.dump(test, open('contribs_all.p', 'wb'), 2)

