# P1monitor2Domoticz
lua script to parse P1 Monitor API json data to Domoticz using the Domoticz http/https poller virtual hardware

# Disclaimer
We don't take any responsibility nor liability for using this software nor for the installation.

# Installation
Upload the lua scripts to the lua parsers folder. Typically at __./domoticz/scripts/lua_parsers__

To parse both Electricity/Gas and Water upload both P1monitor2DomoticzPowerGas.lua and P1monitor2DomoticzWater.lua scripts

# Configuration
Add a Domotixz hardware device at Setup > Hardware.

__Choice HTTP/HTTPS poller__

__Method = GET__

__URL = http://[IPaddressP1monitor]/api/v1/powergas/hour?limit=1&json=object__

__Command = P1monitor2DomoticzPowerGas.lua__

__Refresh = 3600__ 


Add a Virtual Sensor for Electricity by clicking Create Virtual Sensor

__Give the sensor a name (e.g. Electricity)__

__Select Type = Custom Sensor__

__Axis Label = kWh__


Add a Virtual Sensor for Gas by clicking Create Virtual Sensor

__Give the sensor a name (e.g. Gas)__

__Select Type = Custom Sensor__

__Axis Label = m3__


If both scripts are uploaded:

Add another Domotixz hardware device at Setup > Hardware.

__Choice HTTP/HTTPS poller__

__Method = GET__

__URL = http://[IPaddressP1monitor]/api/v1/watermeter/hour?limit=1&json=object*__

__Command = P1monitor2DomoticzWater.lua__

__Refresh = 3600__


Add a Virtual Sensor for Electricity by clicking Create Virtual Sensor

__Give the sensor a name (e.g. Water)__

__Select Type = Custom Sensor__

__Axis Label = m3__


Find the idx values

Select Setup > Devices

Take note of the idx values next to the hardware names for Electricity, Gas and optionally Water.

Edit the idx values in the scripts at __./domoticz/scripts/lua_parsers__

# Debugging

Uncomment the print to log lines in the script to check the recieved values
