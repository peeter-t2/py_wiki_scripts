# -*- coding: utf-8 -*-
#import wikipedia
import mwclient
from pprint import pprint
import cPickle



links = cPickle.load(open('save2.p', 'rb'))


site = mwclient.Site('et.wikipedia.org')

#allusers = site.allusers(witheditsonly=False)

#pprint(allusers)
test=[]
total = 1#86787

#allusers= ["Kuuskinen", "Sacerdos79", "Njosnavelin", "Mesimumm", "Geonarva", "Daniel_charms", "Krr005", "Tkivisik", "Ottosson74", "Morel", "03jansa", "Metsavend", "Kaspaar", "SinineKaelkirjak", "AinAnepaio", "Nefjool", "Helen Verev", "KungFuDuck", "Teilolondon", "Estonianstudents", "Epp", "Avjoska", "Athanasius_Soter", "Astromaailm", "Evelyn111090", "Juhan121", "Mari203", "Marken.raudnagel", "Accuphase", "Sjur", "Maareti", "Ahsoous", "Domini4kanna", "Roosinomm", "8kart", "Viisaar", "hs1802", "AnonüümneLeemur", "Avetoelpt"]
pages = ["Kasutaja:Adamsont/Nixie toru", "Kasutaja:Chrloob/Arvutinägemine"]

for pagename in pages:
    #print(user)
    #print(counter, "/", len(allusers))
    #rev = allusers.next()
    #pprint(rev["name"])
    #contribs = site.usercontributions(rev["name"], prop =['size','sizediff'])
    page = site.Pages[pagename]
    revisions = page.revisions()
    #contribs = site.usercontributions(user, start='2015-04-21T21:59:59Z', end='2015-02-20T22:00:01Z',  prop ='title|timestamp|ids|title|size|sizediff')
    #contribs = site.usercontributions("Metsavend", prop =['size','sizediff','ids','title','timestamp','comment','size','flags'])
    #rev2 = contribs.next()
    #pprint(rev2)
#pprint(contribs.uclimit())
    try:
        for counter in range(5):
            rev2 = revisions.next()
            #pprint(rev2)
            test.append(rev2)
    except StopIteration:
        #if a "PageError" was raised, ignore it and continue to next link
        pass
    
out_file = open("pages_all_vv.txt",'w')
#out_file.write('\n***************************\n'.join(test))
out_file.write("\n".join(str(s) for s in test))
out_file.close()

cPickle.dump(test, open('pagess_all_vv.p', 'wb'), 2)

