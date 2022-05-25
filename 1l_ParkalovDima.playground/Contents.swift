import Cocoa

var str = "Hello, playground"
// 1. Решить квадратное уравнение
let a:Double = 1
let b:Double = 2
let c:Double = 3
var x1:Double = 0
var x2:Double = 0
var x:Double = 0
let d:Double = b * b - 4 * a * c
if d > 0 {
    x1 = (-b + sqrt(d)) / (2 * a)
    x2 = (-b - sqrt(d)) / (2 * a)
    print(x1,x2)
}; if d == 0 {
    x = -b / (2 * a)
    print(x)
}
else {
    print("урвнение не имеет действительных корней")
}

// 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
let k1:Double = 1
let k2:Double = 2
let s:Double = (k1 * k2) / 2
let c1:Double = sqrt(k1 * k1 + k2 * k2)
let p:Double = k1 + k2 + c1
print("площадь \(s), гипотенуза \(c1),периметр \(p)")

// 3. Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет
/*S=(P*I*T:K):100
 S – проценты
 P – сумма вклада
 I – процентная ставка по вкладу
 T – к-во дней вклада
 K – дней в году (при расчете процентов всегда берется 365 дней, даже в високосный год)
 */
let P = 1000
let I = 15
let Y = 5
let K = 365
let T = K * Y
let S = (P * I * T / K) / 100
let result = P + S
print("при вкладе в \(P)р и процентной ставке \(I)% через \(Y) лет общая сумма составит \(result)")
