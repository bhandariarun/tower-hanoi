#!/usr/bin/env bash
# Tower of Hanoi demonstration in bash
# Uses recursion to move disks between pegs and prints the peg state step-by-step.

set -euo pipefail

# Number of disks to solve.
DISKS=${1:-4}

# Initialize pegs as arrays. pegA starts with disks from largest (DISKS) to smallest (1).
declare -a pegA pegB pegC
for ((i=DISKS; i>=1; i--)); do
  pegA+=("$i")
done

# Print the current state of the three pegs.
print_pegs() {
  echo "============================="
  echo "Peg A: ${pegA[*]}"
  echo "Peg B: ${pegB[*]}"
  echo "Peg C: ${pegC[*]}"
  echo "============================="
  sleep 0.2
}

# Move one disk from one peg array to another.
move_disk() {
  local src_name=$1
  local dst_name=$2
  local -n src=$src_name
  local -n dst=$dst_name
  local disk
  disk=${src[-1]}
  unset 'src[-1]'
  dst+=("$disk")
}

# Recursive solution for Tower of Hanoi.
# Arguments: number_of_disks source_peg target_peg auxiliary_peg
hanoi() {
  local n=$1
  local src_name=$2
  local dst_name=$3
  local aux_name=$4
  local -n src=$src_name
  local -n dst=$dst_name
  local -n aux=$aux_name

  if (( n == 0 )); then
    return
  fi

  # Move n-1 disks from source to auxiliary.
  hanoi $((n - 1)) "$src_name" "$aux_name" "$dst_name"

  # Move the remaining disk from source to target.
  move_disk "$src_name" "$dst_name"
  echo "Move disk from ${src_name##peg} to ${dst_name##peg}."
  print_pegs

  # Move n-1 disks from auxiliary to target.
  hanoi $((n - 1)) "$aux_name" "$dst_name" "$src_name"
}

# Clear screen and print initial configuration.
clear
echo "Tower of Hanoi demo with $DISKS disks"
print_pegs
hanoi "$DISKS" pegA pegC pegB

echo "Solved!"