#!/bin/bash

# This function adding and return archive file name
function write_file_name() {
        read -p "write archive name: " ARCHIVE_NAME >&2
        echo $ARCHIVE_NAME
}

function isExist(){
        CURRENT_DIR=$(pwd)
        ARCHIVE_NAME=$(write_file_name)
        
        if [  -d  "./TRASH"  ]
        then 
                echo "TRASH Folder exist"
        else
                mkdir "$HOME/Desktop/TRASH"
                
        fi
        if [ ! -f $ARCHIVE_NAME ]
        then
                echo "Archive not found"
                return 1
        else    
                echo "$ARCHIVE_NAME found"
                if [[ $ARCHIVE_NAME == *.gz ]]
                then
                        echo "File type is gz. Moving to TRASH and extracting..."
                        $CURRENT_DIR
                        cd "$HOME/Desktop/TRASH"
                        tar -xvf "${CURRENT_DIR}/${ARCHIVE_NAME}"
                        cd $CURRENT_DIR
                        rm "${ARCHIVE_NAME}"
                elif [[ $ARCHIVE_NAME == *.lzma ]]
                then
                        echo "File type is lzma. Moving to TRASH and extracting..."
                        $CURRENT_DIR
                        cd "$HOME/Desktop/TRASH"
                        ulzma  "${CURRENT_DIR}/${ARCHIVE_NAME}"
                        cd $CURRENT_DIR
                        rm "${ARCHIVE_NAME}"
               
                elif [[ $ARCHIVE_NAME == *.bz2 ]]
                then
                         echo "File type is bzip2. Moving to TRASH and extracting..."
                         $CURRENT_DIR
                         cd "$HOME/Desktop/TRASH"
                         bunzip2 "${CURRENT_DIR}/${ARCHIVE_NAME}"
                         cd $CURRENT_DIR
                         rm "${ARCHIVE_NAME}"
                elif [[ $ARCHIVE_NAME == *.zip ]]
                       then
                        echo "This is zip archive"
                        if command -v unzip &> /dev/null
                        then
                                echo "unzip installed"
                                unzip "$ARCHIVE"
                        else
                                echo "Error: unzip is not installed. Run: sudo apt install unzip"
                        fi 
                fi 
                        


                
        fi

}



isExist

# This function finding archive file in your location
# function find_archive() {
#         ARCHIVE=$(extract_archive)
#         echo " checking archive $ARCHIVE"
        
#         if [ ! -f "$ARCHIVE" ]
#         then
#                 echo "Archive not find"
#         else
#                 echo "Archive found $ARCHIVE"
                
#                 if [[ "$ARCHIVE" == *.gz ]]
#                 then
#                         echo "This is gzip archive"
#                         if command -v gunzip &> /dev/null
#                         then
#                                 echo "gunzip installed"
#                                 gunzip -k "$ARCHIVE"
#                         else
#                                 echo "Error: gunzip is not installed"
#                         fi
#                 fi

#                 if [[ "$ARCHIVE" == *.zip ]]
#                 then
#                         echo "This is zip archive"
#                         if command -v unzip &> /dev/null
#                         then
#                                 echo "unzip installed"
#                                 unzip "$ARCHIVE"
#                         else
#                                 echo "Error: unzip is not installed. Run: sudo apt install unzip"
#                         fi
#                	elif 

# 	       	fi
#                 if [[ "$ARCHIVE" == *.bz2 ]]
#                 then
#                         if [[ "$ARCHIVE" == *.tar.bz2 ]]
#                         then
#                                 echo "This is tar.bz archive"
#                                 tar -xjvf $ARCHIVE.tar.bzip
                                
#                         fi
#                         else
#                                 bunzip2 -k $ARCHIVE.tar.bz2
#                                 echo " This is a bzip archive"
#                         fi 
#                 fi
#                 if [[ "$ARCHIVE" == *.xz]]
#                 then
#                         echo "This is lzma archive"
#                         if [[ "$ARCHIVE" == *.tar.xz]]
#                         then
#                                 tar -xf $ARCHIVE.tar.xz
#                         fi
#                         unlzma -k $ARCHIVE.xz
#                 fi
#                 if [[ "$ARCHIVE" == *.gz ]]
#                 then
                        
                

#         fi
# }

# find_archive
