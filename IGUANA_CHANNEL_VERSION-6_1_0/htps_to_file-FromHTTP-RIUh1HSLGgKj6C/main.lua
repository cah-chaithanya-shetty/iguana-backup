URL='https://spseliteqa.cardinalhealth.net/qa_84/ws/DmsWebService'
function main()

   newFile = io.open( "C:\\Program Files\\iNTERFACEWARE\\Iguana\\season\\https_to_file\\destination\\https_to_file.txt", "w+" )
	      --local R =net.http.post{url=URL,live=true}
       local R = net.http.post{response_headers_format='raw',body='<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsc="wsclient.dms.tecsys.com"><soapenv:Header/><soapenv:Body><wsc:search><arg0><userName>webordqa</userName><password>webordtcsqa</password><sessionId>0</sessionId><criteria><DmsTaxWebordering><UsTaxRegion>NJ</UsTaxRegion></DmsTaxWebordering> </criteria><maxRows>100000</maxRows></arg0></wsc:search></soapenv:Body></soapenv:Envelope>',url=URL,live=true}
       
        local X =xml.parse{data=R}
    
      
        c=net.http.respond{headers='',body=X["soap:Envelope"]["soap:Body"]["ns2:searchResponse"]["return"].result.DmsTaxWebordering.CumulativeInterstateTaxRate:nodeText(),persist=false,code=5}
    print(c)
            
        newFile:write(c)
       
        newFile:close()
   
 
 
end

