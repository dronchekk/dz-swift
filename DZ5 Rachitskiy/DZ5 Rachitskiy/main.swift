//
//  main.swift
//  DZ5 Rachitskiy
//
//  Created by Andrey rachitsky on 21.09.2021.
//

import Foundation

//MARK: - Последовательности
enum CarDoors {
    case open
    case closed
}

enum CarWindows {
    case open
    case middle
    case closed
}

enum CarEngine {
    case start
    case stop
    case turbo
}

enum CarTrailer {
    case yes
    case no
}

//MARK: - ПРотокол
protocol Car {
    var name: String { get }
    var realease: String { get }
    var windows: CarWindows { get set }
    var engine: CarEngine { get set }
    var doors: CarDoors { get set }
}

//MARK: - Расширение протокола
extension Car {
    mutating func carDoors(doors: CarDoors) {
        self.doors = doors
    }
    mutating func carWindows(windows: CarWindows) {
        self.windows = windows
    }
    mutating func carEngine(engine: CarEngine){
        self.engine = engine
    }
}

//MARK: - Создание класов и импплементация протокола
final class SportCar: Car {

    var name: String
    var realease: String
    var windows: CarWindows = .closed
    var engine: CarEngine = .turbo
    var doors: CarDoors = .closed

    init(name: String, realease: String) {
        self.name = name
        self.realease = realease
    }

    func carEnguine (_ sostoyanie: CarEngine) {
        switch sostoyanie {
        case .turbo:
            print("Включение турбо режима")
        case .start:
            print("Обычный режим")
        case .stop:
            print("Торможение")
        }
    }
}

final class TrunkCar: Car {

    var name: String
    var realease: String
    var windows: CarWindows = .closed
    var engine: CarEngine = .start
    var doors: CarDoors = .open

    init(name: String, realease: String) {
        self.name = name
        self.realease = realease
    }

    func carEnguine (_ sostoyanie: CarEngine) {
        switch sostoyanie {
        case .turbo:
            print("Турбо режим отсутствует в данном автомобиле")
        case .start:
            print("Обычный режим")
        case .stop:
            print("Торможение")
        }
    }
    func carTrailer (_ sostoyanie: CarTrailer) {
        switch sostoyanie {
        case .no:
            print("Прицеп отсутствует")
        case .yes:
            print("Прицеп на месте)")
        }
    }
}

//MARK: - Расширение классов
extension SportCar: CustomStringConvertible {
    var description: String {
        return "Модель - \(name), год выпуска - \(realease))"
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "\(name)  \(realease)"
    }
}

//MARK: - Создание объектов классов и действия с ними
var spotrCarOne = SportCar(name: "BMW X5", realease: "2020")
print(spotrCarOne)
spotrCarOne.carEnguine(.turbo)

var trunkCarOne = TrunkCar(name: "UAZ Patriot", realease: "2021")
print("------------")
print(trunkCarOne)
trunkCarOne.carTrailer(.yes)
trunkCarOne.carEnguine(.turbo)
