#import wikipedia
import mwclient
from pprint import pprint
import cPickle



links = cPickle.load(open('save2.p', 'rb'))


site = mwclient.Site('et.wikipedia.org')

contribs = site.usercontributions('Chrloob')
#pprint(contribs.uclimit())
try:
    for counter in range(20):
        rev = contribs.next()
        pprint(rev)
except StopIteration:
        #if a "PageError" was raised, ignore it and continue to next link
    pass
