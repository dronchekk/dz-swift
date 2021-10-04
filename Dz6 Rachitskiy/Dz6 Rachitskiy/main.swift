//  main.swift
//  Dz6 Rachitskiy
//
//  Created by Andrey rachitsky on 23.09.2021.
//

import Foundation

struct Catalog {
    var name: String
    var price: Int

}

extension Catalog: CustomStringConvertible {
    var description : String {
        return "Name: \(name), Price: \(price)"
    }
}

struct Queue<T> {
    private var elements: [T] = []

    public var isEmpty: Bool {
        return elements.count == 0
    }

    mutating func enqueue(element: T) {
        elements.append(element)
    }
    mutating func dequeue()->T {
        return elements.removeLast()
    }

    public var last: T? {
        if isEmpty {
            print("The elemnets aren't found. Array is empty.")
            return nil
        } else {
            print("Last element is \(elements.last!)")
            return elements.last
        }
    }

    public var first: T? {
        if isEmpty {
            print("The elemnets aren't found. Array is empty.")
            return nil
        } else {
            print("First element is \(elements.first!)")
            return elements.first
        }
    }

    public subscript(index: Int) -> T? {
        if index > self.elements.count || index < 0 {
            return nil
        } else {
            return self.elements[index]
        }
    }

    func printMyQueue() {
        print(elements)
    }
}

extension Queue {
    func myFilter(predicate:(T) -> Bool) -> [T] {
        var result = [T]()
        for element in elements {
            if predicate(element) {
                result.append(element)
            }
        }
        return result
    }
}



var model = Queue<Catalog>()
model.enqueue(element: .init(name: "iPhone 13 Pro", price: 100000))
model.enqueue(element: .init(name: "iPad Mini New", price: 48000))
model.enqueue(element: .init(name: "Macbook Pro M1", price: 130000))
model.enqueue(element: .init(name: "Macbook Air M1", price: 100000))
model.enqueue(element: .init(name: "Apple Watch Series 7", price: 46000))
model.enqueue(element: .init(name: "iPhone 13", price: 70000))
model.enqueue(element: .init(name: "iMac 24 inch M1", price: 130000))
model.enqueue(element: .init(name: "iPad New", price: 31000))

model.printMyQueue()
model.last
model.first

let filterCatalog = model.myFilter(predicate: {$0.price <= 80000})
print(filterCatalog)
