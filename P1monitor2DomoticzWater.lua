--lua script to parse P1 Monitor API json Water data to Domoticz using the Domoticz http/https poller virtual hardware
--version 1.0
--API URL http://[IPaddressP1monitor]/api/v1/watermeter/hour?limit=1&json=object

--Set Domoticz idx (find the correct idx at Setup > Devices)

local Water_idx = 20

--Retrieve the content

s = request['content'];

--Remove array square bracket

s_clean = string.sub(s, 2, -2)

--Split json data

local Utility_Water = domoticz_applyJsonPath(s_clean,'.WATERMETER_CONSUMPTION_LITER')
 
--Send to Domoticz

domoticz_updateDevice(Water_idx, '' , Utility_Water)

--Print to log
--Uncomment for debugging.

print(Water_idx, '' , Utility_Water)
