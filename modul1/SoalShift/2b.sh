#!/bin/bash

awk -F "\t" '
BEGIN {}
{   
    orderid = $2
    city = $10
    if (orderid != "Order ID" && city != "City")
    {
        year = substr(orderid, 4, 4)
        if (year == 2017 && city == "Albuquerque")
        {   
            custname[$7]
        }
    }
}
END {print("Daftar nama customer di Albuquerque pada tahun 2017 antara lain: ")
    for (i in custname)
        print i}' Laporan-TokoShiSop.tsv