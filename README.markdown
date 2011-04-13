#Pinkoman

##About
As stated in the description, please do not use this against other people. This must be granted admin
privileges or else a great majority of the commands will fail. I made this for educational purposes
to learn more about bash and Mac-specific terminal commands. A lot of people have been asking me to make
programs that check if a certain program is running on the mac and respond with a reaction, so hopefully
this provides some code to help you get started. More code samples are detailed in "Other."


##Installation
Still a work in progress...

1. [Download "brightness" to the current directory of chmod2.sh](http://mattdanger.net/2008/12/adjust-mac-os-x-display-brightness-from-the-terminal/)
2.  



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
Simulating keypresses is simple. You can also specify a combination of letters+shift,ctrl,option easily.
<pre><code>
  # A troll way of using this is during games.
  # For instance, in TF2, team chat is "y".
  # The script below spams "Please **** me in the ***!" for tf2. I don't approve of vulgar language,
  # but I'm lazy to look up keycodes and a friend wrote this for me, so here's some sample code.
  spamTF2() {
        sudo osascript -e 'tell application "System Events"' -e 'tell application processes' -e 'key code 16' -e 'key code 35' 
        -e 'key code 37' -e 'key code 14' -e 'key code 0' -e 'key code 1' -e 'key code 14' -e 'key code 49' -e 'key code 15' 
        -e 'key code 0' -e 'key code 35' -e 'key code 14' -e 'key code 49' -e 'key code 46' -e 'key code 14' -e 'key code 49' 
        -e 'key code 34' -e 'key code 45' -e 'key code 49' -e 'key code 17' -e 'key code 4' -e 'key code 14' -e 'key code 49' 
        -e 'key code 0' -e 'key code 1' -e 'key code 1' -e 'key code 18 using {shift down}' -e 'key code 36'  -e 'end tell' -e 'end tell'
   }</code></pre>


Here's a good diagram of a keyboard and their corresponding keycodes (source: http://controlyourmac.com/applescript.html):
        <img src="http://public.dwang.org/github/pinkoman/keycode.png" width="800px" height="300px">


You can also simulate mouse clicks without any external libraries:
<pre><code>    # The above clicks at point (1, 1) on the screen. On my mac it clicked the apple logo.
    simulate_mouseclick() {
        sudo osascript -e 'tell application "System Events" to tell process "Terminal" to click at {1,1}'
    }
</pre></code>
        

##Todo
      inject_cp():
      # Detects when the user copies youtube links
      # Replaces the copied youtube link with a random rickroll link.

      inject_keypress():
      # Params: any unicode character.
      # Simulates keypress of the unicode character.

Feel free to suggest features at pinkoman [at] dwang.org
