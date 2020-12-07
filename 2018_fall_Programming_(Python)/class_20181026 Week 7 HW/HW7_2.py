# HW7_2 Implement the Grade System using Dict
# Lin, Yu-Jen
# NTU student ID: B04B01036

# input name and grade. Terminated when name is 'OK'
# When a name exists in the database, print 'Already in database' and ignore it
database = {}
name = ''
while name!= "OK":
    name = input('Enter name: ')
    if name == "OK":
        break
    if name in database:
        print('Already in database')
        continue
    else:
        grade = input('Grade: ')
        database.update({name:eval(grade)})


# Print the database in a sorted order, with names marked with * when unqalified
# ex:
# Tom:100
# *Jerry:50
print('\nGrade database')
database_sort = sorted(database.keys(), key=database.get, reverse=True)
for name_i in database_sort:
    if database[name_i] >= 60:
        print(name_i, ":", database[name_i], sep='')
    else:
        print('*', name_i, ":", database[name_i], sep='')


# Print the mean and max of all grades in database
# ex:
# Mean: 50.0, Max: 100
grade_mean = sum(database.values())/len(database.values())
grade_max = max(database.values())
print('Mean: ', grade_mean, ', Max: ', grade_max, '\n', sep='')


# Input a name and find the grade of the name
# If found, print his/her grade and marked '!' if his grade is lower than average
# If not found, print 'Not found'
# Ex.
# Name to find: Jerry
# !50
name_to_find = input('Name to find: ')
if name_to_find in database.keys():
    name_to_find_grade = database[name_to_find]
    if name_to_find_grade < grade_mean:
        print('!', name_to_find_grade,'\n', sep='')
    else:
        print(name_to_find_grade,'\n')
else:
    print('Not found\n')


# Input a grade and find all the name with the same grade
# If found, print his/her grade
# If not found, print 'Not found'
grade_to_find = input('Grade to find: ')
k = '' # help me to decide when to print 'Not found'
for n, g in database.items():
    if float(g) == float(grade_to_find):
        print(n)
        k = n
if k == '':
    print('Not found')

