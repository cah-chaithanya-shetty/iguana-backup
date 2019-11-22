-- The main function is the first function called from Iguana.
-- The Data argument will contain the message to be processed.


function parse(Data)
 
   local Rows = Data:split("\n")
 
   for i=1, #Rows do  
     
         Rows[i]  = Rows[i]:split(",") 
      
         for j=1, #Rows[i] do
            Rows[i][j] = Rows[i][j]      
         end   
   end
  
   Rows[#Rows] = nil
  

return Rows
end


function main(Data)
   d=Data
   x = parse(d)
   local Conn = db.connect{
      api=db.SQL_SERVER, 
      name='SQL SERVER',
      user='',      -- use empty string for integrated security
      password='',  -- use empty string for integrated security 
      use_unicode = true,
      live = true
   }

  
  for i=2,#x do  
   local SqlInsert =
   [[
   INSERT INTO Employee_Details
   (
   sno,
   fname,
   lname,
   salary,
   company
   )
   VALUES
   (
   ]]..
   "'"..x[i][1].."',"..
   "\n   '"..x[i][2].."',"..
   "\n   '"..x[i][3].."',".. 
   "\n   '"..x[i][4].."',".. 
     "\n   '"..x[i][5].."'".. 
      '\n   )'
  Conn:execute{sql=SqlInsert, live=true}  
     
  end
  
  
   
end