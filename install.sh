#!/bin/bash

ROOT_UID=0
BIN_NAME=pattern-matcher
BIN_DIR=
SHARE_DIR=

if [ $UID -eq $ROOT_UID ]; then
	BIN_DIR=/usr/bin
	SHARE_DIR=/usr/share
else
	BIN_DIR=$HOME/.local/bin/pattern_matcher
	SHARE_DIR=$HOME/.local/share
	
	mkdir -p $BIN_DIR
	echo export PATH=\$PATH:$BIN_DIR >> $HOME/.bashrc
fi

SHARE_DIR=$SHARE_DIR/$BIN_NAME

mkdir -p $SHARE_DIR
dotnet publish -o $SHARE_DIR > /dev/null

ln -s $SHARE_DIR/$BIN_NAME $BIN_DIR/$BIN_NAME
chmod +x $BIN_DIR/$BIN_NAME
