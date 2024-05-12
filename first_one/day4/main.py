
def main():
    with open("input", "r") as f:
        lines = f.read().split('\n')
    
    pairs = [ [ [int(i) for i in elf.split('-')] for elf in pair.split(',')] for pair in lines]

    count = 0

    for ((a, b), (c, d)) in pairs:
        max_r = max(b, d)
        min_r = min(a, c)
        if max_r - min_r <= b - a + d - c:
            count += 1

    print(count)

if __name__ == "__main__":
    main()
