local diff = redis('sdiff', KEYS[1], KEYS[2]) 
local req_max = tonumber(ARGV[1])
local max
if req_max > table.getn(diff) then max = table.getn(diff) else max = req_max end
local output = {} 
for i=0, max-1 do
  table.insert(output, table.remove(diff))
end
return output 
