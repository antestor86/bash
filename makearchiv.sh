#!bin/bash
read -p "Write Directory" dir
tar --create --file=archive.tar $dir
gzip archive.tar > archive.tar.gz

