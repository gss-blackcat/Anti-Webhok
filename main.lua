local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local httpRequest = http_request or httprequest or request
local starterGui = game:GetService("StarterGui")

function notifyUser()
    starterGui:SetCore("SendNotification", {
        Title = "Webhook Detected";
        Text = "A script has sent a post request to a webhook, press F9 for more info.";
        Icon = 'rbxthumb://type=Asset&id=8387379647&w=150&h=150';
        Duration = 5;
    })
end

hookfunction(httpRequest, function(...)
    local args = {...}
    local request = args[1]

    for key, value in pairs(request) do
        print(tostring(value))
    end

    if request.Method == "POST" then
        args[1] = "DELETE"
        notifyUser()
    end
end)
