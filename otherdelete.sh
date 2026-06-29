#!/bin/bash

function addusername() {
    USERNAME=$USER
    echo "$USERNAME"
}

function make_path(){
    USERNAME=$(addusername)
    USER_PATH="$HOME/Desktop/TRASH"
    if [ ! -d "$USER_PATH" ]; then
        mkdir -p "$USER_PATH"
    fi
}

function CREATE_ARCHIVE(){
    make_path
    
    # Ուղղված է՝ հեռացվել են >&2 նշանները
    read -p "write archive name : " ARCHIVE_NAME
    read -p "write file or directory name to pack : " ARGUMENT_NAME
    
    # Ստուգում ենք՝ արդյոք ֆայլը/թղթապանակը ընդհանրապես գոյություն ունի՞
    if [ ! -e "$ARGUMENT_NAME" ]; then
        echo "Error: File or directory '$ARGUMENT_NAME' does not exist." >&2
        return 1
    fi

    # Սիմվոլիկ հղման (Soft Link) ստուգում
    if [ -L "$ARGUMENT_NAME" ]; then
        ORIGINAL_FILE=$(readlink -f "$ARGUMENT_NAME")
        echo "Удалена только символическая ссылка: $ARGUMENT_NAME"
        echo "Оригинальный файл: $ORIGINAL_FILE"
        rm "$ARGUMENT_NAME"
        return 0 
    fi
    
    # Կոշտ հղման (Hard Link) ստուգում
    LINK_COUNT=$(stat -c "%h" "$ARGUMENT_NAME")
    if [ "$LINK_COUNT" -gt 1 ]; then
        echo "Этот файл является жесткой ссылкой. Список всех ссылок:"
        find . -samefile "$ARGUMENT_NAME"
        rm "$ARGUMENT_NAME"
        echo "Файл удален обычным способом."
        return 0 
    fi
    
    # Արխիվացման տեսակի հարցում (ուղղված)
    read -p "write archive type (1:lzma, 2:gzip): " TYPE
    CURRENT_DIR=$(pwd)
    TIMESTAMP=$(date "+%Y%m%d-%H%M")
    FINAL_NAME="${ARCHIVE_NAME}_${TIMESTAMP}"
    
    cd "$HOME/Desktop/TRASH"
    
    if [ "$TYPE" == "1" ]; then
        echo "Creating LZMA archive inside TRASH..."
        tar -cvf "${FINAL_NAME}.tar" "${CURRENT_DIR}/${ARGUMENT_NAME}"
        lzma "${FINAL_NAME}.tar"
        echo "Archive created: ${FINAL_NAME}.tar.lzma"
    elif [ "$TYPE" == "2" ]; then
        echo "Creating GZIP archive inside TRASH..."
        tar -czvf "${FINAL_NAME}.tar.gz" "${CURRENT_DIR}/${ARGUMENT_NAME}"
        echo "Archive created: ${FINAL_NAME}.tar.gz"
    else
        echo "Incorrect Parameter" >&2
    fi
    
    cd - > /dev/null
}

function checkdate(){
    CREATE_ARCHIVE
    echo "--------------------------------------------------"
    echo "Checking for archives older than 48 hours..."
    TARGET_DIR="$HOME/Desktop/TRASH"
    THRESHOLD_TIME=$(date -d "48 hours ago" +%s)
    
    cd "$TARGET_DIR"
    for file in *; do
        [ -e "$file" ] || continue
        FILE_TIME=$(stat -c %Y "$file")
        if [ $FILE_TIME -lt $THRESHOLD_TIME ]; then
            echo "Removing expired archive: $file (Older than 48 hours)"
            rm "$file"
        fi
    done
    cd - > /dev/null
}

checkdate