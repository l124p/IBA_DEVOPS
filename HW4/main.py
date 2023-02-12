# Звёздный треугольник
# объявление функции
def draw_triangle():
	n = 7
	for i in range(1,9):
		print(' '*n,'*'*i,'*'*(i-1),sep = '')
		n -= 1

# основная программа
draw_triangle()  # вызов функции