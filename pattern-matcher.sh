#!/bin/sh

if [ $# -eq 0 ]; then
	echo "Pattern expected: Provide a pattern to match"
	exit 1
fi

dotnet run $1
