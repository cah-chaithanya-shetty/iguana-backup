function main(Data)
   -- Parse the JSON message
   local Msg = xml.parse(Data)  
   
   local filename=
     local Conn = db.connect{
          api=db.SQL_SERVER, 
      name='SQL SERVER',
      user='',      -- use empty string for integrated security
      password='',  -- use empty string for integrated security 
      use_unicode = true,
      live = true
      }

    
   -- (2) create insert query string
   local SqlInsert =
   [[
   INSERT INTO patient
   (
   Id,
   LastName,
   GivenName,
   Ssn
   )
   VALUES
   (
   ]]..
   "'"..Msg.patients.patient.id.."',"..
   "\n   '"..Msg.patients.patient["first-name"][1].."',"..
   "\n   '"..Msg.patients.patient["last-name"][1].."',"..
   "\n   '"..Msg.patients.patient["social-security-no"][1].."'".. 
   '\n   )'
   
  
  
   Conn:execute{sql=SqlInsert, live=true}
   Conn:query('Select * from patient')
   Conn:query('Select * from patient11')
Conn:query('Select * from dbo.patient,dbo.patient11 where patient.id = patient11.id and patient.givenname=patient11.givenname and patient.lastname=patient11.lastname and patient.ssn=patient11.ssn')



end
   
   