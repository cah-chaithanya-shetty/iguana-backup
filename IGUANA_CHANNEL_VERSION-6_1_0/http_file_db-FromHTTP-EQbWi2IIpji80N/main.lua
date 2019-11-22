URL='https://spseliteqa.cardinalhealth.net/qa_84/ws/DmsWebService'
function main()
              --os.execute( "mkdir season\\week1" )
   newFile = io.open( 'C:\\Program Files\\iNTERFACEWARE\\Iguana\\season\\http_file_db\\destination\\http_file_db.txt', "w+" )
   
       local R = net.http.post{body='<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsc="wsclient.dms.tecsys.com"><soapenv:Header/><soapenv:Body><wsc:search><arg0><userName>webordqa</userName><password>webordtcsqa</password><sessionId>0</sessionId><criteria><DmsTaxWebordering><UsTaxRegion>NJ</UsTaxRegion></DmsTaxWebordering> </criteria><maxRows>100000</maxRows></arg0></wsc:search></soapenv:Body></soapenv:Envelope>',url=URL,live=true}    
       local X =xml.parse{data=R}   
        c=net.http.respond{body=X["soap:Envelope"]["soap:Body"]["ns2:searchResponse"]["return"].result.DmsTaxWebordering.InterstateTaxRate:nodeText()}
        newFile:write(c)
     
   newFile:close()
   
    
                --[[local F=  io.open( 'C:\\Program Files\\iNTERFACEWARE\\Iguana\\season\\http_file_db\\destination\\http_file_db.txt', "r" )
                  local Content =  F:read('*a')
                 print(Content)
                 a =string.gsub(Content,"'", " \" " )
                 print(a)
                 ]]--
   
   
   
function remove( filename, starting_line, num_lines )
      
  local fp = io.open( filename, "r" ) 
    if fp == nil then 
         return nil 
    end
    content = {}
    i = 1;
    for line in fp:lines() do
        if i < starting_line or i >= starting_line + num_lines then
	        content[#content+1] = line         
	     end
	     i = i + 1
    end
            --print(content)
    if i > starting_line and i < starting_line + num_lines then
	       print( "Warning: Tried to remove lines after EOF." )
    end
  fp:close()
    
      
   fp = io.open("season\\week1\\game22.txt", "w+" )
      for i = 1, #content do
	      fp:write( string.format( "%s\n", content[i] ) )
       end
   fp:close()

end
   
   remove('C:\\Program Files\\iNTERFACEWARE\\Iguana\\season\\http_file_db\\destination\\http_file_db.txt',1,9)
 
   
   
 fp = io.open("season\\week1\\game22.txt", "r+" )
   local Content =  fp:read('*a')
   print(Content)
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
   INSERT INTO table125
   (
   
   VAL
 )
   VALUES
   (
  
   ]]..
   
  "'"..Content.."'"..
'\n   )'  
   
  --local sql1 = [[UPDATE TABLE125 SET VAL = REPLACE(val, '"','''') ]]

   Conn:execute{sql = SqlInsert,live=true}
 -- Conn:execute{sql=sql1,live=true}
   
 -- Conn:query('Select * from table125')
 fp:close()
   
end

