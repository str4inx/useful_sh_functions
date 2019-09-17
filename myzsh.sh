#!/bin/zsh

# Linux permission calculation function
# Input a linux permission in character format rwx[rwx][rwx]
# Outputs the calculated permission as decimal number
# Example: rwx--xr-x  ->  715
function pmc {

	typeset -A hash
  
  # Regular expression to match the right format
	if [[ "$1" =~ ^([r-][w-][x-])?([r-][w-][x-])?([r-][w-][x-]$) ]]; then
		hash["r"]=4 hash["w"]=2 hash["x"]=1 hash["-"]=0
		((x=${#1}/3))
		for (( i=0; i<x; i++ )); do
			(((y=i*3),(yt=y+3),(n=0)))
			for (( ; y<yt; y++ )); do
				((n+=${hash["${1:$y:1}"]}))
			done
			printf $n
		done
		printf "\n"

	else
		echo "n/a"
	fi
}
