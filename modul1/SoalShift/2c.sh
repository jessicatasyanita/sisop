#!/bin/bash

awk -F "\t" '
BEGIN {consumer = 0
        homeoffice = 0
        corporate =0}
{   
    segment = $8
    if (segment != "Segment")
    {
        if (segment == "Consumer")
        {   
            consumer++
        }
        else if (segment == "Corporate")
        {
            corporate++
        }
        else if (segment == "Home Office")
        {
            homeoffice++
        }
    }
}
END {
    if (consumer < corporate && consumer < homeoffice)
    {
        totaltranskecil = consumer
        segmentkecil = "Consumer"
    }
    else if (corporate < consumer && corporate < homeoffice)
    {
        totaltranskecil = corporate
        segmentkecil = "Corporate"
    }
    else if (homeoffice < consumer && homeoffice < corporate)
    {
        totaltranskecil = homeoffice
        segmentkecil = "Home Office"
    }
    print segmentkecil, totaltranskecil}' Laporan-TokoShiSop.tsv