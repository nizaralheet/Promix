#!/usr/bin/env bash

#	Front
#	default color: 404453 for Promix
oldfront=#593923
newfront=#404453


sed -i "s/#404453/$oldfront/g" "$1"
sed -i "s/$oldfront/$newfront/g" "$1"


