getgenv().key = "abc.123" -- Your RoNotifier key!
getgenv().DiscordUserID = "866428192713867264" -- Your Discord User ID (Optional)
getgenv().url = "https://discord.com/api/webhooks/1112225256359350303/MTZKrfBZ3aOVd5AlSJXGz7PT5YuYil3wgKSLYUSlLaFfpmZbqPMyv_yNRVbVrfw6v8Qk" -- Your Discord webhook!
getgenv().UICooldown = 1 -- How many minutes until it sends a webhook.

-- Don't change these below!

local Version = "v1.5.1"

local Status = "false"
local Cooldown = UICooldown*60

print("RoNotifier "..Version)

local ActiveStats = coroutine.create(function()
    while task.wait(1) do
        game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.Profile.AnchorPoint = Vector2.new(1,1)
        game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.Profile.Position = UDim2.new(0, 0, 0, 0)
        game:GetService("Workspace").Camera.Blur.Size = 0
        game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.Trade.Profile.Visible = false

        if game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.Profile.Visible == false then
        game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.Profile.Visible = true
        end
    end
end)

    coroutine.resume(ActiveStats)

    while task.wait(Cooldown) do

    local Coins = game:GetService("Players").LocalPlayer.leaderstats.Coins.value
    local TechCoins = game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.Profile.List["Total Tech Coins"].Amount.Text
    local SummerCoins = game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Currency.SummerCoins.TextLabel.Text
    local AquaCoins = game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Currency.AquaCoins.TextLabel.Text
    local Gems = game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Currency.Gems.TextLabel.Text
    local Eggs = game:GetService("Players").LocalPlayer.leaderstats.Eggs.value
    local TimePlayed = game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.Profile.List["Time Played"].Amount.text
    local ChestsBroken = game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Menus.Profile.List["Chests Broken"].Amount.Text

    local data = {
    ["content"] = "<@"..DiscordUserID..">",
    ["embeds"] = {
        {
            ["title"] = "Chest Simulator | RoNotifier",
            ["description"] = "- Coins\n - Regular - "..Coins.."\n - Tech - "..TechCoins.."\n - Summer - "..SummerCoins.."\n - Aqua - "..AquaCoins.."\n- Gems\n - Gems - "..Gems.."\n- Other\n - Time Played - "..TimePlayed.."\n - Chests Broken - "..ChestsBroken.."\n - Eggs Opened - "..Eggs.."\n- Settings\n - Cooldown - "..UICooldown.."m",
            ["type"] = "rich",
            ["color"] = tonumber(0xc71e15),
            ["author"] = {
                ["name"] = game:GetService("Players").LocalPlayer.Name;
                ["url"] = "https://www.roblox.com/users/"..game:GetService("Players").LocalPlayer.UserId.."/profile";
                ["icon_url"] = "https://tr.rbxcdn.com/c5a0eaa88f120293db4e8edbc53dd466/150/150/AvatarHeadshot/Png"
            },
            ["footer"] = {
                ["text"] = "RoNotifier - "..Version;
                ["icon_url"] = "https://i.ibb.co/DLgqRVf/deto5fa-22c69086-a38a-48e5-9e1c-62da7c49047c.png"
            },
            ["thumbnail"] = {
                ["url"] = "https://i.ibb.co/MCTJwbK/image-2023-07-30-155742973.png"
            }
        }
    }
    }

    local newdata = game:GetService("HttpService"):JSONEncode(data)
    local headers = {
    ["content-type"] = "application/json"
    }

    if key == "abc.123" then
            request = http_request or request or HttpPost or syn.request
            local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
            request(abcdef)
        else
            print("[RoNotifier]: Incorrect key!")
        end
end
