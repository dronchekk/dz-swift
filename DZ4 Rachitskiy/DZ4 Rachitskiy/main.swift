//
//  main.swift
//  DZ4 Rachitskiy
//
//  Created by Andrey rachitsky on 17.09.2021.
//

import Foundation

//MARK: - Последовательности действий
enum CarDoor {
     case open
     case closed
 }
 enum CarTransmission {
     case manual
     case auto
 }
 enum CarWindows {
     case open
     case middle
     case closed
 }
 enum CarTrailer {
     case yes
     case no
 }
enum CarTrunkCapacity {
    case full
    case middle
    case empty
}
enum SportCarEnguine {
    case turbo
    case fire
    case stop
}
 enum TrunkCarEnguine {
     case fire
     case stop
 }
enum TrunkTrailerCapacity {
    case overload
    case medium
    case pusto
}
//MARK: - Родительский класс
class Car {
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
            } else {
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
    init(marka: String, yearOfCreation: Int, trunk: Int, trunkLevel: CarTrunkCapacity, color: String,
         mp3Player: Bool, doors: CarDoor, transmission: CarTransmission, windows: CarWindows, trailer: CarTrailer) {
        self.marka = marka
        self.color = color
        self.yearOfCreation = yearOfCreation
        self.trunk = trunk
        self.trunkLevel = .empty
        self.mp3Player = mp3Player
        self.doors = .closed
        self.transmission = .auto
        self.windows = .middle
        self.trailer = .no
    }
}
//MARK: - Наследник спорт с особым свойством
class SportCar: Car {
    var perekluchenieRezhimaEzdiSportCar = SportCarEnguine.turbo
    var sportCarRegim: SportCarEnguine
    init (marka: String, yearOfCreation: Int, trunk: Int, trunkLevel: CarTrunkCapacity, color: String,
                   mp3Player: Bool, doors: CarDoor, transmission: CarTransmission, windows: CarWindows,
                   trailer: CarTrailer, sportCaRregim: SportCarEnguine) {
        self.sportCarRegim = .stop
        super.init(marka: marka, yearOfCreation: yearOfCreation, trunk: trunk, trunkLevel: trunkLevel, color: color,
                   mp3Player: mp3Player, doors: doors, transmission: transmission, windows: windows, trailer: trailer)
    }


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
}
//MARK: - Наследник грузовик с особым свойством
class TrunkCar: Car {

    var trunTrailer: TrunkTrailerCapacity{
             willSet{
                 if newValue == .overload {
                     print("Прицеп перегружен")
                 } else if newValue == .medium {
                     print("Прицеп в нормальном состоянии")
                 } else {
                     print("Прицеп пуст")
                 }
             }
         }

   override var transmission: CarTransmission {
             willSet{
                if newValue == .manual {
                     print("В грузовике ручная коробка передач")
                 } else {
                     print("В грузовике коробка автомат")
                 }
             }
         }

    init(marka: String, yearOfCreation: Int, trunk: Int, trunkLevel: CarTrunkCapacity, color: String,
                  mp3Player: Bool, doors: CarDoor, transmission: CarTransmission, windows: CarWindows,
                  trailer:CarTrailer, trunTrailer: TrunkTrailerCapacity) {
        self.trunTrailer = .medium
        super.init(marka: marka, yearOfCreation: yearOfCreation, trunk: trunk, trunkLevel: trunkLevel,
                   color: color, mp3Player: mp3Player, doors: doors, transmission: transmission, windows: windows,
                   trailer: trailer)
    }
}

var carSport = SportCar(marka: "BMWx5", yearOfCreation: 2020, trunk: 100, trunkLevel: .empty, color: "Black",
                        mp3Player: true, doors: .closed, transmission: .auto, windows: .middle, trailer: .no,
                        sportCaRregim: .stop)
print(carSport.marka)
carSport.enguineStatment(.turbo)
var carTrunk = TrunkCar(marka: "Mitsubishi Minicab MiEV", yearOfCreation: 2021, trunk: 0, trunkLevel: .empty,
                        color: "White", mp3Player: false, doors: .closed, transmission: .auto, windows: .closed,
                        trailer: .yes, trunTrailer: .overload)
print(carTrunk.marka)
carTrunk.trunTrailer = .pusto
carTrunk.transmission = .manual
