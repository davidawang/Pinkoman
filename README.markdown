#Pinkoman

##About
As stated in the description, please do not use this against other people. This must be granted admin
privileges or else a great majority of the commands will fail. I made this for educational purposes
to learn more about bash and Mac-specific terminal commands. A lot of people have been asking me to make
programs that check if a certain program is running on the mac and respond with a reaction, so hopefully
this provides some code to help you get started. More code samples are detailed in "Other."


##Installation
Coming soon!

##Methods
        ssh():
        # Ensures ssh is turned on
        # Prevents Activity Monitor and Terminal from starting up
        
        retrieve_volume():
        # Uses mac's osascript to retrieve volume. 
        # Returns everything in raw format.

        check_volume():
        # Mostly for debugging purposes:
        # Samples the volumes at two time points.
        # If the volumes are different, it will say "not equal"

        ask_question():
        # Asks a series of yes/no questions.
        # If the user clicks "yes," "googleit19104.txt" is created. (bad way of doing it, will fix in future releases) 

        punishment():
        # Mimics four finger swipe up (toggles show and hide desktop)
        # If the questions were answered "No," this method mimics switching
        # to other spaces (makes it impossible to type).
        # Currently a bug (occassionally with temporarily locked keyboard)

        internetcheck():
        # Ensures that wifi or internet is connected (doesn't check if network is connected to a valid network).
        # Operates on a three strike system. Gives the user 3 chances to connect to the internet.
        # Some of the punishments: screen inverses and brightness changes erratically.
        # If three strikes are already used up, the system plays "Take me out to the Ball Game" on loud volume.
        # If the user tries to mute the annoying song, the song will replay from the beginning.

        hourly_chime():
        # Every hour, it plays a song

        sound():
        # Plays random sounds every 2-5 minutes.
        # Recording friend's voices and playing them back is creepy, but it can be used for other purposes.

Note: to run any of the methods call the method name (without the parenthesis) and add a "&" after it to run in the background. 
I gave an example of a dormant attack at the very end of my code, where certain methods only run if the current system time is past a current time in the future.
I do not condone this, but this can be used as a "just in case" feature in the off chance that the user wants to get back at you.


##Other


##Todo

  inject_cp():
  # Detects when the user copies youtube links
  # Replaces the copied youtube link with a random rickroll link.

Feel free to suggest features at pinkoman [at] dwang.org