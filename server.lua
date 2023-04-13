Citizen.CreateThread(function()
    Citizen.Wait(10000)
    print("Starte Script...")
    for k,v in pairs(Config.Scripts) do
        if v.anticheat == false then
            if v.name ~= "" then
                print("Starting: " .. v.name)
                func_startres(v.name)
                Citizen.Wait(2000)
            end
        end
    end
    TriggerEvent('unlockServer')
    print("Der Server wurde erfolgreich neugestartet!")
end)


function func_startres(resname)
    print(resname)
    StartResource(resname)
end


local isServerLocked = true

AddEventHandler('playerConnecting', function(a, setReason)
  if isServerLocked then
    CancelEvent()
    setReason('Der Server startet gerade, bitte habe ein wenig Geduld.')
  end
end)

RegisterServerEvent('unlockServer')
AddEventHandler('unlockServer', function()
  isServerLocked = false
  TriggerClientEvent('chatMessage', -1, '^2Der Server ist jetzt entsperrt.')
end)