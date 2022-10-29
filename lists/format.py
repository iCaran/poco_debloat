data = []

with open('packages.txt', 'r+') as file:
	for each in file:
		data.append(each[8:])

with open('all.txt', 'w') as file:
	file.writelines(data)