
def main():
    with open("input", "r") as f:
        elfs = f.read().split('\n\n')
        elfs = [sum([int(i) for i in elf.split('\n')]) for elf in elfs]
        elfs = sorted(elfs, reverse=True)
        print(elfs[0] + elfs[1] + elfs[2])
    
    return

if __name__ == "__main__":
    main()
