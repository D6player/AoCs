
def main():
    shared_cars = []

    with open("input", "r") as f:
        lines = f.read().split('\n')
        for line in lines:
            n = len(line)
            s1= line[0:n//2]
            s2= line[n//2:n]
            shared_car = [i for i in s1 if i in s2][0]
            shared_cars.append(shared_car)
    
    key = lambda c: ord(c)-ord('A')+27 if c < 'a' else ord(c)-ord('a')+1
    print(sum([key(i) for i in shared_cars]))

if __name__ == "__main__":
    main()
