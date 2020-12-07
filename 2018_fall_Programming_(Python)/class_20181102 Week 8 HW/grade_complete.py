# HW8_2 Add Validation function to Grade System
# Lin, Yu-Jen
# NTU student ID: B04B01036


database = {}
max_items = 0;


def save(filename):
    database.update({'m':max_items}) # add max_items to the database, will be deleted when loading this file.
    full_filename = filename + '.txt'
    file = open(full_filename, 'w')
    file.write(repr(database))
    file.close()


def load(filename): # If file is not found, print 'File not found'
    # Load function should be able to handle the case that file does not exists.
    try:
        full_filename = filename + '.txt'
        file = open(full_filename,'r')
        load_database = eval(file.read())
        file.close()
        global max_items # need this in other function
        max_items = load_database['m'] # retrieve the max_items
        del(load_database['m']) # don't want this be in the database
        global database # need this in other function
        database = load_database

    except FileNotFoundError:
        print('File not found')


def export_to_txt(filename):
    import csv
    file = open(filename, 'w')
    w = csv.DictWriter(file, database.keys())
    w.writeheader()
    w.writerow(database)
    file.close()


def import_from_txt(filename): # If file is not found, print 'File not found'
    # Import function should be able to handle the case that file does not exists
    import csv
    try:
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

    except FileNotFoundError:
        print('File not found')


def set_max(x): # if x is not a positive integer, raise an ValueError exception
    if x > 0 and x == int(x):
        global max_items
        max_items = x
    else:
        raise ValueError


def add(name, grade): # when grade is not a number, or grade > 100, or grade < 0, raise an ValueError exception
    if type(grade) == int or type(grade) == float:
        if grade < 0 or grade > 100:
            raise ValueError # When the grade is not range from 0 to 100.
        else:
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
    else:
        raise ValueError # When the grade is not not a number.


def remove(name):
    try:
        del(database[name])
    except KeyError:
        print('Name not found')


def output():
    database_sort = sorted(database.keys(), key=database.get, reverse=True)
    for name_i in database_sort:
        if database[name_i] >= 60:
            print(name_i, ':', database[name_i], sep='')
        else:
            print('*', name_i, ':', database[name_i], sep='')


def watchlist():
    watchlist = []
    for name, grade in database.items():
        if grade < 70:
            watchlist.append(name)
    return(watchlist)


def mean_and_max():
    grade_mean = sum(database.values())/len(database.values())
    grade_max = max(database.values())
    return(grade_mean,grade_max)


def find(name):
    name_to_find = name
    if name_to_find in database.keys():
        name_to_find_grade = database[name_to_find]
        return name_to_find_grade
    else:
        return -1

