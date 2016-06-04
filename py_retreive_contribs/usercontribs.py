
#import wikipedia
#mw client is limited to Python 2.7, can run in development mode up to Python 3.4
import mwclient
from pprint import pprint
import cPickle

#test = wikipedia.usercontributions("Pusle8")

#print(test)


#useragent = 'YourBot, based on mwclient v0.7.2. Run by User:You, you@gmail.com'
#site = mwclient.Site(('https', 'en.wikipedia.org'), clients_useragent=useragent)
#page = site.Pages['Main page']
#print(page.content)

#site = mwclient.Site('commons.wikimedia.org')
#site.login(username, password)
#page = site.Pages['Commons:Sandbox']
#text = page.text()
#print(text)

links = cPickle.load(open('save2.p', 'rb'))


site = mwclient.Site('et.wikipedia.org')
#page = site.Pages['Wikipedia:Sandbox']
#revisions = page.revisions()

#for counter in range(5):
#    rev = revisions.next()
#    pprint(rev)

#contribs = site.usercontributions('Chrloob')
#for counter in range(2):
#    rev = contribs.next()
#    pprint(rev)

names = [link.replace('Kasutaja_arutelu:', '',) for link in links]
names = [link.split('/', 1)[0] for link in names]
names.append('Pusle8')

#print(names)


test=[]
counter=0
total = len(names)
print("Trying to read from", total, "number of pages (missing pages will be skipped).")
for name in names:
    #name=('Pusle8')
    #print(name)
    counter = counter +1
    print(counter, "/", total)
    
    try:
    #try to load the wikipedia page
        page=site.usercontributions(name)
        #print(page)    
        #test.append(page)
        for counter2 in range(500):
            rev = page.next()
            test.append(rev)
            #test.append(page.title)
            #test.append(page.content)
    #for counter in range(2):
    #        rev = contribs.next()
    #        pprint(rev)
    except StopIteration:
        #if a "PageError" was raised, ignore it and continue to next link
        continue
    
#Old functions - don't work with empty links (help from StackOverflow)
#test = [wikipedia.page(link, auto_suggest=False) for link in links[0:3]]
#test = [testitem.content for testitem in test]
#matching = [s for s in links if "Kasutaja" in s]
#test = [wikipedia.page(link, auto_suggest=False).content for link in links[2:3]]
#print(test)
#print(test)
#print('\n***************************\n'.join(test))

out_file = open("outputcontribs.txt",'w')
#out_file.write('\n***************************\n'.join(test))
out_file.write("\n".join(str(s) for s in test))
out_file.close()

cPickle.dump(test, open('save_contribs.p', 'wb'), 2)

#print(test)

#Following is transformed into Python 3.5 for better writing resources
#import csv
#keys = [u'comment', u'pageid', u'title', u'timestamp', u'top', u'userid', u'revid', u'user', u'parentid', u'ns', u'minor', u'size',u'new']#test[1].keys()
#print(test[0].keys())
#print(test[1].keys())
#print(test[2].keys())
#print(test[3].keys())
#print(test[4].keys())
#print(test[5].keys())
#print(test[6].keys())
#print(test[7].keys())
#/print(test[8].keys())
#with open('people.csv', 'wb') as output_file:
#    #print(keys)
#    dict_writer = csv.DictWriter(output_file, keys)
#    dict_writer.writeheader()
#    #print(test)
##   dict_writer.writerows(test)

