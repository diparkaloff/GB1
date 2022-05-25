import Cocoa

var greeting = "Hello, playground"

/*
 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.

 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)

 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
 */

enum CardsColor {
    case blue, black, red, white
}

protocol SizeCards {
    var numberOfCards: Int { get set}
    
}

struct Cards: SizeCards {
    var color: CardsColor
    var numberOfCards: Int
}

extension Cards: CustomStringConvertible {
    var description: String {
        return "In deck \(numberOfCards)  \(color) cards"
    }
}
   

struct Queue <T: SizeCards> {
    private var elements: [T] = []

    mutating func enqueue (element: T) {
        elements.append(element)
    }
    mutating func dequeue() ->T? {
        return elements.removeLast()
    }
    
    var sizeOfCards: Int {
        var numberOfCards = 0
        for element in elements {
            numberOfCards += element.numberOfCards
        }
        return numberOfCards
    }
    subscript (elements: Int ...) -> Int {
        var numberOfCards = 0
        for index in elements where index < self.elements.count {
            numberOfCards += self.elements[index].numberOfCards
        }
        return numberOfCards
    }

}

extension Queue {
    func filtred (predicate: (T) -> Bool) -> [T] {
        var myArr = [T]()
        for elem in elements {
            if predicate(elem){
                myArr.append(elem)
            }
        }
        return myArr
    }
}


var deckCards = Queue<Cards>()

deckCards.enqueue(element: Cards(color: .black, numberOfCards: 30))
deckCards.enqueue(element: Cards(color: .red, numberOfCards: 20))
deckCards.enqueue(element: Cards(color: .white, numberOfCards: 6))
deckCards.enqueue(element: Cards(color: .blue, numberOfCards: 12))


deckCards[0, 1, 2, 3]
print(deckCards)
