# Week 5 - Homework Q2 & Q3
# NTU student ID: B04B01036
# Lin, Yu-Jen

############################################################
## 3 ##

def reverse_complement(dna):
    # complement
    complement = dna
    # for i in range(0,len(complement)):
    complement = complement.replace("a","x")
    complement = complement.replace("t","y")
    complement = complement.replace("c","z")
    complement = complement.replace("g","w")
    complement = complement.replace("x","T")
    complement = complement.replace("y","A")
    complement = complement.replace("z","G")
    complement = complement.replace("w","C")

    # reverse
    RC_result = complement[::-1]
    return RC_result


############################################################
## 2 ##

# read the file
exons = []
i = -1
print('\n\n\n### ORIGINAL FILE ###\n')
with open('gp9_exons.fasta') as fh:
    exons = []
    for line in fh:
       i = i+1
       exons.append(line)
       
# remove the /n
for i in range(0,len(exons)):
    exons[i] = exons[i].replace("\n","")
    print (exons[i])

# reverse complement (using Q3 function)
print('\n\n\n### REVERSE-COMPLEMENT FILE ###\n')
RC = exons
RC.append('>whole_input_sequences')
RC.append('')

number_of_sequences = 0

for i in range(0, len(RC)-1):
    if (RC[i][0] != '>'): # Not the 'sequence name’, it is a 'real sequence.
        RC[i] = reverse_complement(RC[i])
        RC[len(RC)-1] = RC[i] + RC[len(RC)-1] # reverse complement of the whole input sequences (same as last week's HW)

    if (RC[i][0] == '>'): # Calculate the number of sequences
        number_of_sequences = number_of_sequences + 1


number_of_sequences = number_of_sequences - 1 # minus the '>whole_input_sequences'

for i in range(0, len(RC)):
    print (RC[i])

print('\nThe total number of sequences: ', str(number_of_sequences))

RC_write = ''
for i in range(0, len(RC)):
    RC_write = RC_write + '\n'  + RC[i]

# write file
out_fh = open('gp9_exons_revcomp.fasta','w') # <gp9_exons.fasta.revcomp>
out_fh.write(RC_write)
out_fh.close()

