# Lin, Yu-Jen 
# NTU: B04B01036
# HW1_4
# Calculate %AT for each exon as well as the entire sequence

# read file
seq_file = 'gp9_exons_simple.txt'
fh = open(seq_file, 'r')
myseq = fh.read()
fh.close()

# AT %
myseq = myseq.replace("\n","")

a_count1 = myseq.count('a')
c_count1 = myseq.count('c')
g_count1 = myseq.count('g')
t_count1 = myseq.count('t')

AT = (a_count1 + t_count1) / (a_count1 + t_count1 + c_count1 + g_count1)

print("AT = " + str(AT) + " %")
