import Cocoa

var greeting = "Hello, playground"

/*
 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.

 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).

 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.

 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.

 5. Создать несколько объектов каждого класса. Применить к ним различные действия.

 6. Вывести сами объекты в консоль.
 */

enum WindowsCar {
    case open
    case closed
}

enum EngineCar {
    case on
    case off
}

enum SportMode {
    case on
    case Off
}

enum Luggage {
    case full
    case empty
}

protocol Car {
    var brand: String {get}
    var release: Int {get}
    var engineState: EngineCar {get set}
    var windowsState: WindowsCar {get set}
}

extension Car {
    mutating func changeEngineState(engineState: EngineCar) {
        self.engineState = engineState
    }
    mutating func chageWindowsState(windowsState: WindowsCar) {
        self.windowsState = windowsState
    }
}

class basicCar: Car {
    var brand: String
    var release: Int
    var engineState: EngineCar = .off
    var windowsState: WindowsCar = .closed
    init(brand: String, release: Int) {
        self.brand = brand
        self.release = release
    }
}

final class sportCar: basicCar, CustomStringConvertible {
    var sportMode: SportMode = .Off
    var description: String {
        return "engine is \(engineState), windows is \(windowsState), sport mode is \(sportMode), release date is \(release)"
    }
}

final class trunkCar: basicCar, CustomStringConvertible {
    var trunkState: Luggage = .empty
    var description: String {
        return "engine is \(engineState), windows is \(windowsState), trunk is \(trunkState), release date is \(release)"
    }
}

var car1 = sportCar(brand: "BMW", release: 2020)
var car2 = trunkCar(brand: "Volvo", release: 2000)

car1.changeEngineState(engineState: .on)
car1.sportMode = .on

car2.chageWindowsState(windowsState: .open)
car2.trunkState = .full

print(car1.description)
print(car2.description)

