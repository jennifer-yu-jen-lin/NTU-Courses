# Week 6 - Homework Q4 b
# NTU student ID: B04B01036
# Lin, Yu-Jen

############################################################
## week 5-3 ##

def reverse_complement(dna):
    # complement
    dna = dna.lower()
    complement = dna
    # for i in range(0,len(complement)):
    complement = complement.replace("a","x")
    complement = complement.replace("t","y")
    complement = complement.replace("c","z")
    complement = complement.replace("g","w")
    complement = complement.replace("x","T")
    complement = complement.replace("y","A")
    complement = complement.replace("z","G")
    complement = complement.replace("w","C")

    # reverse
    RC_result = complement[::-1]
    return RC_result


############################################################

print('Start assertion tests (only return wrong testing results)\nIf nothing is returned, this means every test is correct.')

exon = 'atgaagacgttcgtattgcatatttttatttttgctctcgtg'

assert reverse_complement('ACGT') == 'ACGT'
assert reverse_complement('G') == 'C'
assert reverse_complement('A') == 'T'
assert reverse_complement('AGG') == 'CCT'
assert reverse_complement(exon) == 'CACGAGAGCAAAAATAAAAATATGCAATACGAACGTCTTCAT'

# double check lower case too
assert reverse_complement('acgt') == 'ACGT'
assert reverse_complement('g') == 'C'
assert reverse_complement('a') == 'T'
assert reverse_complement('accc') == 'GGGT'

# check mixed case
assert reverse_complement('acGT') == 'ACGT'
assert reverse_complement('acCC') == 'GGGT'

# Can also test negative cases
assert reverse_complement('acGT') != 'AAAA'

##   If it is correct, Python won't return anything.
##   Python will only return the wrong testing results.
