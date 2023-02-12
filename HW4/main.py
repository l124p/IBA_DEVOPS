"Звёздный прямоугольник"
# объявление функции
def draw_box():
    for i in range(14):
        if i == 0 or i == 13:
            print('*' * 10)
        else:
            print('*        *')

# основная программа
draw_box()  # вызов функции