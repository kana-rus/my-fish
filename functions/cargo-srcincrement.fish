function cargo-srcincrement
    if ls | grep -qx Cargo.toml #test "$(basename $PWD)" = "src"
        set prev_name_line (tail ./Cargo.toml -n 2 | grep name)
        set prev_name_info (string split \" $prev_name_line)
        set prev_number $prev_name_info[2]

        set next_number_raw (math (string trim -l -c '0' $prev_number) + 1)
        if test "$next_number_raw" -lt 10
            set next_number "00$next_number_raw"
        else if test "$next_number_raw" -lt 100
            set next_number "0$next_number_raw"
        else if test "$next_number_raw" -lt 1000
            set next_number "$next_number_raw"
        end

        touch ./src/$next_number.rs
        echo "[[bin]]
name = \"$next_number\"
path = \"src/$next_number.rs\"" >> ./Cargo.toml

        if test "$(basename $PWD)" = "learn_compiler"
            echo "mod utils; use utils::*;






fn main() { /* printing debug */

}" >> ./src/$next_number.rs
        end

    else
        echo "error: use in Rust project's root directory."
        return 1
    end
end
