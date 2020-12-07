# HW8_1 Add File I/O function to Grade System
# Lin, Yu-Jen
# NTU student ID: B04B01036


database = {}
max_items = 0;


def save(filename): # save the database to a file
                    # remember max_items!
    database.update({'m':max_items}) # add max_items to the database, will be deleted when loading this file.
    full_filename = filename + '.txt'
    file = open(full_filename, 'w')
    file.write(repr(database))
    file.close()


def load(filename): # reload the database from a file
    full_filename = filename + '.txt'
    file = open(full_filename,'r')
    load_database = eval(file.read())
    file.close()
    global max_items # need this in other function
    max_items = load_database['m'] # retrieve the max_items
    del(load_database['m']) # don't want this be in the database
    global database # need this in other function
    database = load_database


def export_to_txt(filename): # save to CSV format
                             # no need to export max_items here
    import csv
    file = open(filename, 'w')
    w = csv.DictWriter(file, database.keys())
    w.writeheader()
    w.writerow(database)
    file.close()


def import_from_txt(filename): # import from CSV format
                               # set_max is set as the number of items
                               # in the loaded file
    import csv
    data =open(filename, encoding = 'utf=8') # Python defult: ASCII
    reader = csv.reader(data, delimiter=",") # CSV file is separated by commas. (CSV=Comma-Separated Values)

    total_row = []
    for row in reader:
        total_row.append(row)
    keys = total_row[0]
    values = total_row[1]

    result = {}
    for i in range(len(keys)):
        result[keys[i]] = eval(values[i])

    global database # need this in other function
    database = result

    global max_items # need this in other function
    max_items = len(keys) # set_max is set as the number of items


# others from grade_module.py


def set_max(x):# set a limit on database size
    global max_items
    max_items = x


def add(name, grade):
    if len(database)+1 > max_items:
        return -1, max_items # when the number of item reaches maximum
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
              #          *Jerry:50
              #
              # print '(No data)' when the database is empty
    if len(database) == 0:
        print('(No data)')
    else:
        database_sort = sorted(database.keys(), key=database.get, reverse=True)
        for name_i in database_sort:
            if database[name_i] >= 60:
                print(name_i, ':', database[name_i], sep='')
            else:
                print('*', name_i, ':', database[name_i], sep='')


def watchlist(): # return a list of names with grades under 70
    watchlist = []
    for name, grade in database.items():
        if grade < 70:
            watchlist.append(name)
    return(watchlist)

            
def mean_and_max():# return mean and sum of the database
    grade_mean = sum(database.values())/len(database.values())
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


