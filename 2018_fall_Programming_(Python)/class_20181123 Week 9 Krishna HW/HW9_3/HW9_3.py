# HW9_3
# Lin, Yu-Jen
# NTU student ID: b04b01036
# email: b04b01036@ntu.edu.tw

# 3. For each ortholog set in the file “Ciliate_ortholog.fasta”:
# Align the translated sequence using ClustalW/Muscle and replace
# the amino acids with the original codons in the aligned sequence.
# Please write your results into a .txt file

## Step1: Read the file “Ciliate_ortholog.fasta” using the correct path and the appropriate Biopython module
from Bio import SeqIO
handle = open("ciliate_ortholog.fasta", "rU") # “handle” is a pointer to the file
seq_list = list(SeqIO.parse(handle, "fasta"))
handle.close()

## Step2: use Biopython to transcribe and translate (with correct codon table) the orthologs individually and write it out to a fasta file.
RNA = []
Protein = []

handle_RNA = open("ciliate_ortholog_RNA.fasta", "w")
handle_Protein = open("ciliate_ortholog_Protein.fasta", "w")
DNA_1 = open("ciliate_ortholog_DNA_1.fasta", "w")
DNA_2 = open("ciliate_ortholog_DNA_2.fasta", "w")
DNA_3 = open("ciliate_ortholog_DNA_3.fasta", "w")
Protein_1 = open("ciliate_ortholog_Protein_1.fasta", "w")
Protein_2 = open("ciliate_ortholog_Protein_2.fasta", "w")
Protein_3 = open("ciliate_ortholog_Protein_3.fasta", "w")

for i in range(len(seq_list)):
    # transcribe
    RNA_i = seq_list[i].seq.transcribe()
    RNA.append(RNA_i)
    # translate
    Protein_i = seq_list[i].seq.translate(table=6, to_stop=True) # codon table 6: The Ciliate, Dasycladacean and Hexamita Nuclear Code
    Protein.append(Protein_i)

    ## save to files (3 sets in 1 file)
    handle_RNA.write('>' + seq_list[i].id + '\n')
    handle_RNA.write(str(RNA[i]) + '\n')
    handle_Protein.write('>' + seq_list[i].id + '\n')
    handle_Protein.write(str(Protein[i]) + '\n')

    ## separate one file into 3 files. (1 set in 1 file)
    #### in order to do the alignment respectfully
    if i in range(0,3):
        DNA_1.write('>' + seq_list[i].id + '\n')
        DNA_1.write(str(seq_list[i].seq) + '\n')
        Protein_1.write('>' + seq_list[i].id + '\n')
        Protein_1.write(str(Protein[i]) + '\n')
    elif i in range(3, 6):
        DNA_2.write('>' + seq_list[i].id + '\n')
        DNA_2.write(str(seq_list[i].seq) + '\n')
        Protein_2.write('>' + seq_list[i].id + '\n')
        Protein_2.write(str(Protein[i]) + '\n')
    else:
        DNA_3.write('>' + seq_list[i].id + '\n')
        DNA_3.write(str(seq_list[i].seq) + '\n')
        Protein_3.write('>' + seq_list[i].id + '\n')
        Protein_3.write(str(Protein[i]) + '\n')

handle_RNA.close()
handle_Protein.close()
DNA_1.close()
DNA_2.close()
DNA_3.close()
Protein_1.close()
Protein_2.close()
Protein_3.close()

## Step3a: Do a codon-based alignment for the nucleotide orthologous sequences and save as a fasta file or store it in the same program (preferred)
## Dr. Swamy asked us to do the alignment outside of python. Thus I only listed the steps, input files and output files here.
#### MEGA 7
#### Alignment -> ALign by ClustalW (Codons)
#### Genetic Code Table -> Cliliate Nuclear
#### (with defult parameters)
#### INPUT FILES
###### ciliate_ortholog_DNA_1.fasta
###### ciliate_ortholog_DNA_2.fasta
###### ciliate_ortholog_DNA_3.fasta
#### OUTPUT FILES
###### ciliate_ortholog_DNA_align_1.fasta
###### ciliate_ortholog_DNA_align_2.fasta
###### ciliate_ortholog_DNA_align_3.fasta

## Step3b: Do a amino acid alignment for the translated orthologs and save as a fasta file or store it in the same program (preferred)
## Dr. Swamy asked us to do the alignment outside of python. Thus I only listed the steps, input files and output files here.
#### MEGA 7
#### Alignment -> ALign by ClustalW
#### (with defult parameters)
#### INPUT FILES
###### ciliate_ortholog_Protein_1.fasta
###### ciliate_ortholog_Protein_2.fasta
###### ciliate_ortholog_Protein_3.fasta
#### OUTPUT FILES
###### ciliate_ortholog_Protein_align_1.fasta
###### ciliate_ortholog_Protein_align_2.fasta
###### ciliate_ortholog_Protein_align_3.fasta

## Step4:  Read the aligned files and store the aligned codons and amino acids
## Write it out one below the other as another fasta file
handle = open("ciliate_ortholog_DNA_1_align.fasta", "rU")
DNA_align_1 = list(SeqIO.parse(handle, "fasta"))
handle.close()
handle = open("ciliate_ortholog_DNA_2_align.fasta", "rU")
DNA_align_2 = list(SeqIO.parse(handle, "fasta"))
handle.close()
handle = open("ciliate_ortholog_DNA_3_align.fasta", "rU")
DNA_align_3 = list(SeqIO.parse(handle, "fasta"))
handle.close()
handle = open("ciliate_ortholog_Protein_1_align.fasta", "rU")
Protein_align_1 = list(SeqIO.parse(handle, "fasta"))
handle.close()
handle = open("ciliate_ortholog_Protein_2_align.fasta", "rU")
Protein_align_2 = list(SeqIO.parse(handle, "fasta"))
handle.close()
handle = open("ciliate_ortholog_Protein_3_align.fasta", "rU")
Protein_align_3 = list(SeqIO.parse(handle, "fasta"))
handle.close()
## combine all the sequences
combine = open("ciliate_ortholog_final_output.txt", "w")
for i in range(3):
    combine.write('>' + DNA_align_1[i].id + '\n')
    combine.write(str(DNA_align_1[i].seq) + '\n')
    combine.write(str(Protein_align_1[i].seq) + '\n')
for i in range(3):
    combine.write('>' + DNA_align_2[i].id + '\n')
    combine.write(str(DNA_align_2[i].seq) + '\n')
    combine.write(str(Protein_align_2[i].seq) + '\n')
for i in range(3):
    combine.write('>' + DNA_align_3[i].id + '\n')
    combine.write(str(DNA_align_3[i].seq) + '\n')
    combine.write(str(Protein_align_3[i].seq) + '\n')
combine.close()