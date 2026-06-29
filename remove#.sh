#!/bin/bash
function getscript(){
    read -p "write script name " SCRIPT_NAME >&2
    if [[ ! -f $SCRIPT_NAME ]]
    then 
        echo " script is not exist"
        return 1
    else
        echo "script found ${SCRIPT_NAME}" 
      
    fi
}

function edit_script(){
    getscript
    echo "$SCRIPT_NAME"
    echo "---------------------"
    awk 'NR == 1{print $0}' test.sh > edited_script.sh | 
    awk 'NR > 1 {print $0}' test.sh | cut -f1 -d "#" >> edited_script.sh
    sed -i '/^$/ d' edited_script.sh



}

#TODO
#Սկրիպտը գտնելուց հետո կարդում ենք պարունակությունը


edit_script
