#!/usr/bin/env python
# coding: utf-8

# In[16]:


name= ""
name_keyin = []
grade = 0
database = {}
while name != "OK":
    name = input("Enter name: ")
    if name == "OK":
        print("stop")
        break
    if name in name_keyin:
        print("Already in database")
        continue
    name_keyin.append(name)
    grade = input("Enter grade: ")
    database[name]= int(grade)

#sort by value
name_list = database.keys()
sorted_db = sorted(name_list, key=database.get)
for student in sorted_db:
    print(student, ":", database[student])

#print out average and max
grade_list = database.values()
AVG = sum(grade_list)/ len(name_list)
print("the average grade is: ", AVG)
MAX = max(grade_list)
print("the highest score is:", MAX)

#search by name
name_to_find = input('Name to find: ')
if name_to_find in name_list:
    corresspond_grade = database[name_to_find]
    if int(corresspond_grade) < float(AVG):
        print("!", corresspond_grade)
    else:
        print(corresspond_grade)
else:
    print("Not found")

#search by grade
grade_to_find = int(input('Grade to find: '))
    
for name, grade in database.items():
    if grade == grade_to_find:
        print(name)


# In[ ]:




