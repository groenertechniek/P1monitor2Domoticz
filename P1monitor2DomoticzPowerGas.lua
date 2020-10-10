--lua script to parse P1 Monitor API json Power data to Domoticz using the Domoticz http/https poller virtual hardware
--version 1.0
--API URL = http://[IPaddressP1monitor]/api/v1/powergas/hour?limit=1&json=object

--Set Domoticz idx (find the correct idx at Setup > Devices)

local Electricity_idx = 21
local Gas_idx = 22

--Retrieve the content

s = request['content'];

--Remove array square bracket

s_clean = string.sub(s, 2, -2)

--Split json data

local Utility_Electricity = domoticz_applyJsonPath(s_clean,'.CONSUMPTION_DELTA_KWH')
local Utility_Gas = domoticz_applyJsonPath(s_clean,'.CONSUMPTION_GAS_DELTA_M3')
 
--Send to Domoticz

domoticz_updateDevice(Electricity_idx, '' , Utility_Electricity)
domoticz_updateDevice(Gas_idx, '' , Utility_Gas)

--Print to log
--Uncomment for debugging.

print(Electricity_idx, '' , Utility_Electricity)
print(Gas_idx, '' , Utility_Gas)
