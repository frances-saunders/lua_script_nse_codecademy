--This script fulfills the project reqs for "First Lua Script" in Codecademy 
--This script scan http

-- HEAD
local stdnse = require "stdnse"
local shortport = require "shortport"

description = [[
  A script to see if http-alt is open and print information about it.
]]

author = "Frances Saunders"

license = "Same as Nmap--See https://nmap.org/book/man-legal.html"

categories = {"default", "safe"}

-- RULES
portrule = shortport.port_or_service(8000, "http-alt")

-- ACTION
action = function(host, port)
  return port.version.name .. " is " .. port.state .. " and running on port number " .. port.number .. "."

 end
