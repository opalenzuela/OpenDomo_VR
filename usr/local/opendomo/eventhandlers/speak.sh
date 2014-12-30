#!/bin/bash
#desc:Speak
#package:odspeech

# Copyright(c) 2014 OpenDomo Services SL. Licensed under GPL v3 or later

CFGFILE="/etc/opendomo/speech/espeak.conf"
source $CFGFILE

TEXT=`i18n.sh $3`
		
/usr/bin/espeak $PARAMS $TEXT
