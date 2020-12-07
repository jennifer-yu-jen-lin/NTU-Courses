# Lin, Yu-Jen 
# NTU: B04B01036
# HW1_3
# Reverse complement each exon as well as the entire sequence

# read file
seq_file = 'gp9_exons_simple.txt'
fh = open(seq_file, 'r')
myseq = fh.read()
fh.close()

# complement
complement = myseq

complement = complement.replace("a","x")
complement = complement.replace("t","y")
complement = complement.replace("c","z")
complement = complement.replace("g","w")

complement = complement.replace("x","T")
complement = complement.replace("y","A")
complement = complement.replace("z","G")
complement = complement.replace("w","C")

## exon1-5 ##
# split
RC = complement.split()
# reverse
RC_result = RC
for i in range(len(RC)):
    RC_result[i] = RC[i][::-1]

## whole gp9 ##
#reverse
complement_whole = complement.replace("\n","")
RC_whole = complement_whole[::-1]

# write file
out_fh = open('ReverseComplement.txt','w')
out_fh.write('>exon1\n' + RC_result[0] + '\n>exon2\n' + RC_result[1] + '\n>exon3\n' + RC_result[2] + '\n>exon4\n' + RC_result[3] + '\n>exon5\n' + RC_result[4] + '\n>whole gp9\n' + RC_whole)
out_fh.close()

