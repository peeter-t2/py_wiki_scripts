# Py_Retrieve_wikipedia_course_comments

A short snippet I made to retrieve comments from an educational wikipedia programme.

It relies on libraries "wikipedia", "re", "itertools", "_pickle"


Works in Python 3.5. In Python 2.7 "import cPickle" can b used instead. It may need some other updates.


To run

1) First import_wikipedia_pub.py which collects all the links to the relevant texts into a local pickle file save.p.

2) Then run read_wikipedia_links_pub.py	which reads the current text available on those links and collects it into a text file.


output _24.11.2015_500k_w.txt is the output from 24.11.2015.

reproduceerror_SO.py and wikipedia_backup.py are files just used in building the script and are not relevant at the moment.
