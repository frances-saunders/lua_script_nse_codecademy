--This script fulfills the reqs for "First Lua Script" in Codecademy
--This script is for the finger service 

-- HEAD
local comm = require "comm"
local shortport = require "shortport"

description = [[
  A script to see if http-alt is open and print information about it.
]]

author = "Frances Saunders"

license = "Same as Nmap--See https://nmap.org/book/man-legal.html"

categories = {"default", "discovery", "safe"}

-- RULES
portrule = shortport.port_or_service(79,"finger")
 
-- ACTION
action = function(host, port)
  local try = nmap.new_try()
 
  return try(comm.exchange(host, port, "\r\n", {lines=100, proto=port.protocol, timeout=5000}))
end
