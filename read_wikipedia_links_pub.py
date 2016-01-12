#!/usr/bin/env python
# -*- coding: utf-8 -*-

import wikipedia
import re
import itertools
import _pickle as cPickle

# Set language to Estonian
wikipedia.set_lang("et")

# Open the links stored with the previosu function
links = cPickle.load(open('save.p', 'rb'))
#Show the links
#print(links)
test=[]
counter=0
total = len(links)
print("Trying to read from", total, "number of pages (missing pages will be skipped).",sep=" ")
for link in links:
    counter = counter +1
    print(counter, "/", total,sep="")
    try:
        #try to load the wikipedia page
        page=wikipedia.page(link, auto_suggest=False)
        test.append(page.title)
        test.append(page.content)
    except wikipedia.exceptions.PageError:
        #if a "PageError" was raised, ignore it and continue to next link
        continue
    
#Old functions - don't work with empty links (help from StackOverflow)
#test = [wikipedia.page(link, auto_suggest=False) for link in links[0:3]]
#test = [testitem.content for testitem in test]
#matching = [s for s in links if "Kasutaja" in s]
#test = [wikipedia.page(link, auto_suggest=False).content for link in links[2:3]]
#print(test)


out_file = open("outputn.txt",'w', encoding="utf-8")
out_file.write('\n***************************\n'.join(test))
out_file.close()

