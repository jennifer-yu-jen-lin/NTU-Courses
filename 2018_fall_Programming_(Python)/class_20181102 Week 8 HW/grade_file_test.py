# HW8_1 Add File I/O function to Grade System (testing file)
# Lin, Yu-Jen
# NTU student ID: B04B01036


import grade_file

grade_file.set_max(4)

grade_file.add('Tom',50)
grade_file.add('Jerry',70)
grade_file.add('Sally',90)

grade_file.save('database')
print('Reload grade_file...')

from importlib import reload # added, in order to reload in my environment
reload(grade_file)
grade_file.load('database')
print('Load database from file')
grade_file.output()
grade_file.add('Jane',100)
grade_file.add('Justin',100)

grade_file.export_to_txt('database.csv') # Though the name of the function is export to txt, it is actually to csv.

print('Reload grade_file...')
reload(grade_file)
grade_file.import_from_txt('database.csv') # Though the name of the function is import from txt, it is actually from csv.
print('Import database from CSV file')
grade_file.output()


