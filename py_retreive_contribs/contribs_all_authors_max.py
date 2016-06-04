#import wikipedia
import mwclient
from pprint import pprint
import cPickle



links = cPickle.load(open('save2.p', 'rb'))


site = mwclient.Site('et.wikipedia.org')

allusers = site.allusers(witheditsonly=False)

pprint(allusers)
test=[]
total = 1#86787

for counter in range(total):
    print(counter, "/", total)
    rev = allusers.next()
    #pprint(rev["name"])
    #contribs = site.usercontributions(rev["name"], prop =['size','sizediff'])
    contribs = site.usercontributions("Metsavend", start='2015-03-20T00:00:01Z', end='2015-02-20T00:00:01Z',  prop ='title|timestamp|ids|title|size|sizediff')
    #contribs = site.usercontributions("Metsavend", prop =['size','sizediff','ids','title','timestamp','comment','size','flags'])
    #rev2 = contribs.next()
    #pprint(rev2)
#pprint(contribs.uclimit())
    try:
        for counter in range(2000):
            rev2 = contribs.next()
            #pprint(rev2)
            test.append(rev2)
    except StopIteration:
        #if a "PageError" was raised, ignore it and continue to next link
        pass
    
out_file = open("contribs_all_max.txt",'w')
#out_file.write('\n***************************\n'.join(test))
out_file.write("\n".join(str(s) for s in test))
out_file.close()

cPickle.dump(test, open('contribs_all_max.p', 'wb'), 2)

