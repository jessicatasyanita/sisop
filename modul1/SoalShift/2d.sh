#!/bin/bash

awk -F "\t" '
BEGIN {profitkecil = 999999999999}
{   
    reg = $13
    if (reg != "Region")
    {
        region[reg]+= $21
    }
}
END {
    for (i in region){
        if(region[i] <= profitkecil){
            regionkecil = i
            profitkecil = region[i]
        }
    }
    print regionkecil, profitkecil
}' Laporan-TokoShiSop.tsv