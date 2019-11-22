-- The main function is the first function called from Iguana.
-- The Data argument will contain the message to be processed.
function main(Data)
 
  f1.net.ftp.get{remote_path='/sps/pub/returns/i-o/Import'} 
  f = net.ftp.put{remote_path='\\Wpoh0019dlb01\imprs_data\Import',local_path='/sps/pub/returns/i-o/Import',}
end