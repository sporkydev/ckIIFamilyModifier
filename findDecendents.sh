#!/bin/bash

procParent()
{
    local grandChild=()
    childern=( `awk -v me=$1 -f findChild.awk superTestAwk.ckii` )

    for child in "${childern[@]}"
    do
        grandChildern=( `awk -v me=$child -f findChild.awk superTestAwk.ckii` )
        family+=( $child )
 
        echo $child
        for grandChild in "${grandChildern[@]}"
        do
            echo "Grand Child " $grandChild
            family+=( $grandChild )
            procParent $grandChild
        done
    done
}

parent=235214
procParent $parent

echo "------------All Childern----------------"
cp upgradeFamily.awk upgradeFamilyRun.awk
for child in "${family[@]}"
do
    echo $child
    sed -i "s/# <Upgrade>/\\/^\\\t\\\t\\\tfat=$child\/ {\n   unit = \"leader\"\n   gsub(\"fat=$child\", \"immortal=19\\\n\\\t\\\t\\\tfat=$child\",\$0\)\n}\\n\\n# <Upgrade>/" upgradeFamilyRun.awk
done

echo "-----------Run Upgrade Family-----------"
cp superTestAwk.ckii superTestAwkTest.ckii
`awk -i inplace -v parent=$parent -f upgradeFamilyRun.awk superTestAwkTest.ckii`
