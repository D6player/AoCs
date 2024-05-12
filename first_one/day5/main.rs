//! day 5, part 1, advent of code 2022.

use std::fs;

struct Warehouse {
    m: Vec<Vec<char>>,
    top: Vec<usize>,
    height: usize,
    width: usize,
}

fn parse_crates(crates: &str) -> () {
    let height = crates.matches("\n").count();
    let width: Vec<&str> = crates.split("\n").collect();
    let width = width[height-1].matches("   ").count();
    
    println!("{}, {}", height, width);
}

fn main() {
    let contents = fs::read_to_string("input")
        .expect("Failed to read.");
    
    let (crates, orders) = {
        let parts: Vec<&str> = contents.split("\n\n").collect();
        (parts[0], parts[1])
    };

    parse_crates(crates);

    println!("{}", crates);
}
