local mymath =  {}
function mymath.connectdb()
   Conn = db.connect{
          api=db.SQL_SERVER, 
      name='SQL SERVER',
      user='',      -- use empty string for integrated security
      password='',  -- use empty string for integrated security 
      use_unicode = true,
      live = true
      }
end

function mymath.file()
 --  print(a+b)
 F = io.open('C:\\targetfolder\\menu.xml', "r")
       Content =  F:read('*a')

    --F = io.open('C:\\source\\SampleData.txt', "r")
    --Content =  F:read('*a')
   F:close()
  -- local Msg = xml.parse(Content)
  -- print(a-b)
      --print(Msg)
    
end 
 

function mymath.insert()
     SqlInsert =
   [[
   INSERT INTO menu2
   (
   
   VAL
 )
   VALUES
   (
  
   ]]..

   --"'"..Msg.patients.patient.id.."',"..
  -- "\n   '"..Msg.patients.patient["first-name"][1].."',"..
  -- "\n   '"..Msg.patients.patient["last-name"][1].."',"..
  -- "\n   '"..Msg.patients.patient["social-security-no"][1].."'"..
  -- '\n   )'  
   
   "'"..Content.."')"
   end

function mymath.execute()
  -- print(a/b)
    Conn:execute{sql=SqlInsert, live=true} 
    --print(os.date("%x"))
   --Conn:query('SELECT * FROM TRY6')
end

return mymath 