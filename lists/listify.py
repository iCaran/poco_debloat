data = []

with open('remove_miui.txt', 'r+') as file:
	for each in file:
		s=each.strip()
		x=s.find('#')
		if s!='' and x!=0:
			data.append(s[:x-1]+'\n')

with open('miui.txt', 'w') as file:
	file.writelines(data)