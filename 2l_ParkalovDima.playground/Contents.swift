import Cocoa

var greeting = "Hello, playground"

//1. Написать функцию, которая определяет, четное число или нет
var numberArray = [1, 3, 5, 8, 16, 24, 40]
for sorting in numberArray{
    if sorting % 2 == 0 {
        print("\(sorting) четное число")
    } else {
        print("\(sorting) нечетное число")
    }
}

//2. Написать функцию, которая определит делится ли число без остатка на 3.
for sortingTwo in numberArray{
    if sortingTwo % 3 == 0 {
        print("\(sortingTwo) делится на 3 без остатка")
    } else {
        print("\(sortingTwo) делится на 3 с остатком")
    }
}

//3. Создать возврастающий массив из 100 чисел.
var oneHundred: Array<Int> = []
for i in 1...100{
    oneHundred.append(i)
}
print(oneHundred)

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
var deleteNumbers = oneHundred.filter {$0 % 2 != 0 && $0 % 3 == 0}
   print(deleteNumbers)

/*5. Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
*/
func fibonaciArray(_ n: Int) -> [Double] {
    var fibonaci: [Double] = [0, 1]
    (2...n).forEach{ i in
        fibonaci.append(fibonaci[i - 1] + fibonaci[i - 2])
    }
    return fibonaci
}
print(fibonaciArray(50))

/*6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
 
 a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
 b. Пусть переменная p изначально равна двум — первому простому числу.
 c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
 d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
 e. Повторять шаги c и d, пока возможно.
 */
print("Сделаю позже)")
