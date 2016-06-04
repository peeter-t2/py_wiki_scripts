#!/usr/bin/env python
# -*- coding: utf-8 -*-
#import site; nmn = site.getsitepackages()
#print(nmn)
#edited C:\Users\Meduus\AppData\Local\Programs\Python\Python35-32\Lib\site-packages\wikipedia\wikipedia.py
# to include 'Kasutaja' instead of 0 in line 611 for namespace

import wikipedia
import re
import itertools
import _pickle as cPickle

#Set language to Estonian
wikipedia.set_lang("et")

#Test on one page:
#To get the pages utf-8 can be used in the query
#Töötab Jõgevamaa, aga mitte Lääne-viruga, mingi jama on sidekriipsuga
m = wikipedia.page("Vikipeedia:Jõgevamaa artiklivõistlus/Registreerimine")
#m = wikipedia.page("Vikipeedia:Ida-virumaa artiklivõistlus/Registreerimine")
#The following does not get the same results
#m = wikipedia.page("Vikipeedia:V%C3%A4ljendus%C3%B5petus/Geograafia")
# Important! The wikipedia Python library has been edited to include the namespace "Kasutaja" on links, otherwise it would not return "Kasutaja" links.
mlinks = m.links
print(mlinks)
#Couldn't loop the more advanced sub funciton.
#npage= re.sub(":","_arutelu:","Kasutaja:LKabonen/geoturundus")
npage= mlinks
#npage = [link.replace(':', '_arutelu:',) for link in mlinks]
#print(npage)
#Find the ones that link to user namespaces (= Kasutaja)
no_kasutaja = [s for s in npage if not "Kasutaja" in s]
artiklid = [s for s in no_kasutaja if not "Vikipeedia" in s]
kasutajad = [s for s in npage if "Kasutaja" in s]
nimed = [link.replace('Kasutaja:', '',) for link in kasutajad]
#print(matching)
print(artiklid)
print(nimed)

# Do this for the entire set (predefined and following the structure we have)
#array1= ["Vikipeedia:Väljendusõpetus/Arvutitehnika","Vikipeedia:Väljendusõpetus/Bioloogia","Vikipeedia:Väljendusõpetus/Füüsika", "Vikipeedia:Väljendusõpetus/Geenitehnoloogia", "Vikipeedia:Väljendusõpetus/Geograafia", "Vikipeedia:Väljendusõpetus/Geoloogia", "Vikipeedia:Väljendusõpetus/Keemia", "Vikipeedia:Väljendusõpetus/Keskkond", "Vikipeedia:Väljendusõpetus/Materjaliteadus", "Vikipeedia:Väljendusõpetus/Ökoloogia"]
#array2= [s + "/2012" for s in array1]
#array3= [s + "/2013" for s in array1]
#array4= [s + "/2014" for s in array1]
#full_array= array1.extend(array2+array3+array4)
#full_array= array1
#full_array= full_array.extend(array2)
#full_array= full_array.extend(array3)
#full_array= full_array.extend(array4)
#Extend them together
#full_array= array1+array2+array3+array4
#print(full_array)
