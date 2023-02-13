local net = net
local ns = "mrc_msg"
MercNet = {Receives = {}}

if SERVER then
    util.AddNetworkString("mrc_msg")
end

net.Receive(ns, function()
    local nm = net.ReadString()
    print(nm)
    if MercNet.Receives[nm] then
        print("Shiiiet")
        MercNet.Receives[nm]()
    end
end)

module("MercNet", package.seeall)

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