# -*- coding: utf-8 -*-
# code adapted from https://github.com/mwclient/mwclient/wiki/Tutorial:Creating-a-page-listing-all-pages-in-a-category
# adapted 20.05.2016 by Peeter Tinits
# works with Python 2.7, can do utf-8

import mwclient
import codecs
site = mwclient.Site('de.wikiquote.org')
text = "" 
for page in site.Categories['Deutscher']:
    text += "" + page.name + "\n"
#print(text)

out_file = codecs.open("cats.txt",'w', "utf-8")
out_file.write(text)
out_file.close()
