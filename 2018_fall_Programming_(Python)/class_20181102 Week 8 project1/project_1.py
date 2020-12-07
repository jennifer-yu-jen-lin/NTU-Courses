import sys, time

# t: the number of DNA sequences
# n: the number of nucleotides in each sequence
# s=(s1, s2, …, st): the position array
# l: the length of the motif

def HammingDistance(s1, s2):
    return sum(l1 != l2 for l1, l2 in zip(s1, s2))


def BruteForceMedianSearch(DNA, l):
    for mers0 in range(0,len(DNA[0])-(l-1)):
        seeds = DNA[0][ 0+mers0 : l+mers0 ] # DNA[0] is used as seeds to find other motifs
        HD_min_list = []
        for seq in range(1,len(DNA)):
            HD = []
            for mers in range(0,len(DNA[seq])-(l-1)):
                potential_motif = DNA[seq][ 0+mers : l+mers ]
                HD.append(HammingDistance(seeds, potential_motif))
            HD_min_list.append(min(HD))

    return HD_min_list
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

DNA = []
fp = open(test1)
for line in fp:
    line = line.strip()
    DNA.append(line)



startTime = time.time()
print(BruteForceMedianSearch(DNA, 8))
elapsed = time.time() - startTime
print('It spends', elapsed, 'seconds')



