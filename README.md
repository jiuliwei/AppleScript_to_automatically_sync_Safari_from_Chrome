# AppleScript_to_automatically_sync_Safari_from_Chrome
This script fixes [Aneureka's sync-from-chrome-to-safari](https://gist.github.com/Aneureka/41e4ee6ecb797bc97d20a44927d3dcbe) and adds new functionality to reset bookmarks.

# Background
Bookmarks imported from chrome to safari will only add new bookmarks, but will not delete old bookmarks.

# Solution
This script first resets safari bookmarks to empty, and then imports bookmarks, passwords and history from chrome.<br />
I assumed the maximum number of bookmarks to delete in the root directory is 20, but you can modify it.<br />

# Automation
You can use cron to create a task and run the script once a day to keep safari consistent with chrome.<br />
Here is an [example](https://towardsdatascience.com/a-step-by-step-guide-to-scheduling-tasks-for-your-data-science-project-d7df4531fc41#:~:text=towardsdatascience.com-,cron%20for%20Linux/macOS,-In%20macOS%2C%20you) of setting up automated tasks/jobs in macOS & Linux.<br />
Run this line in the terminal to edit your user crontab:
```
crontab -e
```
Add this line to run every day at 4 o'clock:<br />
```
0 4 * * * osascript /path/to/your/sync-from-chrome-to-safari.scpt
```
