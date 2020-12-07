# HW8_2 Add Validation function to Grade System (testing file)
# Lin, Yu-Jen
# NTU student ID: B04B01036

## Some modifications that different from the file provided by the professor are marked as '# added by myself'.

import grade_complete

# set_max
try: # try a non-integer number
	grade_complete.set_max(4.1)
except ValueError:
	print('ValueError occurs. Input of set_max must be positive integer.')

try: # try nagative number # added by myself
	grade_complete.set_max(-3)
except ValueError:
	print('ValueError occurs. Input of set_max must be positive integer.')

grade_complete.set_max(4)


# add
grade_complete.add('Tom',50)
grade_complete.add('Jerry',70)
grade_complete.add('Sally',90)

try: # try a grade that is not a number # added by myself
	grade_complete.add('Strange','ninety')
except ValueError:
	print('ValueError occurs. Grade input must be a number range from 0 to 100.')

try: # try a grade that is not range from 0 to 100
	grade_complete.add('Strange',-1)
except ValueError:
	print('ValueError occurs. Grade input must be a number range from 0 to 100.')


# del
grade_complete.remove('name_not_in_database') # added by myself


# save
grade_complete.save('database')


# reload
from importlib import reload # added by myself, in order to reload in my environment
reload(grade_complete)


# load
grade_complete.load('database_wrong')
grade_complete.load('database')


## output
grade_complete.output()


# import_from_txt
grade_complete.import_from_txt('database_wrong.csv') # added by myself

