#!/usr/bin/env python
# coding: utf-8

# ##### Lin, Yu-Jen
# ##### NTU student ID: b04b01036
# ##### email: b04b01036@ntu.edu.tw

# # 9. Regular Expression

# In[1]:


import re


# ### Please read the fast sequence from the file Final_exam_Regex_input.fasta using Biopython. 

# In[2]:


from Bio import SeqIO
Regex_input = SeqIO.read("Final_exam_Regex_input.fasta", "fasta")


# ### Use regular expression to find the position of the pattern “ggatcc”, “cggccg”, “gccggc”, “gaattc”. Please write the output into a .txt file(Problem9_yourname.txt). 
# ### The output should be a tab-delimited table of the form: 
# ##### Pattern\tPosition-1, Position-2, …,Position-n
# ##### Note: \t denotes tab-delimited format

# In[3]:


output = open("Problem9_Lin,Yu-Jen.txt", "w+")

# “ggatcc”
for i in re.finditer("ggatcc", str(Regex_input.seq)):
    output.write('%s\t%d,%d,%d,%d,%d,%d\n' % ('ggatcc',i.start(),i.start()+1,i.start()+2,
                                     i.start()+3,i.start()+4, i.end()))
    print('%s\t%d,%d,%d,%d,%d,%d' % ('ggatcc',i.start(),i.start()+1,i.start()+2,
                                     i.start()+3,i.start()+4, i.end()))

# “cggccg”
for i in re.finditer("cggccg", str(Regex_input.seq)):
    output.write('%s\t%d,%d,%d,%d,%d,%d\n' % ('cggccg',i.start(),i.start()+1,i.start()+2,
                                     i.start()+3,i.start()+4, i.end()))
    print('%s\t%d,%d,%d,%d,%d,%d' % ('cggccg',i.start(),i.start()+1,i.start()+2,
                                     i.start()+3,i.start()+4, i.end()))

# “gccggc”
for i in re.finditer("gccggc", str(Regex_input.seq)):
    output.write('%s\t%d,%d,%d,%d,%d,%d\n' % ('gccggc',i.start(),i.start()+1,i.start()+2,
                                     i.start()+3,i.start()+4, i.end()))
    print('%s\t%d,%d,%d,%d,%d,%d' % ('gccggc',i.start(),i.start()+1,i.start()+2,
                                     i.start()+3,i.start()+4, i.end()))

# “gaattc”
for i in re.finditer("gaattc", str(Regex_input.seq)):
    output.write('%s\t%d,%d,%d,%d,%d,%d\n' % ('gaattc',i.start(),i.start()+1,i.start()+2,
                                     i.start()+3,i.start()+4, i.end()))
    print('%s\t%d,%d,%d,%d,%d,%d' % ('gaattc',i.start(),i.start()+1,i.start()+2,
                                     i.start()+3,i.start()+4, i.end()))

output.close()

