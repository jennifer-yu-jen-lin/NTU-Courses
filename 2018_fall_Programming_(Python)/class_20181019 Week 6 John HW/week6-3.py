# Week 6 - Homework Q3
# NTU student ID: B04B01036
# Lin, Yu-Jen

############################################################
## USER ##
############################################################

# In this script, users only need to change these three variables.

filename = 'gp9_exons.fasta' # the script that reads this file is written after the function section
letters = 'A'
sig_digits = 2

############################################################
## FUNCTION ##
############################################################

def report_percentages(filename, letters, sig_digits=2):
    # read the file
    i = -1
    with open(filename) as fh:
        input_seq = []
        for line in fh:
           i = i+1
           input_seq.append(line)

    names = [] # the locations of the sequence names
    for i in range(0,len(input_seq)):
        # remove the \n
        input_seq[i] = input_seq[i].replace("\n","")
        
        # search for the locations of the sequence names
        if (input_seq[i][0] == '>'): # The names of the sequences are all start with '>'.
            names.append(i+1) # Record all the locations of the names in this vector.
            # +1 in order to prevent appending a zero into this list.
            # -1 in later steps would compensate for this.
            
    names.append(len(input_seq)+1) # Adding this element helps me count the rows of the last sequence later.

    output = []
    for i in range(len(names)-1): # for each sequence
        sequence_row = names[i+1]-names[i]-1 # the number of the rows of this sequence
        each_seq = ''

        for j in range(sequence_row):
            # In case the sequence covers more than one line, we paste all of the letters for one sequence into one element called each_sequence.
            each_seq = each_seq + input_seq[names[i]+j]
            
            # convert to upper just in case (or lower)
            each_seq = each_seq.upper()

            # total
            total_letters = 0
            
            # count the numeber of the target lettters
            for l in letters:
                l = l.upper()
                total_letters += each_seq.count(l)
            
            # calculate the proportion of the target lettters                
            seq_len = len(each_seq)
            proportion = total_letters/seq_len
            proportion_rounded = round(proportion, sig_digits)

        # collect all the results
        each_name = input_seq[names[i]-1]
        output.append(each_name[1:len(each_name)]) # name without the '>' sign
        output.append(proportion_rounded) # proportion
            
    return output

############################################################
## PRINT THE OUTPUT ##
############################################################

result = report_percentages(filename,letters)
print('The proportion of', letters, ':')
      
for i in range(0,len(result),2):
    print('\t', result[i], ':', result[i+1])
