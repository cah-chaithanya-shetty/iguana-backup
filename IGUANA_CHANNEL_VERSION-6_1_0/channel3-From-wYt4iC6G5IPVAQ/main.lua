-- The main function is the first function called from Iguana.
function main()
  
   local file = io.open("season\\week1\\Source\\game.txt", "rb") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
   queue.push{data=content}
  
end