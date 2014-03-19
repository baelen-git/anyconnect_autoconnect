-- 1. Place in ~/Library/Scripts and enable the Applescript menu via the Applescript Editor
      -- a. Export to .app so to run from spotlight
-- 2. Substitute "vpn.example.com" and "redacted" for your VPN server and password
-- 3. Open Security & Privacy System Preferences, go to Privacy, Accessibility
-- 4. Enable Applescript Editor and System UI Server (Or for this .app if so exported)
-- 5. Trigger script from the menu
-- 6. Enjoy being connected

-- AnyConnect now refered to as targetApp
set targetApp to "Cisco AnyConnect Secure Mobility Client"


-- Determine if AnyConnect is currently running
tell application "System Events"
	set processExists to exists process targetApp
end tell


-- Close connection if running; else start connection and fill in password
if processExists is true then
	tell application targetApp
		quit
	end tell
else
	tell application targetApp
		activate
	end tell
	
	tell application "System Events"
		repeat until (window 1 of process targetApp exists)
			delay 1
		end repeat
		repeat until (window 2 of process targetApp exists)
			delay 2
		end repeat
		tell process targetApp
			keystroke ("redacted" as string)
			keystroke return
		end tell
	end tell
end if