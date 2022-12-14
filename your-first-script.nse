--This script fulfills the project reqs for "First Lua Script" in Codecademy

-- HEAD

local nmap = require "nmap"
local shortport = require "shortport"

description = [[
Practice NSE Script!
]]

author = "Frances Saunders"
 
license = "Same as Nmap--See https://nmap.org/book/man-legal.html"
 
categories = {"default", "safe"}

-- RULE

portrule = function(host, port)
	local port_to_check = { number = 4000, protocol = "tcp" }
	local port_state = nmap.get_port_state(host, port_to_check)

	return port_state ~= nil
		and port_state.state == "open"
end

-- ACTION

action = function(host, port)
	return "Yes, this port is open!"
end
