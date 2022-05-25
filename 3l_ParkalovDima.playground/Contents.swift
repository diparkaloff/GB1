import Cocoa

var greeting = "Hello, playground"
/*1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
 
 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.

 6. Вывести значения свойств экземпляров в консоль.*/

enum engineCar {
    case start
    case stop
}
enum windowsState {
    case open
    case close
}

struct vehicle {
    let brand: String
    let releaseDate: Int
    var trunk: Int
    var engine : engineCar{
        willSet {
            if newValue == .start {
                print ("\(brand) двигатель запущен")
            } else {print("\(brand) двигатель заглушен")}
        }
    }
    var windows : windowsState {
        willSet {
            if newValue == .open {
                print("\(brand) окна открыты")
            } else { print("\(brand) окна закрыты") }
        }
    }
    var fullTrunk: Int
}

var carSport = vehicle(brand: "Volvo", releaseDate: 2021, trunk: 50, engine: .start, windows: .close, fullTrunk: 60)
var carTruck = vehicle(brand: "Hundai", releaseDate: 2019, trunk: 650, engine: .stop, windows: .open, fullTrunk: 600)

if carSport.trunk == carSport.fullTrunk {
    print("заполнен")
} else if carSport.trunk > carSport.fullTrunk {
    print("ошибка - превышает объем")
} else {
    print("занято \(carSport.trunk) места из \(carSport.fullTrunk)")
}

if carTruck.trunk == carTruck.fullTrunk {
    print("заполнен")
} else if carTruck.trunk > carTruck.fullTrunk {
    print("ошибка - превышает объем")
} else {
    print("занято \(carTruck.trunk) места из \(carTruck.fullTrunk)")
}

carSport.engine = .start
carSport.windows = .close
carTruck.engine = .stop
carTruck.windows = .open

print("Машина марки \(carSport.brand) выпущена в \(carSport.releaseDate).")
print("Машина марки \(carTruck.brand) выпущена в \(carTruck.releaseDate).")


