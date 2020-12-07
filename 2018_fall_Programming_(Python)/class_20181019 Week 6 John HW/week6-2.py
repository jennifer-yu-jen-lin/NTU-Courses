# Week 6 - Homework Q2
# NTU student ID: B04B01036
# Lin, Yu-Jen

############################################################

def get_any_percent(seq, letters, sig_digits=2):

    seq_len = len(seq)

    # convert to upper just in case (or lower)
    seq = seq.upper()

    # total
    total_letters = 0

    for l in letters:
        l = l.upper()   # or use map
        total_letters += seq.count(l)

    proportion = total_letters/seq_len
    proportion_rounded = round(proportion, sig_digits)

    return proportion_rounded

############################################################

exon3 = 'atgacatcttctcgattggtgaagtatcaagtggccagcacaaaaccaatcatgaagataccgaactacacaaaaatggttgcgtcatgcaatgtttgttagaaaaagatggactg'

# situation1: Both of these give the same correct result
get_any_percent(exon3, 'AT', 3) # 0.603
get_any_percent(exon3, ['A', 'T'], 3) # 0.603

# situation2: 
get_any_percent(exon3, ['AT'], 3) # 0.095
get_any_percent(exon3, ['CT', 'G'], 3) # 0.25

# Ans:
##   When a user simply type a sequence as a string,
##   Python regard this sequence as a vector.
##   Each element in this vector is a letter.
##   As a result, in situation1, both of the conditions take the A and T as separated elements,
##   and search for A and T separately. Hence, we have the same correct result.

##   Yet, in situation2, the user defined 'AT' as one element in the vector[ ].
##   This makes Python couldn't regard A and T as separated elements anymore.
##   Python will only search for AT(together), rather than A and T separately. 
##   So as for the ['CT', 'G'], the user ties 'CT' together,
##   and thus Python will search for CT(together) first, then G.
##   It won't search for C, T , and G separately.
