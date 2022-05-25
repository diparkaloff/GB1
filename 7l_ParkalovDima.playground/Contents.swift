import Cocoa

var greeting = "Hello, playground"

/*
 1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.

 2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
 */

enum ScoreErrors: Error {
    case inScoreNotThisProduct
    case notEnoughMoney
}

struct Product {
    var price: Int
    var numberOfProduct: Int
}

class Score {
    var deposite = 9
    
    
    var productShelf = [
        "1": Product(price: 10, numberOfProduct: 1),
        "2": Product(price: 11, numberOfProduct: 2),
        "3": Product(price: 12, numberOfProduct: 3)]
    func getTheProduct (withName: String) throws {
        guard var product = productShelf[withName] else {
            throw ScoreErrors.inScoreNotThisProduct
        }
        guard product.numberOfProduct > 0 else {
            throw ScoreErrors.inScoreNotThisProduct
        }
        guard product.price <= deposite else {
            throw ScoreErrors.notEnoughMoney
        }
        deposite -= product.price
        product.numberOfProduct -= 1
        productShelf[withName] = product
        print("You got the Product: \(withName)")
    }
}


let score = Score()
try? score.getTheProduct(withName: "1")
score.deposite
score.productShelf


do {
    try score.getTheProduct(withName: "2")
} catch ScoreErrors.inScoreNotThisProduct {
    print("Product is not in score")
} catch ScoreErrors.notEnoughMoney {
    print("Not enough money")
}

