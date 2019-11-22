-- The main function is the first function called from Iguana.
function main()

   
apimodule = require("api")
apimodule.getdata()
apimodule.extract()
apimodule.display()
  
end
