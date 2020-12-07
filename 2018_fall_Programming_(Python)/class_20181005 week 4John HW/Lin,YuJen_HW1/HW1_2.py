# Lin, Yu-Jen 
# NTU: B04B01036
# HW1_2
# Join exons into cDNA and convert cDNA into mRNA; want all UPPER case

# read file
seq_file = 'gp9_exons_simple.txt'
fh = open(seq_file, 'r')
myseq = fh.read()
fh.close()

# cDNA
myseq = myseq.replace("\n","")

cDNA = myseq

cDNA = cDNA.replace("a","x")
cDNA = cDNA.replace("t","y")
cDNA = cDNA.replace("c","z")
cDNA = cDNA.replace("g","w")

cDNA = cDNA.replace("x","T")
cDNA = cDNA.replace("y","A")
cDNA = cDNA.replace("z","G")
cDNA = cDNA.replace("w","C")

# mRNA
mRNA = cDNA
mRNA = mRNA.replace("A","x")
mRNA = mRNA.replace("T","y")
mRNA = mRNA.replace("C","z")
mRNA = mRNA.replace("G","w")

mRNA = mRNA.replace("x","U")
mRNA = mRNA.replace("y","A")
mRNA = mRNA.replace("z","G")
mRNA = mRNA.replace("w","C")

# write file
out_fh = open('cDNA_mRNA.txt','w')
out_fh.write('>gp9_cDNA\n' + cDNA + '\n>gp9_mRNA\n' + mRNA)
out_fh.close()

