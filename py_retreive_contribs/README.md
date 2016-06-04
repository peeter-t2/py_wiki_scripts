# Py_Retreive_wikipedia_course_all_contributions

This code snippet builds on https://github.com/peeter-t2/Py_Retrieve_wikipedia_course_comments and is has a rather complex work-flow to solve practical issues. 

It relies on modules "wikipedia", "re", "itertools", "_pickle", as the other script. Now also "mwclient" module is needed.

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

For analyzing wikipedia competitions. (11.03.2016)

Files that matter are import_wikipedia_users_comp.py, convert_all_contribs.py, contribs_all_authors_max.py, scriptone2.R

They need to be configured for particular competitions and may not work alwasy (e.g. there are some problems initially with "-" in the pagenames. Possibly this has an easy fix)

1. Run import_wikipedia_users_comp.py to get names of articles and users in the competition. Save them to a file (have to copy the commands from import_wikipedia_users.py). #Py 3.5
2. Run contribs_all_authors_max.py with the required parameters, primarily need to read the usernames into it and specify the duration of the competition (start=later time, end=earlier time). You can see the results in the .txt file generated. #Py 2.7
3. Run convert_all_contribs.py on the generated .py file. This will convert it into a csv with "@" as separator. #Py 3.5
4. Open scriptone2.R to look at the csv. There you need to open the lists of articles, take the subset of the contributions with the list of articles, and sum the sizediffs together. #R


With a fixed list (01.04.2016) 

1. Collect comma-separated usernames into format "username1", "username2" and put them into the array allusers in contribs_all_authors_custom.py. quote marks can be added in find+replace in notepad++ or elsewhere.
2. Add the date in question. UTC+3 = subtract 2 hours from absolute times. start = finishing date and end = starting date, because the way wikipedia processes the command.
3. Name output files and run the contribs_all_authors_custom.py. #Py 2.7
4. Run convert_all_contribs.py on the generated .py file. This will convert it into a csv with "@" as separator. #Py 3.5
5. Open the output file with scriptonett.R, add the fixed list of titles to the variables into titles1-5 variables. R can't deal with too long hard-coded lists, so need to split.
6. Run the commands, the last one sum(agg_results$absdiff), gets the number needed to evaluate wiki-competitions.
