
OneWord = input("Give me one word (or finish this by <enter>): ")

data= [OneWord]

if (OneWord != '\n'):
    OneWord = input("Give me one word (or finish this by <enter>): ")
    data.append(OneWord)

'''
# prettier
for k in seen.keys():
    print(k + '\t=>\t' + str(seen[k]))

# now sort by count
seen_list = seen.keys()
name_by_count = sorted(seen_list, key=seen.get)

# now reverse the sort, so most on top (normally least to most)
name_by_count.reverse()

# nice output
print("sorted names by count, most to least")
for k in name_by_count:
    print(k + '\t=>\t' + str(seen[k]))




    print("counter is at: " + str(count))
    count += 1  # increment counter





count = 0

while (count < 10):
    print("counter is at: " + str(count))
    count += 1  # increment counter
'''
