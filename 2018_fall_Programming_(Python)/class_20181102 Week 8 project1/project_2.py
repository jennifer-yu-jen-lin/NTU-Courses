import sys, time

# t: the number of DNA sequences
# n: the number of nucleotides in each sequence
# s=(s1, s2, …, st): the position array
# l: the length of the motif

def HammingDistance(s1, s2):
    return sum(l1 != l2 for l1, l2 in zip(s1, s2))


def BruteForceMedianSearch(DNA, l):
    bestDistance = len(DNA)*l # set an initial value

    for mers0 in range(0,len(DNA[0])-(l-1)):
        seeds = DNA[0][ 0+mers0 : l+mers0 ] # DNA[0] is used as seeds to find other motifs
        HD_min_index_list = []
        HD_min_value_list = []
        
        for seq in range(1,len(DNA)):
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
            best_index_list = [mers0]+ best_index_list_2 # index from DNA[0] to DNA[len(DNA)]
            best_value_list = HD_min_value_list
            bestDistance = sum(HD_min_value_list)

    return best_index_list, best_value_list


## output
# a motif that minimize totalDistance
# min(totalDistance)
# Array s: starting positions
# Elapsed time


'''       
1 bestWord ← AAA...A 
2 bestDistance ← ∞ 
3 for each l-mer word from AAA...A to TTT...T 
4 	if totalDistance(word, DNA) < bestDistance
5 		bestDistance ← totalDistance(word, DNA) 
6 		bestWord ← word 
7 return bestWord 



def totalDistance(word, DNA):

def nextWord(word):

'''
test1 = 'test1.txt'
test2 = 'test2.txt'
test1_2 = 'test1_2.txt'


DNA = []
fp = open(test1)
for line in fp:
    line = line.strip()
    DNA.append(line)



startTime = time.time()
print(BruteForceMedianSearch(DNA, 8))
elapsed = time.time() - startTime
print('It spends', elapsed, 'seconds')



