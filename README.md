This is a Lua script for a FiveM server. The script is designed to restart all non-anticheat resources on the server and unlock it after a set time period.

Usage:

Copy the script into your FiveM server resources folder.
Add the script to your server.cfg file.
Configure the script by editing the Config table in the script.
Restart your server.
Configuration:
In the Config table, you can specify which resources should be restarted by editing the Scripts table. Each entry in the Scripts table should have the following properties:

name (string): The name of the resource to be restarted.
anticheat (boolean): Whether or not the resource contains anticheat measures. If set to true, the resource will not be restarted.
Note: The script also contains a server lock feature, which prevents players from connecting while the server is restarting. This feature can be disabled by removing the playerConnecting event and the unlockServer event.

Disclaimer:
This script is provided as-is and is not guaranteed to be error-free. Use at your own risk.
