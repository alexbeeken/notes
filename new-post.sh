echo 'time to make a new post...'

read -p 'short-title: ' SHORT

FPATH="$HOME/Code/alexbeeken/content/blog/$SHORT"
INDEX_PATH="$FPATH/index.md"

echo $FPATH
echo $INDEX_PATH

mkdir $FPATH

touch $INDEX_PATH
 
read -p 'long-title: ' LONG

IDATE=`date +%F_%T`

read -p 'category: ' CATEGORY

read -p 'tag: ' TAG 

cat > $INDEX_PATH <<- EOM
---
template: post
title: $LONG
slug: $SHORT
date: "${IDATE}T12:00:00.121Z"
category: $CATEGORY 
tags: ["$TAG"]
---
EOM
