#!/bin/bash

echo -e "Changing timestamp...\n"

magick -verbose samsung-tv-original.jpg -font /System/Library/Fonts/Helvetica.ttc -pointsize 24 -fill white -annotate +10+30 "$(date '+%Y-%m-%d %H:%M:%S')" samsung-tv.jpg

sleep 1

echo -e "\nUploading file...\n"

scp -P 21098 -i ~/.ssh/id_store samsung-tv.jpg jinypjqg@68.65.123.71:~/public_html

sleep 1

echo -e "\nPurging cache...\n"

# Purge by URL
#curl -X POST -H "Fastly-Key: $FASTLY_API_TOKEN"  https://api.fastly.com/service/TdSeL7Bffv5ti1vn02Nl6b/purge/demo.jinyean.store/samsung-tv.jpg

# Purge All
curl -X POST -H "Fastly-Key: $FASTLY_API_TOKEN"  https://api.fastly.com/service/TdSeL7Bffv5ti1vn02Nl6b/purge_all


