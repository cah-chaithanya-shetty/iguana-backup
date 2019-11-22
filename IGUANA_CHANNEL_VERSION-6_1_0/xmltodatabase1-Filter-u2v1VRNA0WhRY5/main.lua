function main(Data)
   -- Parse the JSON message
   local Msg = xml.parse(Data)  
   
  local Conn = db.connect{
          api=db.SQL_SERVER, 
      name='SQL SERVER',
      user='',      -- use empty string for integrated security
      password='',  -- use empty string for integrated security 
      use_unicode = true,
      live = true
      }

    
  local SqlInsert =
   [[
   INSERT INTO patient12
   (
   Id,
   LastName,
   GivenName,
   Ssn
   )
   VALUES
   (
   ]]..
   "'"..Msg.patients.patient12.id.."',"..
   "\n   '"..Msg.patients.patient12["first-name"][1].."',"..
   "\n   '"..Msg.patients.patient12["last-name"][1].."',"..
   "\n   '"..Msg.patients.patient12["social-security-no"][1].."'"..
   '\n   )'  
  
  
   Conn:execute{sql=SqlInsert, live=true}
   Conn:query('Select * from patient12')
  Conn:query('Select * from patient11')
Conn:query('Select * from dbo.patient12,dbo.patient11 where patient12.id = patient11.id and patient12.givenname = patient11.givenname and patient12.lastname = patient11.lastname and patient12.ssn = patient11.ssn')



end