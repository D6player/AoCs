
def main():
    shared_cars = []

    with open("input", "r") as f:
        lines = f.read().split('\n')
        elfs  = len(lines)//3
        for elf in range(elfs):
            (s1, s2, s3) = lines[elf*3:elf*3+3]
            shared_car = [i for i in s1 if i in s2 and i in s3][0]
            shared_cars.append(shared_car)
    
    key = lambda c: ord(c)-ord('A')+27 if c < 'a' else ord(c)-ord('a')+1
    print(sum([key(i) for i in shared_cars]))

if __name__ == "__main__":
    main()
