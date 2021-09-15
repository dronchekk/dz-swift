//
//  main.swift
//  DZ 3 Rachitskiy
//
//  Created by Andrey rachitsky on 14.09.2021.
//

import Foundation

enum CarDoor {
    case open
    case closed
}
enum CarTransmission {
    case manual
    case auto
}
enum SportCarEnguine {
    case turbo
    case fire
    case stop
}
enum CarWindows {
    case open
    case middle
    case closed
}
enum CarTrunkCapacity{
    case full
    case middle
    case empty
}
enum CarTrailer {
    case yes
    case no
}
enum TrunkCarEnguine {
    case fire
    case stop
}
let perekluchenieRezhimaEzdiSportCar = SportCarEnguine.turbo
func enguineStatment(_ sostoyanie: SportCarEnguine) {
    switch sostoyanie {
    case .turbo:
        print("Включение турбо режима")
    case .fire:
        print("Обычный режим")
    case .stop:
        print("Торможение")
    }
}

struct SportCar {
    let marka: String
    let yearOfCreation: Int
    let trunk: Int
    var trunkLevel: CarTrunkCapacity {
        willSet{
            if newValue == .full {
                print("Багажник машины заполнен полностью")
            } else if newValue == .middle {
                print("Багажник машины заполнен наполовину")
            } else {
                print("Багажник машины пуст")
            }
        }
    }
    let color: String
    let mp3Player: Bool
    var doors: CarDoor {
        willSet {
            if newValue == .closed {
                print ("Двери закрыты, можно ехать")
            }
            else {
                print ("Внимание! Какая то дверь машины не закрыта!")
            }
        }
    }
    var transmission: CarTransmission {
        willSet{
            if newValue == .manual {
                print("В машине ручная коробка передач")
            } else {
                print("В машине коробка автомат")
            }
        }
    }
    var windows: CarWindows {
        willSet {
            if newValue == .closed {
                print("Окна машины полностью закрыты")
            } else if newValue == .middle {
                print("Окна машины приоткрыты на половину")
            } else {
                print("Окна машины закрыты полностью")
            }
        }
    }
    var trailer: CarTrailer {
        willSet {
            if newValue == .yes {
                print("У машины есть прицеп")
            } else {
                print("У машины нет прицепа")
            }
        }
    }
}
var bmwOne = SportCar(marka: "BMW X5", yearOfCreation: 2019, trunk: 300, trunkLevel: .full, color: "Black",
                      mp3Player: true, doors: .closed, transmission: .manual, windows: .middle, trailer: .no)
bmwOne.transmission = .auto
bmwOne.doors = .closed
bmwOne.trunkLevel = .full
bmwOne.windows = .middle
bmwOne.trailer = .no
enguineStatment(perekluchenieRezhimaEzdiSportCar)

struct TrunkCar {
    let markaT: String
    let yearOfCreationT: Int
    let trunkT: Int
    var trunklevelT: CarTrunkCapacity{
        willSet{
            if newValue == .full {
                print("Багажник грузовика заполнен полностью")
            } else if newValue == .middle {
                print("Багажник грузовика заполнен наполовину")
            } else {
                print("Багажник грузовика пуст")
            }
        }
    }
    let colorT: String
    let mp3PlayerT: Bool
    var doorsT: CarDoor{
        willSet {
            if newValue == .closed {
                print ("Двери грузовика закрыты, можно ехать")
            }
            else {
                print ("Внимание! Какая то дверь грузовика не закрыта!")
            }
        }
    }
    var transmissionT: CarTransmission{
        willSet{
            if newValue == .manual {
                print("В грузовике ручная коробка передач")
            } else {
                print("В грузовике коробка автомат")
            }
        }
    }
    var windowsT: CarWindows{
        willSet {
            if newValue == .closed {
                print("Окна грузовика полностью закрыты")
            } else if newValue == .middle {
                print("Окна грузовика приоткрыты на половину")
            } else {
                print("Окна грузовика закрыты полностью")
            }
        }
    }
    var trailerT: CarTrailer{
        willSet {
            if newValue == .yes {
                print("У грузовика есть прицеп")
            } else {
                print("У грузовика нет прицепа")
            }
        }
    }
}
var mitsubishiTruck = TrunkCar(markaT: "Mitsubishi Minicab MiEV", yearOfCreationT: 2021, trunkT: 0,
                               trunklevelT: .empty, colorT: "White", mp3PlayerT: false, doorsT: .closed,
                               transmissionT: .auto, windowsT: .closed, trailerT: .yes)
print()
mitsubishiTruck.trunklevelT = .middle
mitsubishiTruck.doorsT = .open
mitsubishiTruck.transmissionT = .auto
mitsubishiTruck.windowsT = .middle
mitsubishiTruck.trailerT = .yes
