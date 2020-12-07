# HW9_1
# Lin, Yu-Jen
# NTU student ID: b04b01036
# email: b04b01036@ntu.edu.tw

# 1. Download two arbitrary protein sequences and DNA sequence from NCBI in fasta format using Biopython.
# For the two protein sequences, please individually compute their amino acid and nuclieotide compositions and
# output your results in a .txt file.

# In my mac, need to run this command first in the terminal:
## /Applications/Python\ 3.6/Install\ Certificates.command


from Bio import Entrez, SeqIO

Entrez.email = "b04b01036@ntu.edu.tw"  # NCBI requires your valid identity

# 1 DNA
# Selenipedium aequinoctiale maturase K (matK) gene, partial cds; chloroplast
handle_1 = Entrez.efetch(db="nucleotide", id="186972394", rettype="gb", retmode="text")
record_1 = SeqIO.read(handle_1, "genbank")
handle_1.close()
print(record_1+'\n\n\n')

# 2 DNA
# Scaphyglottis amparoana maturase K (matK) gene, partial cds; chloroplast
handle_2 = Entrez.efetch(db="nucleotide", id="186972392", rettype="gb", retmode="text")
record_2 = SeqIO.read(handle_2, "genbank")
handle_2.close()
print(record_2+'\n\n\n')

# 3 Protein
# maturase K, partial (chloroplast) [Selenipedium aequinoctiale]
handle_3 = Entrez.efetch(db="nucleotide", id="186972395", rettype="gb", retmode="text")
record_3 = SeqIO.read(handle_3, "genbank")
handle_3.close()
print(record_3+'\n\n\n')

# 4 Protein
# maturase K, partial (chloroplast) [Scaphyglottis amparoana]
handle_4 = Entrez.efetch(db="nucleotide", id="186972393", rettype="gb", retmode="text")
record_4 = SeqIO.read(handle_4, "genbank")
handle_4.close()
print(record_4+'\n\n\n')


DNA_1 = record_1.seq
Protein_1 = DNA_1.translate(table=1, to_stop=True)

DNA_2 = record_2.seq
Protein_2 = DNA_2.translate(table=1, to_stop=True)

Protein_3 = record_3.seq

Protein_4 = record_4.seq

#################################################################################
#############################
# Nuclieotide compositions
#############################
from Bio.Seq import Seq
from Bio.Alphabet import IUPAC
from Bio.SeqUtils import GC
GC_DNA_1 = GC(DNA_1)
GC_DNA_2 = GC(DNA_2)
print('GC content of DNA_1:', GC_DNA_1)
print('GC content of DNA_2:', GC_DNA_2)

#############################
# Amino acid compositions
#############################
from Bio import SeqIO
from Bio.SeqUtils.ProtParam import ProteinAnalysis
p1 = ProteinAnalysis(str(Protein_1))
print('\nAmino Acid composition of Protein_1', record_1.id, p1.count_amino_acids())
p2 = ProteinAnalysis(str(Protein_2))
print('Amino Acid composition of Protein_2', record_2.id, p2.count_amino_acids())
p3 = ProteinAnalysis(str(Protein_3))
print('Amino Acid composition of Protein_3', record_3.id, p3.count_amino_acids())
p4 = ProteinAnalysis(str(Protein_4))
print('Amino Acid composition of Protein_4', record_4.id, p4.count_amino_acids())

#################################################################################
# save all the results into a txt file
handle = open("HW9_1_result.txt", "w")
handle.write('GC content of DNA_1 ('+str(record_1.id)+') : '+str(GC_DNA_1))
handle.write('\nGC content of DNA_2 ('+str(record_1.id)+') : '+str(GC_DNA_2)+'\n')
handle.write('\nAmino Acid composition of Protein_1 ('+str(record_1.id)+') :\n\t'+str(p1.count_amino_acids()))
handle.write('\nAmino Acid composition of Protein_2 ('+str(record_2.id)+') :\n\t'+str(p2.count_amino_acids()))
handle.write('\nAmino Acid composition of Protein_3 ('+str(record_3.id)+') :\n\t'+str(p3.count_amino_acids()))
handle.write('\nAmino Acid composition of Protein_4 ('+str(record_4.id)+') :\n\t'+str(p4.count_amino_acids()))
handle.close()
