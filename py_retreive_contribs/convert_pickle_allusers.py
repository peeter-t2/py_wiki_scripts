#!/usr/bin/env python
# -*- coding: cp1257 -*-
# mess encoding-wise

import codecs

import _pickle as cPickle
from time import mktime


test = cPickle.load(open('outputs/contribs_all.p', 'rb'))

#print(test)

import csv
keys = [u'comment', u'pageid', u'title', u'timestamp', u'top', u'userid', u'revid', u'user', u'parentid', u'ns', u'minor', u'size',u'new']#test[1].keys()
print(len(test))

for item in test:
    item["timestamp"] = mktime(item.get("timestamp"))

with open('outputs/allusers.csv', 'w', encoding='utf-8', newline='') as output_file:
    #print(keys)
    # @ works here
    dict_writer = csv.DictWriter(output_file, keys, delimiter='@')
    dict_writer.writeheader()
    #print(test)
    dict_writer.writerows(test)
#print(test)

# have got last of each

# still need all of each

# metadata (on intruduction of usernames: field, year
