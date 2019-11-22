-- The main function is the first function called from Iguana.
function main(Data)  
mymathmodule = require("mymath")
mymathmodule.file()
mymathmodule.connectdb()
mymathmodule.insert()

mymathmodule.execute()
   
   
end