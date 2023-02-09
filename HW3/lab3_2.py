from ping3 import ping

url="google.com"
status = ping(url)

if status == False or status == None:
	print("Does`n work")
else:
	print("Success")
