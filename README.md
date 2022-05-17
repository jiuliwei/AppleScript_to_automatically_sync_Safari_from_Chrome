# AppleScript_to_automatically_sync_Safari_from_Chrome
This script fixes [Aneureka's sync-from-chrome-to-safari](https://gist.github.com/Aneureka/41e4ee6ecb797bc97d20a44927d3dcbe) and adds new functionality to reset bookmarks.

# Background
Bookmarks imported from chrome to safari will only add new bookmarks, but will not delete old bookmarks.

# Solution
- This script first resets safari bookmarks to empty, and then imports bookmarks, passwords and history from chrome.
- I assumed the maximum number of bookmarks to delete in the root directory is 20, but you can modify it.

# Automation
Because I want to automatically sync bookmarks every night, but at this point my mac's lid is closed. The [cron](https://en.wikipedia.org/wiki/Cron) is unusable when the lid is closed. Therefore, I decided to use [launchd](https://medium.com/swlh/how-to-use-launchd-to-run-services-in-macos-b972ed1e352) to do the automation.

1. Move the **local.sync.plist** file to **/Users/<your_user_name>/Library/LaunchAgents**.
2. Run this line in the terminal to get **your-user-id**
```
id -u
```
3. Then run this line to move to the LaunchAgents folder:
```
cd ~/Library/LaunchAgents/
```
4. We can now load our agent by executing the following command:
```
launchctl bootstrap gui/<your-user-id> local.sync.plist
```
5. Unloading an agent is as easy as:
```
launchctl bootout gui/<your-user-id> local.sync.plist
```

*Tips:*

*Here is an example of [using launchd agents to schedule scripts on macOS](https://davidhamann.de/2018/03/13/setting-up-a-launchagent-macos-cron/).*

*Here is an example of [using cron to set up automated tasks/jobs in macOS & Linux](https://towardsdatascience.com/a-step-by-step-guide-to-scheduling-tasks-for-your-data-science-project-d7df4531fc41#:~:text=towardsdatascience.com-,cron%20for%20Linux/macOS,-In%20macOS%2C%20you).*
