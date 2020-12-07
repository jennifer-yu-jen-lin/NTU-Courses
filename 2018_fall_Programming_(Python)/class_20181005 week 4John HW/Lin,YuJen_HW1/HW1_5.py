# Lin, Yu-Jen 
# NTU: B04B01036
# HW1_5
# Text munging: Count the number of “the” and “and” words in <watson_crick_paper.txt>.

# read file
paper_file = 'watson_crick_paper.txt'
fh = open(paper_file, 'r')
paper = fh.read()
fh.close()

# count
the_count1 = paper.count(' the ') # with space, in order to make sure we won't count other words, like 'there'.
the_count2 = paper.count('The ')
and_count1 = paper.count(' and ')
and_count2 = paper.count('And ')

the_count_total = the_count1 + the_count2
and_count_total = and_count1 + and_count2
total = the_count_total + and_count_total

print("the total number of 'the's is: " + str(the_count_total))
print("the total number of 'and's is: " + str(and_count_total))
print("the total number of 'the's + 'and's is: " + str(total))
