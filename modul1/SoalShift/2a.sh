#!/bin/bash

awk -F "\t" '
BEGIN {
    max = 0;
    rowidmax =0;
    orderid =0;
}
{
        rowid=$1;
        sales=$18;
        profit=$21;
        if(rowid != "Row ID" && sales != "Sales" && profit != "Profit")
        {
        cp = sales - profit
        profitp = (profit / cp) * 100
                if(max <= profitp){
                max = profitp
                rowidmax = rowid
                orderid=$2
                }
        }
}
END {print orderid, max}' Laporan-TokoShiSop.tsv