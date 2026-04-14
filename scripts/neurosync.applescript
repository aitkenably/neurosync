# The goal is to not reuse any Terminal windows already open, *unless* that 
# open window was an initial window launched by the application.
#
# If the Terminal app is running, we want to create a new window 
# and launch our app in that window. 
#
# If the Terminal app is not running, we want to start it. Depending 
# on app settings, running the Terminal app may or may not open
# a new window. 
#	If it doesn't open a window, we want to create a new window. 
#	If it does open a window, we want to reuse it. 
#

on launchTerminal(terminalRunning)
	tell application "Terminal"
		activate
		
		if terminalRunning then
			do script ""
		else
			if (count of windows) = 0 then
				# new launch, but no default window
				do script ""
			end if
		end if
		
		set current settings of front window to settings set "Grass"
		do script "clear && cd ~/Development && vim" in front window
		
	end tell
end launchTerminal


tell application "System Events"
	set terminalRunning to (bundle identifier of every process) contains "com.apple.Terminal"
end tell

launchTerminal(terminalRunning)