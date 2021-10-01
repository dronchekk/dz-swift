//
//  main.swift
//  DZ7 Rachitskiy
//
//  Created by Andrey rachitsky on 01.10.2021.
//

import Foundation

enum OnlineShopError: Error {
    case errorName
    case errorCount
    case errorPrice
}

struct Shop {
    let price: Int
    var count: Int
    let product: Product
}

/// Девайс
struct Product {
    let name: String
}

class OnlineShop {
    var inventory = ["iPhone": Shop(price: 70000, count: 1, product: Product(name: "iPhone")),
                     "iPad": Shop(price: 50000, count: 0, product: Product(name: "iPad")),
                     "Macbook": Shop(price: 100000, count: 1, product: Product(name: "Macbook"))]

    var cointDeposited = 50000 // Ваши деньги

    func shop(itemNamed name: String) throws -> Product {
        guard let item = inventory[name] else { throw OnlineShopError.errorName }
        guard item.count > 0 else { throw OnlineShopError.errorCount }
        guard item.price < cointDeposited else { throw OnlineShopError.errorPrice }

        cointDeposited -= item.price
        print(cointDeposited)

        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        print("Product was sold \(name)")

        return newItem.product

    }

    func errors (_ variant: OnlineShopError){
        switch variant {
        case .errorName:
            print("Товара с таким названием нет в наличии")
        case .errorCount:
            print("Товар закончился")
        case .errorPrice:
            print("У вас не хватает денег")
        }
    }
}

var onlineShop = OnlineShop()

do {
    try onlineShop.shop(itemNamed: "iPhone")
} catch let error {
    print(error.localizedDescription)
}

do {
    try onlineShop.shop(itemNamed: "iPad")
} catch let error {
    print(error.localizedDescription)
}
do {
    try onlineShop.shop(itemNamed: "Mackbook")
} catch let error {
    print(error.localizedDescription)
}
