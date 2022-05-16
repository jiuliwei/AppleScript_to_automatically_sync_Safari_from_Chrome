-- close google chrome to perform importing 
do shell script "killall \"Google Chrome\" || echo \"Google Chrome is not running.\""

do shell script "killall Safari || echo \"Safari is not running.\""
tell application "Safari" to activate

tell application "System Events" to tell application process "Safari"
	delay 0.5
	log "Syncing..."

	-- Open bookmarks
	tell menu 1 of menu bar item "Bookmarks" of menu bar 1
		click menu item "Edit Bookmarks"
	end tell
	delay 2
	tell window "Bookmarks"
		click UI Element 3 of UI Element 1 of row 1 of outline 1 of scroll area 1 of group 1 of tab group 1 of splitter group 1
	end tell
	
	-- Delete all bookmarks
	keystroke "f"
	key code 125
	key down {shift}
	repeat 20 times -- assume at most 20 bookmarks, but can be modified
		key code 125
	end repeat
	key up {shift}
	key code 51

	delay 5

	-- Import from chrome
	log "Syncing..."
	tell menu item "Import From" of menu "File" of menu bar item "File" of menu bar 1
		tell menu "Import From"
			click menu item 1
		end tell
	end tell
	tell window "Bookmarks"
		tell sheet 1
			click UI Element "Import"
		end tell
	end tell
	delay 5
	tell window "Bookmarks"
		tell sheet 1
			click UI Element "OK"
		end tell
	end tell

	delay 3
	log "Complete sync"
end tell


-- close safari
do shell script "killall Safari || echo \"Safari is not running.\""

-- restore chrome closed tabs and minimize window in background
-- delay 0.5
-- log "Opening chrome in background"
-- do shell script "open -a \"Google Chrome\" --args --restore-last-session --no-startup-window"
