#!/bin/bash

MOVIES=("kgf" "rrr" "kgf-2")

#size of above array is 3
# index are 0,1,2

# list always start with 0

echo "first movie is: ${MOVIES[0]}"

echo "second movie is: ${MOVIES[1]}"

echo "all movies are: ${MOVIES[@]}"