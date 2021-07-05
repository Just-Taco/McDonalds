local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRPclient = Tunnel.getInterface("vRP", "dit_script") 
vRP = Proxy.getInterface("vRP")

HT = nil
TriggerEvent('HT_base:getBaseObjects', function(obj) HT = obj end)

ItemsPlayerCanBuy = { -- Prevents Exploiting...
  "combomeal",
  "bigmac",
  "mcpollo",
  "mcroyaldeluxe",
  "cbo",
  "cuartodelibra",
  "grandmcextreme",
  "bigchickensupreme",
  "bigcrispybbq",
  "bigdoublecheese",
  "hamburgesa",
  "hamburgesadepollo",
  "mcfish",
  "happymeal",
  "cocacola",
  "nestea",
  "agua",
  "monsterenergy",
  "cerveza",
  "aquarius",
  "sprite",
  "colacao",
  "nuggets",
  "patatasfritas",
  "topfries",
  "fanta",
}

RegisterServerEvent('vb-mcdonalds:realizarpedido')
AddEventHandler('vb-mcdonalds:realizarpedido', function(data)
    local source = source
    local kore = true
    local _price = tonumber(data.price * data.amount)
    local penge = vRP.getMoney({user_id})
    local user_id = vRP.getUserId({source})
    local _isitemvalid = false
    for k,v in pairs(ItemsPlayerCanBuy) do
      if v == data.item then
        _isitemvalid = true
      end
    end
    if _isitemvalid then
      if kore == true then
        vRP.tryPayment({user_id, _price})
        vRP.giveInventoryItem({user_id, data.item, data.amount, true})
        TriggerClientEvent('mythic_notify:client:SendAlert',source, { type = 'success', length = 5000, text = "Du købte " .. data.item .. " for " .. data.price .. "$ penge." }) -- EXAMPLE
        -- ADD YOUR NOTIFICATIONS RIGHT HERE!
      else
        TriggerClientEvent('mythic_notify:client:SendAlert',source, { type = 'error', length = 5000, text = "Du har ikke nok kontanter." }) -- EXAMPLE
        -- ADD YOUR NOTIFICATIONS RIGHT HERE!
      end
    else
      DropPlayer(source, "Player has triggered a VB-McDonald's event to purchase an item that isn't on the valid item list!")
    end
end)
