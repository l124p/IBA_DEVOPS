#!/bin/bash

echo "Enter the file search directory"
read -r dir
grep -rwl error "$dir" | xargs rm -f
