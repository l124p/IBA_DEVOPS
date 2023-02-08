from ping3 import ping

url="google.com"
status = ping(url)

if status == False:
	print("Does`n work")
else:
	print("Success")