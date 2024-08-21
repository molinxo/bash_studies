!#/usr/bin/env bash

set -euo pipefail

print_header() {
  echo "==== $1 ===="

}

name="${1:-}"
if [[ $# -eq 0 ]]; then
  echo "Error: Name is required."
  echo "Usage: $0 <name>"
  exit 1
fi

print_header "Welcome"
echo "Hello, ${name}! Welcome to our bash script."

while true; do
  read -p "How many files do you want to create? (0-5): " num_files
  if [[ "$num_files" =~ ^[0-5]$ ]]; then
    break
  else
    echo "Please enter a number between 0 and 5."
  fi
done

case $num_files in
0)
  echo "No files will be created."
  ;;
[1-3])
  echo "Creating a few files..."
  ;;
[4-5])
  echo "Creating many files..."
  ;;
esac

files=()
for ((i = 1; i <= num_files; i++)); do
  filename="file_$i.txt"
  echo "This is file_number $i" >"$filename"
  files+=("$filename")
done

print_header "Created Files"
for file in "${files[@]}"; do
  echo "${file##*/}"
done

print_header "Script Completed"
exit 0
