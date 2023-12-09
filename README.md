# rcspoofer

a file you can put in your .bashrc file or .zshrc file to automatically spoof all device information on startup.

# setup

first, you must disable ipv6 (if ipv6 is already disabled on your device this part doesnt matter)
next, make sure that you hash your sudo passwd so the script can run automatically, and place the hashed password
in the line: hashed_password=$(echo -n ''<--- IN HERE | base64 -d)
you can change the encoding to be anything youd like, here i just chose base64 because its simple
next, add the file to .bashrc or .zshrc in the follwing fashion:
sudo nano .bashrc(or .zshrc)
scroll to the bottom
add this line:
alias spoof='PATH TO SCRIPT & SCRIPT NAME'
ex: '/home/user/scripts/bashrcspoofer.sh'

# Final Steps
(in .rc file) just press enter and type on the next line

spoof

then press ctrl+x and select yes and save as same name(unless you want to change it later)

and there you go!! your devices information will be spoofed into something random but tenable every time a terminal
instance is launched.
