data = []

with open('remove_xyz.txt', 'r+') as file:
	for each in file:
		s=each.strip()
		x=s.find('#')
		if s!='' and x!=0:
			data.append(s[:x-1]+'\n')

with open('xyz.txt', 'w') as file:
	file.writelines(data)
