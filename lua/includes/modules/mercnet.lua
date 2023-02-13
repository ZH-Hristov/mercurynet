local net = net
local ns = "mrc_msg"

if SERVER then
    util.AddNetworkString("mrc_msg")
end

net.Receive(ns, function()
    local nm = net.ReadString()
    if MercNet.Receives[nm] then
        MercNet.Receives[nm]()
    end
end)

module("MercNet", package.seeall)

MercNet.Receives = {}

function MercNet.Start(name, unr)
    net.Start(ns, unr)
    net.WriteString(name)
end

function MercNet.Receive(name, func)
    MercNet.Receives[name] = func
end

function MercNet.RemoveReceive(name)
    MercNet.Receives[name] = nil
end