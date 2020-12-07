# HW9_2
# Lin, Yu-Jen
# NTU student ID: b04b01036
# email: b04b01036@ntu.edu.tw

# 2. Download the DNA sequence from the file “Ciliate_ortholog.fasta”,
# please perform transcription and translation using Biopython,
# by using the correct codon table for ciliates and report the final output (i.e., protein sequence) in the same .txt file.
# Note that the protein sequence should be reported in a fasta format.

from Bio import SeqIO
handle = open("ciliate_ortholog.fasta", "rU") # “handle” is a pointer to the file
seq_list = list(SeqIO.parse(handle, "fasta"))
handle.close()

RNA = []
Protein = []

for i in range(len(seq_list)):
    RNA_i = seq_list[i].seq.transcribe()
    RNA.append(RNA_i)
    Protein_i = seq_list[i].seq.translate(table=6, to_stop=True) # codon table 6: The Ciliate, Dasycladacean and Hexamita Nuclear Code
    Protein.append(Protein_i)

handle = open("ciliate_ortholog.fasta", "a")
for i in range(len(RNA)):
    handle.write('>' + seq_list[i].id + '\n')
    handle.write(str(RNA[i]) + '\n')
handle.write('\n\n\n\n')
for i in range(len(Protein)):
    handle.write('>' + seq_list[i].id + '\n')
    handle.write(str(Protein[i]) + '\n')
handle.close()
