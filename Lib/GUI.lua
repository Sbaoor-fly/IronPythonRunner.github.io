local json = require ("./ilua/GUI/dkjson")
function GUI(name,uuid,tab)
	local reads = tool:ReadAllText('./ilua/GUI/'..name..'.json')
	local a = 1
	while(not(a > #tab))do
		reads = string.gsub(reads,'$'..a,tab[a])
		a = a+1
	end
	local gui = json.decode(reads)
	if(gui['type'] == 'simple')then
		return mc:sendSimpleForm(uuid,gui['title'],gui['context'],json.encode(gui['list']))
	elseif(gui['type'] == 'modal')then
		return mc:sendModalForm(uuid,gui['title'],gui['context'],gui['button1'],gui['button2'])	
	end
end
print('[GUI Lib] 加载成功')
print('[GUI Lib] version = 1.0.0')