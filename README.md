idleLogger
==========

Log the Idle Time of the current user in Windows. Similar to query user

It saves the current idle time every 15 minutes to c:\temp\idleLog.txt.
Change the sleep time to change the interval between logs.

Note: The idle time is measured right at that mark:
If somebody moved the mouse right before that moment, then the idle time is null.

It is compatible with ocra. So you can compile it with
```
ocra idleLogger.rb
```

or this way if you don't want to see a cmd window:

```
ocra --window idleLogger.rb
```


Disclaimer: Please don't use it to spy on your employees.
This software is not suited for that task. 
Keep in mind, that employees might work away from the computer or on another device.
It was developed to check if a computer locks itself before a certain
idle time was up.
