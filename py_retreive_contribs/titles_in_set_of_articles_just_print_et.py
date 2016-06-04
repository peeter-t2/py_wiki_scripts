# -*- coding: utf-8 -*-
#import wikipedia
import mwclient
from pprint import pprint
import cPickle
import codecs
import re

#links = cPickle.load(open('outputs/save2.p', 'rb'))


site = mwclient.Site('et.wikipedia.org')

#allpages= site.allpages()
#allcategories= site.allcategories()
list1 =[]
print(site.Categories['Bioloogia'])
for page in site.Categories['Bioloogia']: #'Surnud 1390']:
    print(page.name)
    #print(page.text())
    #results = re.findall('==((\w+)|(\s+)){1,9}==', page.text())
    #results = re.findall('=+[a-zA-ZõäöüÕÄÜÖ ]+=+', page.text())
    results = re.findall('=+[\w ]+=+', page.text())
    print(results)
    #list1.append(site.Pages[page.name].text())
print(list1)
#pprint(allusers)
test=[]
total = 1#86787
pages = ["Kasutaja:Adamsont/Nixie toru"]
for pagename in pages:
    page = site.Pages[pagename]
    revisions = page.text()
    #print(revisions)
    #print(counter, "/", total)
    #rev = allusers.next()
    #pprint(rev["name"])
    #contribs = site.usercontributions(rev["name"], prop =['size','sizediff'])
    #contribs = site.usercontributions("Metsavend", start='2015-03-20T00:00:01Z', end='2015-02-20T00:00:01Z',  prop ='title|timestamp|ids|title|size|sizediff')
    #contribs = site.usercontributions("Metsavend", prop =['size','sizediff','ids','title','timestamp','comment','size','flags'])
    #rev2 = contribs.next()
    #pprint(rev2)
#pprint(contribs.uclimit())
    try:
        #for counter in range(2000):
        #    rev2 = contribs.next()
            #pprint(rev2)
            test.append(revisions)
    except StopIteration:
        #if a "PageError" was raised, ignore it and continue to next link
        pass
    
#out_file = codecs.open("contribs_all_max.txt",'w', "utf-8")
#out_file.write('\n***************************\n'.join(test))
#out_file.write("\n".join(str(s) for s in test))
#out_file.close()

cPickle.dump(test, open('outputs/contribs_all_max.p', 'wb'), 2)

