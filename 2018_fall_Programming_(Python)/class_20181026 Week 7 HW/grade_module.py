# HW7_3 Make Grade System using Module
# Lin, Yu-Jen
# NTU student ID: B04B01036

database = {}
max_items = 0

def set_max(x):# set a limit on database size
    global max_items
    max_items = x


def add(name, grade):
    if len(database)+1 > max_items:
        return -1 # when the number of item reaches maximum
                  # , ignore the input and return -1
    else:
        if name in database.keys():
            return -1 # or the name is already in the database
                      # , ignore the input and return -1 
        else:
            database.update({name:grade})
            return 0 # otherwise, add the name,grade and return 0
    

def remove(name):
    del(database[name])


def output(): # Print the database in a sorted order
              # format: 'Tom:100
              #          Jerry:*50
              #
              # print '(No data)' when the database is empty
    database_sort = sorted(database.keys(), key=database.get, reverse=True)
    for name_i in database_sort:
        if database[name_i] >= 60:
            print(name_i, ':', database[name_i], sep='')
        else:
            print(name_i, ':*', database[name_i], sep='') # as the description in this function demands
            # print(name_i, ':', database[name_i], sep='') # alternative output(same as the output file from Prof.)

def watchlist(): # return a list of names with grades under 70
    watchlist = []
    for name, grade in database.items():
        if grade < 70:
            watchlist.append(name)
    return(watchlist)

            
def mean_and_max():# return mean and sum of the database
    grade_mean = int(sum(database.values())/len(database.values()))
                # use 'int' to get the same output as the output file from Prof. (integer)
    grade_max = max(database.values())
    return(grade_mean,grade_max)


def find(name): # Return the grade of the name
                # If not found, return -1
    name_to_find = name
    if name_to_find in database.keys():
        name_to_find_grade = database[name_to_find]
        return name_to_find_grade
    else:
        return -1

