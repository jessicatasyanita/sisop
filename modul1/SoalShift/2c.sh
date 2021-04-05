#!/bin/bash

awk -F "\t" '
BEGIN {
    totaltranskecil = 9999999999
}
{   
    segment = $8
    if (segment != "Segment")
    {
    cust_segment[segment]++
    }
}
END {    
    for (i in cust_segment){
        if(cust_segment[i] <= totaltranskecil){
            segmentkecil = i
            totaltranskecil = cust_segment[i]
        }
    }
    print segmentkecil, totaltranskecil}' Laporan-TokoShiSop.tsv