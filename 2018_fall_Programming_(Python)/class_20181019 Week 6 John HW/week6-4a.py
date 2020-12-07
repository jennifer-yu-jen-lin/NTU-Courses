# Week 6 - Homework Q4 a
# NTU student ID: B04B01036
# Lin, Yu-Jen

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
## ASSERT ##
############################################################

print('Start assertion tests (only return wrong testing results)\nIf nothing is returned, this means every test is correct.')

# ONE LETTER

# test the original sequence file (lower case)
assert report_percentages('gp9_exons.fasta','A') == ['exon1', 0.19, 'exon2', 0.28, 'exon3', 0.36, 'exon4', 0.38, 'exon5', 0.41]

# test the sequence file with mixed case
assert report_percentages('gp9_exons_mix.fasta','A') == ['exon1', 0.19, 'exon2', 0.28, 'exon3', 0.36, 'exon4', 0.38, 'exon5', 0.41]

# test the the sequence file with upper case
assert report_percentages('gp9_exons_upper.fasta','A') == ['exon1', 0.19, 'exon2', 0.28, 'exon3', 0.36, 'exon4', 0.38, 'exon5', 0.41]

# test the sequence file that one sequece is separated into several lines
assert report_percentages('gp9_exons_SeqSepatetedLines.fasta','A') == ['exon1', 0.19, 'exon2', 0.28, 'exon3', 0.36, 'exon4', 0.38, 'exon5', 0.41]

# test the sequence file that only contains one sequence
assert report_percentages('gp9_exons_OneSeq.fasta','A') == ['exon1', 0.19]


# TWO LETTERS

# test the original sequence file (lower case)
assert report_percentages('gp9_exons.fasta','AT') == ['exon1', 0.67, 'exon2', 0.52, 'exon3', 0.6, 'exon4', 0.57, 'exon5', 0.7]

# test the sequence file with mixed case
assert report_percentages('gp9_exons_mix.fasta','AT') == ['exon1', 0.67, 'exon2', 0.52, 'exon3', 0.6, 'exon4', 0.57, 'exon5', 0.7]

# test the the sequence file with upper case
assert report_percentages('gp9_exons_upper.fasta','AT') == ['exon1', 0.67, 'exon2', 0.52, 'exon3', 0.6, 'exon4', 0.57, 'exon5', 0.7]

# test the sequence file that one sequece is separated into several lines
assert report_percentages('gp9_exons_SeqSepatetedLines.fasta','AT') == ['exon1', 0.67, 'exon2', 0.52, 'exon3', 0.6, 'exon4', 0.57, 'exon5', 0.7]

# test the sequence file that only contains one sequence
assert report_percentages('gp9_exons_OneSeq.fasta','AT') == ['exon1', 0.67]



##   If it is correct, Python won't return anything.
##   Python will only return the wrong testing results.

