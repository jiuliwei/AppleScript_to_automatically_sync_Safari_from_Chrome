-- Reset bookmarks --

-- wake the computer
do shell script "caffeinate -u -t 3"
tell application "System Events"
	delay 2
	keystroke "<your_password>" -- replace <your_password> with your own user password
	keystroke return
end tell

delay 1

-- close google chrome to perform importing 
tell application "Google Chrome" to quit

delay 1

-- open safari
tell application "Safari" to quit
delay 1
tell application "Safari" to activate
delay 1

-- reset the bookmarks to empty
tell application "System Events" to tell application process "Safari"
	delay 2
	log "Resetting..."

	-- open bookmarks
	click menu item "Edit Bookmarks" of menu 1 of menu bar item "Bookmarks" of menu bar 1
	delay 2
	click UI Element 3 of UI Element 1 of row 1 of outline 1 of scroll area 1 of group 1 of tab group 1 of splitter group 1 of window "Bookmarks"
	delay 1
	
	-- delete all bookmarks
	keystroke "f"
	key code 125
	key down {shift}
	repeat 20 times -- assume at most 20 bookmarks
		key code 125
	end repeat
	key up {shift}
	delay 1
	key code 51
	delay 5
end tell

-- close safari
tell application "Safari" to quit

delay 2

-- reopen safari to make sure bookmarks is empty
tell application "Safari" to activate
delay 5
tell application "Safari" to quit
delay 2

-- sleep
tell application "Finder" to sleep

delay 3





-- Import from chrome --

-- wake the computer
do shell script "caffeinate -u -t 3"
tell application "System Events"
	delay 3
	keystroke "<your_password>" -- replace <your_password> with your own user password
	keystroke return
end tell

delay 2

-- open safari
tell application "Safari" to activate

-- import from chrome
tell application "System Events" to tell application process "Safari"
	delay 2
	log "Syncing..."

	click menu item 1 of menu 1 of menu item "Import From" of menu 1 of menu bar item "File" of menu bar 1
	delay 3
	click UI Element "Import" of sheet 1 of window "Start Page"
	delay 7
	click UI Element "OK" of sheet 1 of window "Start Page"
	delay 5
	log "Complete sync"
end tell

delay 1

-- close safari
tell application "Safari" to quit

delay 1

-- sleep
tell application "Finder" to sleep
