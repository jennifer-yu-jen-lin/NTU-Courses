#!/usr/bin/env python
# coding: utf-8

# ##### Lin, Yu-Jen
# ##### NTU student ID: b04b01036
# ##### email: b04b01036@ntu.edu.tw

# # 8. Biopython

# ### Please read the fast sequence from the file Input.fasta using Biopython.

# In[1]:


from Bio import SeqIO
Input = SeqIO.read("Input.fasta", "fasta")


# In[2]:


print(Input)


# ### (a) Please compute their GC content using the appropriate utility module of Biopython and output your results in tab-delimited format with the sequence-id and GC content in a .txt file with name Problem8_yourname.txt.

# In[3]:


from Bio.Seq import Seq
from Bio.Alphabet import IUPAC
from Bio.SeqUtils import GC
Input_DNA_GC = GC(Input.seq)
output = open("Problem8_Lin,Yu-Jen.txt", "w+")
output.write(Input.id + '\t' + str(Input_DNA_GC) + '\n\n')
output.close()
print(Input.id + '\t' + str(Input_DNA_GC))


# ### (b) Please transcribe and translate this using Biopython, by using (a) Standard codon table  (id: 1) and (b) Mitochondrial codon table (id: 2). Please print out the transcribed and translated sequence as appended to the same .txt file (output of (a)). 

# In[4]:


output = open("Problem8_Lin,Yu-Jen.txt", "a")

# transcribe
Input_mRNA = Input.seq.transcribe()
output.write(str(Input_mRNA) + '\n\n')
print(str(Input_mRNA) + '\n')

# translate
## (a) Standard codon table (id: 1)
Input_Protein_std = Input.seq.translate(table=1)
output.write('>Standard codon table (id: 1)\n' + str(Input_Protein_std) + '\n')
print('>Standard codon table (id: 1)\n' + str(Input_Protein_std))

## (b) Mitochondrial codon table (id: 2)
Input_Protein_mt = Input.seq.translate(table=2)
output.write('>Mitochondrial codon table (id: 2)\n' + str(Input_Protein_mt) + '\n\n')
print('>Mitochondrial codon table (id: 2)\n' + str(Input_Protein_mt))

output.close()


# ### (c) Also please print all the stop codons and their positions on the sequence from the two-codon tables (id: 1 and id: 2). The output should be appended to the same .txt file (output of (b)) as a table of the form: 
# ##### Codon-table-name (id)\tCodon\tPosition-1, Position-2, …,Position-n
# ##### Note: \t denotes tab-delimited format.

# In[5]:


output = open("Problem8_Lin,Yu-Jen.txt", "a")

# (a) Standard codon table (id: 1)
output.write('Standard codon table (id:1)\n')
print('Standard codon table (id:1)')
for i in range(0,len(Input_Protein_std)):
    if Input_Protein_std[i] == '*':
        output.write('%s\t%s,%s,%s\n' % (str(Input.seq[3*i:3*i+3]),str(3*i),str(3*i+1),str(3*i+2)) )
        print('%s\t%s,%s,%s' % (str(Input.seq[3*i:3*i+3]),str(3*i),str(3*i+1),str(3*i+2)) )

# (b) Mitochondrial codon table (id: 2)
output.write('Mitochondrial codon table (id: 2)\n')
print('Mitochondrial codon table (id: 2)')
for i in range(0,len(Input_Protein_mt)):
    if Input_Protein_mt[i] == '*':
        output.write('%s\t%s,%s,%s\n' % (str(Input.seq[3*i:3*i+3]),str(3*i),str(3*i+1),str(3*i+2)) )
        print('%s\t%s,%s,%s' % (str(Input.seq[3*i:3*i+3]),str(3*i),str(3*i+1),str(3*i+2)) )

output.close()

