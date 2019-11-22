-- The main function is the first function called from Iguana.
-- The Data argument will contain the message to be processed.
function main()
   
    local Conn = db.connect{
      api=db.SQL_SERVER, 
      name='SQL SERVER',
      user='',      -- use empty string for integrated security
      password='',  -- use empty string for integrated security 
      use_unicode = true,
      live = true
   }

   
  
  -- local open = io.open
   
   
local function factorial(num)      
      fact =1 
      for i=1,num do
         fact=fact*i
       end
      return fact     
end
        
   
local function read_file(path)      
    res = factorial(path)    
    return res      
end

   local file = io.open("season\\week1\\Source\\game.txt", "rb") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
   
   
local fileContent = read_file(content);
print (fileContent);
  
 
     os.execute( "mkdir season\\week1" )
    --newFile = io.open( "season\\week1\\Destination\\target1.txt", "w+" )
    newFile = io.open( "season\\week1\\Destination\\target1.txt", "w+" )
    newFile:write(fileContent)
    newFile:close()



local text = 'This is an Informational log entry'

-- link to the current message ID
iguana.logInfo(text)
iguana.logInfo(text, iguana.messageId()) -- identical result to the line above

-- include the message ID in the log entry
iguana.logInfo(text..iguana.messageId())

-- save linked messages in a database
Conn:execute{sql = "INSERT IguanaMessage ('MsgId', 'LogMsg') VALUES ("..iguana.messageId()..","..text..")"}
   end

--[[
local open = io.open

local function read_file(path)
    local file = open("season\\week1\\Source\\game.txt", "rb") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end

local fileContent = read_file("foo.html");
print (fileContent);
   
   
      os.execute( "mkdir season\\week1" )
    newFile = io.open( "season\\week1\\Destination\\game.txt", "w+" )
    newFile:write( tonumber(fileContent) + 20 )
    newFile:close()
--]]
