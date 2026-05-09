# Tower of Hanoi

A simple Bash implementation of the classic Tower of Hanoi puzzle.

This repository includes a shell script that solves the puzzle using recursion and prints the state of all three pegs after each disk move.

## Files

- `tower_of_hanoi.sh` - Bash script that solves the Tower of Hanoi puzzle.
- `LICENSE` - Project license.

## Requirements

- Bash 4 or later
- Unix-like shell environment

## Usage

Run the script from the repository root:

```bash
./tower_of_hanoi.sh [number_of_disks]
```

If no disk count is provided, the script defaults to `4` disks.

Example:

```bash
./tower_of_hanoi.sh 5
```

## How it works

- The script initializes three pegs as Bash arrays.
- Disk sizes are represented by integers, with `1` as the smallest disk.
- The recursive function `hanoi` moves disks between pegs following Tower of Hanoi rules.
- After each move, the current contents of all three pegs are printed.

## Notes

- The script uses `set -euo pipefail` for safer execution.
- A brief pause (`sleep 0.2`) is added between moves for readability.

## License

This project is available under the terms of the `LICENSE` file.