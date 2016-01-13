# Py_Retreive_wikipedia_course_all_contributions

This code snippet builds on https://github.com/peeter-t2/Py_Retrieve_wikipedia_course_comments and is has a rather complex work-flow to solve practical issues. 

It has been tested on Windows 10, and designed for Windows environments. Main difference between op-systems may be in character encoding, which probably makes Windows more complicated to work with.

Due to mwclient not yet supporting Python 3.5, but other parts of the software relying on it, both versions have to be used. For each file the required version is stated.

1. Run import_wikipedia_pub.py to create save.p #Py 3.5
2. Run pickle_convert.py to create save2.p #Py 3.5
3. Run usercontribs.py to get create save_contribs.p #Py 2.7
4. Run onemore.py to get people_all.csv #Py 3.5
5. The R script scriptone.R can then process people_all.csv

To get additional information

1. Run import_wikipedia_users.py to get pickle files separate for each year #Py 3.5
2. Run pickleconvert2.py to convert them into text files #Py 3.5
3. Copy the text files into an excel file, and annotate each by the year of the filename, split the text into columns of username and chosen article
4. Save the excel file as userlist.csv
5. This userlist.csv can then be read by scriptone.R and used in the analysis to include the information on designated articles and when they were supposed to be completed. This is to eventually separate obligatory tasks on wikipedia from optional tasks

The code gathers the links as in the original repository

Added new function: to import all contributions within a wikipedia (must know total number of users which is hardcoded)' To test it, try for example 20 users, - results in allusers_20.csv at the moment.

1. Run contribs_all_authors.py to create contribs_all.p
2. Run convert_all.py to create allusers.csv
3. This can be analyzed with script all_users.R (now stuck at getting the time series read)

