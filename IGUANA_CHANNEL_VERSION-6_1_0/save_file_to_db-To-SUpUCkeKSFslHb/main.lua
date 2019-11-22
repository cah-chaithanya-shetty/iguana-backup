function main()
   
     --  Msg = xml.parse(Data) 
   
  --[[local F = io.open('C:\\Program Files\\iNTERFACEWARE\\Iguana\\season\\storefile_in_db\\source\\xmlfile.xml', "r")
   local   Content =  F:read('*a')
   F:close()]]--
   
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
   INSERT INTO dbo.patient101
   (
  patient_details
   )
   VALUES
   ('<patients> 
      <patient id="2668844">
      <first-name>Gary</first-name>
      <last-name>Fitzgerald</last-name>
      <social-security-no>957-321-126</social-security-no>
      </patient>
  </patients>')]]

 
  Conn:execute{sql=SqlInsert, live=true}
	   

   
end