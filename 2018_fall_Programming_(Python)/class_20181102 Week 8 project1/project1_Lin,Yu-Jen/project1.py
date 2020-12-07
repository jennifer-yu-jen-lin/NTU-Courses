# project 1
# Lin, Yu-Jen
# NTU student ID: B04B01036
# email: B04B01036@ntu.edu.tw

import sys, time

# t: the number of DNA sequences
# n: the number of nucleotides in each sequence
# s = (s1, s2, …, st): the position array
# l: the length of the motif

def HammingDistance(s1, s2):
    return sum(l1 != l2 for l1, l2 in zip(s1, s2))

def BruteForceMedianSearch(DNA, l):
    bestDistance = len(DNA)*l # set an initial value
    bestDistance_final = len(DNA)*l # set an initial value

    RangeOfSeq = list(range(0,len(DNA)))
    for S in RangeOfSeq:
        RangeOfSeq_ExceptSeed = list(range(0,len(DNA)))
        del RangeOfSeq_ExceptSeed[S]

        for mers0 in range(0,len(DNA[S])-(l-1)):
            seeds = DNA[S][ 0+mers0 : l+mers0 ] # DNA[S] is used as seeds to find other motifs
            HD_min_index_list = []
            HD_min_value_list = []
            
            for seq in RangeOfSeq_ExceptSeed:
                HD = l
                for mers in range(0,len(DNA[seq])-(l-1)):
                    potential_motif = DNA[seq][ 0+mers : l+mers ]
                    if HammingDistance(seeds, potential_motif) < HD:
                        HD = HammingDistance(seeds, potential_motif)
                        HD_min_index = mers # index of the motif position
                        HD_min_value = HD
                HD_min_index_list.append(HD_min_index)
                HD_min_value_list.append(HD_min_value)

            if sum(HD_min_value_list) < bestDistance :
                best_index_list_2 = HD_min_index_list
                best_index_list_2.insert( S, mers0) # combine all the index
                best_index_list = best_index_list_2 
                best_value_list = HD_min_value_list
                bestDistance = sum(HD_min_value_list)
        
        if sum(best_value_list) < bestDistance_final:
            best_index_list_final = best_index_list
            best_value_list_final = best_value_list
            bestDistance_final = sum(best_value_list_final)

    return best_index_list_final, bestDistance_final

############################################################
# output
## a motif that minimize totalDistance
## min(totalDistance)
## Arrays: starting positions
## Elapsed time
test1 = 'test1.txt'
test2 = 'test2.txt'
##########
# TEST 1 #
##########
DNA = []
fp = open(test1)
for line in fp:
    line = line.strip()
    DNA.append(line)

startTime = time.time()
result = BruteForceMedianSearch(DNA, 8)
elapsed = time.time() - startTime
print('RESULT OF TEST 1 (8-MER MOTIFS):\n\tMotifs:')
for i in range(len(result[0])):
    print('\t',DNA[i][result[0][i]:(result[0][i]+8)])
print('\tArray of starting positions:',result[0], '\n\tMinimum of total distance:', result[1])
print('\tIt spends', elapsed, 'seconds')

##########
# TEST 2 #
##########
DNA = []
fp = open(test2)
for line in fp:
    line = line.strip()
    DNA.append(line)

startTime = time.time()
result = BruteForceMedianSearch(DNA, 8)
elapsed = time.time() - startTime
print('\nRESULT OF TEST 2 (8-MER MOTIFS):\n\tMotifs:')
for i in range(len(result[0])):
    print('\t',DNA[i][result[0][i]:(result[0][i]+8)])
print('\tArray of starting positions:',result[0], '\n\tMinimum of total distance:', result[1])
print('\tIt spends', elapsed, 'seconds')


