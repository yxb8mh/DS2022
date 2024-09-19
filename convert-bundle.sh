#!/bin/bash

wget https://s3.amazonaws.com/ds2002-resources/labs/lab3-bundle.tar.gz

tar -xf lab3-bundle.tar.gz

awk '!/^[[:space:]]*$/' lab3_data.tsv > cleaned_data.tsv

tr '\t' ',' < cleaned_data.tsv > lab3_data.csv 

data_lines=$(tail -n +2 lab3_data.csv | wc -l)

echo "Number of data rows (excluding header): $data_lines"

tar -czf converted-archive.tar.gz lab3_data.csv


