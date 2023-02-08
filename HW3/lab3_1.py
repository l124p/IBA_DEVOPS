str1 = input("Введите строку :")

count_s = 0

for ch in str1:
	if ch.isupper():
		count_s += 1
print("Количество больших букв равняется :", count_s)