

    <header>
      <h1>README</h1>
    </header>
    <main>
      <p>This is a Lua script for a FiveM server. The script is designed to restart all non-anticheat resources on the server and unlock it after a set time period.</p>
      <h2>Usage</h2>
      <ol>
        <li>Copy the script into your FiveM server resources folder.</li>
        <li>Add the script to your server.cfg file.</li>
        <li>Configure the script by editing the Config table in the script.</li>
        <li>Restart your server.</li>
      </ol>
      <h2>Configuration</h2>
      <p>In the Config table, you can specify which resources should be restarted by editing the Scripts table. Each entry in the Scripts table should have the following properties:</p>
      <ul>
        <li><code>name</code> (string): The name of the resource to be restarted.</li>
        <li><code>anticheat</code> (boolean): Whether or not the resource contains anticheat measures. If set to true, the resource will not be restarted.</li>
      </ul>
      <p>Note: The script also contains a server lock feature, which prevents players from connecting while the server is restarting. This feature can be disabled by removing the playerConnecting event and the unlockServer event.</p>
      <h2>Disclaimer</h2>
      <p>This script is provided as-is and is not guaranteed to be error-free. Use at your own risk.</p>
      <pre>
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
</pre>
</main>

  </body>
</html>
