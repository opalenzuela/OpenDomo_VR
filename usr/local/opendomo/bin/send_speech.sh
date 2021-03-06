#!/bin/bash


# This should change based on language.
# lang=es or something.
# Multiple results
#URL="http://www.google.com/speech-api/v1/recognize?lang=en&client=chromium&maxresults=6"
read IDIOMA < /etc/opendomo/lang
if [ "$IDIOMA" == "es" ]  
then
	URL="https://www.google.com/speech-api/v2/recognize?output=json&lang=es_ES&key=AIzaSyAkUWPwPxq5XLWmKjXx5DfsivZHaQNPNo8"
	#URL="https://www.google.com/speech-api/v1/recognize?lang=en_US.utf8&key=AIzaSyCnl6MRydhw_5fLXIdASxkLJzcJh5iX0M4"
else
	URL="https://www.google.com/speech-api/v2/recognize?output=json&lang=en_EU&key=AIzaSyAkUWPwPxq5XLWmKjXx5DfsivZHaQNPNo8"	
	#URL="https://www.google.com/speech-api/v1/recognize?lang=en_US.utf8&client=chromium"
fi

if [ -z "$1" ];then
    echo ""
    exit 1
fi

curl -X POST --data-binary @"$1" --header 'Content-Type: audio/x-flac; rate=16000;' '$URL' > result.json
#wget -q --post-file "$1" --header 'Content-type: audio/x-flac; rate=16000' '$URL' 
