# AppleScript_to_automatically_sync_Safari_from_Chrome
This script fixes [Aneureka's sync-from-chrome-to-safari](https://gist.github.com/Aneureka/41e4ee6ecb797bc97d20a44927d3dcbe) and adds new functionality to reset bookmarks.

# Background
Bookmarks imported from chrome to safari will only add new bookmarks, but will not delete old bookmarks.

# Solution
- This script first resets safari bookmarks to empty, and then imports bookmarks, passwords and history from chrome.
- I assumed the maximum number of bookmarks to delete in the root directory is `20`, but you can modify it in **sync-from-chrome-to-safari.scpt** file.
```
repeat 20 times -- assume at most 20 bookmarks
	key code 125
end repeat
```
- The program needs to input the password to unlock the mac. You should replace `<your_password>` with your own user password in **sync-from-chrome-to-safari.scpt** file.
```
-- wake the computer
do shell script "caffeinate -u -t 3"
tell application "System Events"
	keystroke "<your_password>"
	keystroke return
end tell
```

# Automation
Because I want to automatically sync bookmarks every night, but at this point my mac's lid is closed. The [cron](https://en.wikipedia.org/wiki/Cron) is unusable when the lid is closed. Therefore, I decided to use [launchd](https://medium.com/swlh/how-to-use-launchd-to-run-services-in-macos-b972ed1e352) to do the automation.

1. You should replace `the path to sync-from-chrome-to-safari.scpt` with your own path in **local.sync.plist** file.
```
<key>ProgramArguments</key> 
  <array> 
    <string>/usr/bin/osascript</string> 
    <string>the path to sync-from-chrome-to-safari.scpt</string>
  </array> 
```
2. I set it to run daily at 4 am. You can change the time it runs in **local.sync.plist** file.
```
<key>StartCalendarInterval</key>
  <dict>
      <key>Hour</key>
      <integer>4</integer>
      <key>Minute</key>
      <integer>0</integer>
  </dict>
```
3. Move the **local.sync.plist** file to **/Users/<your_user_name>/Library/LaunchAgents**.
4. Run this line in the terminal to get **your-user-id**
```
id -u
```
5. Then run this line to move to the LaunchAgents folder:
```
cd ~/Library/LaunchAgents/
```
6. We can now load our agent by executing the following command:
```
launchctl bootstrap gui/<your-user-id> local.sync.plist
```
7. Now everything is ok.
8. If you want to modify, remember to unload the agent and then load it again:
```
launchctl bootout gui/<your-user-id> local.sync.plist
```

*Tips:*

*Here is an example of [using launchd agents to schedule scripts on macOS](https://davidhamann.de/2018/03/13/setting-up-a-launchagent-macos-cron/).*

*Here is an example of [using cron to set up automated tasks/jobs in macOS & Linux](https://towardsdatascience.com/a-step-by-step-guide-to-scheduling-tasks-for-your-data-science-project-d7df4531fc41#:~:text=towardsdatascience.com-,cron%20for%20Linux/macOS,-In%20macOS%2C%20you).*
