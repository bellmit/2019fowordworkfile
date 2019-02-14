#! /bin/bash
a=/dw-data/EBS-DATA/20190116/csv/20190116_ap_invoice_distributions_all_201901.csv
 echo $a
temp=${a##*/}
b=${temp%.*}
echo $b