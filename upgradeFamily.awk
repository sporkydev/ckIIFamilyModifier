#!/usr/bin/awk -f

BEGIN {
    state = "init"
}

/^\t\t([0-9]+)=/ {
    cond=sprintf("%s=", parent)
    if($1==cond)
        unit = "leader"
}

/^\t\t\tfat=235214/ {
    unit = "leader"
    gsub("fat=235214", "immortal=19\n\t\t\tfat=235214",$0)
}

# /^\t\t\tfat=235214/ { unit = "leader"; gsub("fat=235214", "immortal=19\n\t\t\tfat=235214",$0)



# <Upgrade>

/^\t\t\tatt=/ {
    if(unit=="leader") 
        gsub("[0-9]+ ([0-9]+ )+[0-9]+", "1000 1000 100 100 100",$0)
} 

/^\t\t\ttr=/ {

    if(unit=="leader") 
        gsub("[0-9]+ ([0-9]+ )+[0-9]+", "203 205 53 56 61 8 16 12 4 111 158 108 109 110 130 105 107 112 106 131 177 104 103 102 129 174 128 181 69",$0)
}

/^\t\t\tdna=/ {
    unit="init"
}

{
    print
}
