#!/bin/bash

awk -F "\t" '
BEGIN {central = 0;
        east = 0;
        south =0;
        west = 0;}
{   
    region = $13
    if (region != "Region")
    {
        if (region == "Central")
        {   
            central += $21
        }
        else if (region == "East")
        {
            east += $21
        }
        else if (region == "South")
        {
            south += $21
        }
        else if (region == "West")
        {
            west += $21
        }
    }
}
END {
    if (central < east && central < south && central < west)
    {
        terkecil = central
        regionkecil = "Central"
    }
    else if (east < central && east < south && east < west)
    {
        terkecil = east
        regionkecil = "East"
    }
    else if (south < central && south < east && south < west)
    {
        terkecil = south
        regionkecil = "South"
    }
    else if (west < central && west < east && west < south)
    {
        terkecil = west
        regionkecil = "West"
    }
    print regionkecil, terkecil
}' Laporan-TokoShiSop.tsv