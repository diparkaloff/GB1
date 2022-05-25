import Cocoa
import CoreFoundation

var greeting = "Hello, playground"

/*
 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.

 2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.

 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.

 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.

 5. Создать несколько объектов каждого класса. Применить к ним различные действия.

 6. Вывести значения свойств экземпляров в консоль.
 */

enum CarEngineState {
    case on, off
}
enum CareDoorsState {
    case open, close
}

class Car {
    let color: String
    let brand: String
    let numberOfDoors: Int
    let numberOfWheels: Int
    var engineState: CarEngineState {
        willSet {
            newValue == .on ? print("Двигатель запущен") : print("Двигатель заглушен")
        }
    }
    var doorsState: CareDoorsState {
        willSet {
            newValue == .open ? print("Двери открыты") : print("двери закрыты")
        }
    }
    
    init(color: String, brand: String, numberOfDoors: Int, numberOfWheels: Int, engineState: CarEngineState, doorsState: CareDoorsState) {
        self.color = color
        self.brand = brand
        self.numberOfDoors = numberOfDoors
        self.numberOfWheels = numberOfWheels
        self.engineState = engineState
        self.doorsState = doorsState
    }
}

class SportCar: Car {
    var maxSpeedCar: Int
    init(color: String, brand: String, numberOfDoors: Int, numberOfWheels: Int, engineState: CarEngineState, doorsState: CareDoorsState, maxSpeedCar: Int) {
        self.maxSpeedCar = maxSpeedCar
        super.init(color: color, brand: brand, numberOfDoors: numberOfDoors, numberOfWheels: numberOfWheels, engineState: engineState, doorsState: doorsState)
        
        doorsState == CareDoorsState.open ? print("Перекрестись:)") : print("Счастливого пути")
    }
}

class TrunkCar: Car {
    var fillTrunk: Bool
    var maxWeight: Int
    
    init(color: String, brand: String, numberOfDoors: Int, numberOfWheels: Int, engineState: CarEngineState, doorsState: CareDoorsState, fillTrunk: Bool, maxWeight: Int) {
        self.fillTrunk = fillTrunk
        self.maxWeight = maxWeight
        super.init(color: color, brand: brand, numberOfDoors: numberOfDoors, numberOfWheels: numberOfWheels, engineState: engineState, doorsState: doorsState)
        
        fillTrunk == true ? print("Товар загружен") : print("Произведите загрузку")
    }
}

var car1 = SportCar(color: "White", brand: "BMW", numberOfDoors: 5, numberOfWheels: 4, engineState: .on, doorsState: .open, maxSpeedCar: 250)
var car2 = TrunkCar(color: "Black", brand: "Volvo", numberOfDoors: 2, numberOfWheels: 6, engineState: .off, doorsState: .open, fillTrunk: false, maxWeight: 800)

car2.fillTrunk = true
car2.fillTrunk = false

print("------------------------")

car1.doorsState = .open
car1.doorsState = .close
car2.engineState = .on
car2.engineState = .off

print("-------------------------")

print("Характеристики легковой машины : цвет - \(car1.color), марка - \(car1.brand), колличество дверей - \(car1.numberOfDoors), колличество колес - \(car1.numberOfWheels), максимальная скорость - \(car1.maxSpeedCar) km/h")
print("Характеристики грузовой машины : цвет - \(car2.color), марка - \(car2.brand), колличество дверей - \(car2.numberOfDoors), колличество колес - \(car2.numberOfWheels), максимальная грузоподъемность - \(car2.maxWeight) kg")
