
def main():
    with open("input", "r") as f:
        elfs = f.read().split('\n\n')
        elfs = [sum([int(i) for i in elf.split('\n')]) for elf in elfs]
        print(max(elfs))
    
    return

if __name__ == "__main__":
    main()
