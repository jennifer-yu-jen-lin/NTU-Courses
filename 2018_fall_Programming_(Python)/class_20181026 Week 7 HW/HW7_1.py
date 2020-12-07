# HW7_1 Implement the Grade System using List
# Lin, Yu-Jen
# NTU student ID: B04B01036

# input name and grade. Terminated when name is 'OK'
# When a name exists in the database, print 'Already in database' and ignore it
name = []
name_i = ''
grade = []
grade_i = ''
while name_i!= "OK":
    name_i = input('Enter name: ')
    if name_i == "OK":
        break
    if name_i in name:
        print('Already in database')
        continue
    else:
        grade_i = input('Grade: ')
    name.append(name_i)
    grade.append(eval(grade_i))


# Print the database in a sorted order, with names marked with * when unqalified
# ex:
# Tom:100
# *Jerry:50
grade,name = zip(*sorted(zip(grade,name),reverse=True))
print('\nGrade database')
for n, g in zip(name, grade):
    if g >= 60:
        print(n, ':', g, sep='')
    else:
        print('*', n, ':', g, sep='')

# Print the mean and max of all grades in database
# ex:
# Mean: 50.0, Max: 100
grade_mean = sum(grade)/len(grade)
grade_max = max(grade)
print('Mean: ', grade_mean, ', Max: ', grade_max, '\n', sep='')


# Input a name and find the grade of the name
# If found, print his/her grade and marked '!' if his grade is lower than average
# If not found, print 'Not found'
# Ex.
# Name to find: Jerry
# !50
name_to_find = input('Name to find: ')
if name_to_find in name:
    i = name.index(name_to_find)
    if grade[i] < grade_mean:
        print('!', grade[i],'\n', sep='')
    else:
        print(grade[i],'\n')
else:
    print('Not found\n')

# Input a grade and find all the name with the same grade
# If found, print his/her grade
# If not found, print 'Not found'
grade_to_find = input('Grade to find: ')
if eval(grade_to_find) in grade: 
    j = grade.index(eval(grade_to_find))
    print(name[j])
else:
    print('Not found')

