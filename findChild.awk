#!/usr/bin/awk -f

BEGIN {
    state = "init"
}

/^\t\t[0-9]+=/ {
    unit = gensub(/=/, "", "g", $0)
    unit = gensub(/\t/, "", "g", unit)
}

/^\t\t\tfat=[0-9]+/ {
    leftover = gensub(/\t\t\tfat=/, "", "g", $0)
    if(leftover == me) {
        printf "%s\n", unit
    }
}
