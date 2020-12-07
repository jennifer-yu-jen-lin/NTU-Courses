# Lin, Yu-Jen 
# NTU: B04B01036
# HW1_1
# counting the number of ACGT's

# read file
seq_file = 'gp9_exons_simple.txt'
fh = open(seq_file, 'r')
myseq = fh.read()
fh.close()

# split
myseq2 = myseq.split()

a_count1 = myseq2[0].count('a')
c_count1 = myseq2[0].count('c')
g_count1 = myseq2[0].count('g')
t_count1 = myseq2[0].count('t')

a_count2 = myseq2[1].count('a')
c_count2 = myseq2[1].count('c')
g_count2 = myseq2[1].count('g')
t_count2 = myseq2[1].count('t')

a_count3 = myseq2[2].count('a')
c_count3 = myseq2[2].count('c')
g_count3 = myseq2[2].count('g')
t_count3 = myseq2[2].count('t')

a_count4 = myseq2[3].count('a')
c_count4 = myseq2[3].count('c')
g_count4 = myseq2[3].count('g')
t_count4 = myseq2[3].count('t')

a_count5 = myseq2[4].count('a')
c_count5 = myseq2[4].count('c')
g_count5 = myseq2[4].count('g')
t_count5 = myseq2[4].count('t')

# print the result
print("the total number of exon1 A's is: " + str(a_count1))
print("the total number of exon1 C's is: " + str(c_count1))
print("the total number of exon1 G's is: " + str(g_count1))
print("the total number of exon1 T's is: " + str(t_count1))

print("the total number of exon2 A's is: " + str(a_count2))
print("the total number of exon2 C's is: " + str(c_count2))
print("the total number of exon2 G's is: " + str(g_count2))
print("the total number of exon2 T's is: " + str(t_count2))

print("the total number of exon3 A's is: " + str(a_count3))
print("the total number of exon3 C's is: " + str(c_count3))
print("the total number of exon3 G's is: " + str(g_count3))
print("the total number of exon3 T's is: " + str(t_count3))

print("the total number of exon4 A's is: " + str(a_count4))
print("the total number of exon4 C's is: " + str(c_count4))
print("the total number of exon4 G's is: " + str(g_count4))
print("the total number of exon4 T's is: " + str(t_count4))

print("the total number of exon5 A's is: " + str(a_count5))
print("the total number of exon5 C's is: " + str(c_count5))
print("the total number of exon5 G's is: " + str(g_count5))
print("the total number of exon5 T's is: " + str(t_count5))



