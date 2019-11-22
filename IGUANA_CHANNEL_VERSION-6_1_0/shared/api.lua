
 local api={}

function api.getdata()
    R = net.http.get{url='team-scale.com/TestData/ng_text_v15/api', live=true}
end

function api.extract()
    X = json.parse{data=R}
end

function api.display()
   queue.push(X[6].distance)
   queue.push(X[7].city)
   queue.push(X[1].mainPhotoUrl)
end
return api  
 
