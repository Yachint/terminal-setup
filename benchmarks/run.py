import random, time

lst = [0] * 100000000;
# lst = [0] * 10;

for i in range(len(lst)):
    lst[i] = random.randrange(1, 1000)

print("population done!")
start_time = time.time()
lst.sort();
print("--- %s seconds ---" % (time.time() - start_time))

del lst

