# HW8_2 Add Validation function to Grade System (testing file)
# Lin, Yu-Jen
# NTU student ID: B04B01036

import grade_complete

# set_max
try:
	grade_complete.set_max(4.1)
except ValueError:
	print('ValueError occurs')

grade_complete.set_max(4.1) # added, in order to see if I successfully raise an ValueError in set_max function
grade_complete.set_max(4)

# add
grade_complete.add('Tom',50)
grade_complete.add('Jerry',70)
grade_complete.add('Sally',90)
grade_complete.remove('name_not_in_database') # added, in order to test the reomve function
try:
	grade_complete.add('Strange',-1)
except ValueError:
	print('ValueError occurs')

# save
grade_complete.save('database')

# reload
from importlib import reload # added, in order to reload in my environment
reload(grade_complete)

# load
## Don't need this?###################
# try:
# 	grade_complete.load('database_wrong')
# except FileNotFoundError:
# 	print('File not found')

grade_complete.load('database_wrong')
grade_complete.load('database')

## output
grade_complete.output()

# import_from_txt
try:
	grade_complete.load('database_wrong.csv')
except FileNotFoundError:
	print('File not found')

grade_complete.import_from_txt('database_wrong.csv')