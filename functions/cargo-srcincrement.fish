function cargo-srcincrement
    if test "$(basename $PWD)" = "src" #ls | grep -qx Cargo.toml
        set prev_name_line (tail ../Cargo.toml -n 2 | grep name)
        set prev_name_info (string split \" $prev_name_line)
        set prev_number $prev_name_info[2]

        set next_number_raw (math (string trim -l -c '0' $prev_number) + 1)
        if test "$next_number_raw" -lt 10
            set next_number "00$next_number_raw"
        else if test "$next_number_raw" -lt 100
            set next_number "0$next_number_raw"
        else if test "$next_number_raw" -lt 1000
            set next_number "$next_number_raw"
        else
            echo "N >= 1000 is not supprted"
            return 1
        end

        touch ./$next_number.rs
        echo "[[bin]]
name = \"$next_number\"
path = \"src/$next_number.rs\"" >> ../Cargo.toml

        if test "$PWD" = "/home/kanarus/learn_compiler/src"
            echo "mod utils; use utils::*;

fn parse(mut tokens: std::collections::vec_deque::IntoIter<Token>) -> Tree {

}

fn evaluate(tree: Tree) -> Int {

}




fn main() { /* printing debug */

}" >> ./$next_number.rs
        end

    else
        echo "error: use in Rust project's src directory."
        return 1
    end
end
