//
//  main.swift
//  DZ 2 Rachitskiy
//
//  Created by Andrey rachitsky on 13.09.2021.
//

import Foundation
//MARK: - Написать функцию, которая определяет, четное число или нет.
func numChetNechet(number:Int) -> String {
    var numberChet = ""
    var numberNechet = ""
    if number % 2 == 0 {numberChet = "Число четное!"
       return numberChet}
    else {numberNechet = "Число нечетное"
        return numberNechet}
}
let chisloOne = numChetNechet(number: 3756)
print(chisloOne)

//MARK: - Написать функцию, которая определяет, делится ли число без остатка на 3.
func delenieBezOstatka(number:Int) -> String {
    var numberdelenieBezOstatka = ""
    var numberdelenieSostatkom = ""
    if number % 3 == 0 {numberdelenieBezOstatka = "Число делится на 3 без остатка!"
       return numberdelenieBezOstatka}
    else {numberdelenieSostatkom = "Число не делится на 3 без остатка"
        return numberdelenieSostatkom}
}
let chisloTwo = delenieBezOstatka(number: 8835)
print(chisloTwo)

//MARK: - Создать возрастающий массив из 100 чисел.
var massivIzStaChisel = [Int] ()
for i in 0...99 {
    massivIzStaChisel.append(i)
}
print(massivIzStaChisel)

//MARK: - Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
for elements in massivIzStaChisel {
    if elements % 2 == 0 || elements % 3 != 0 {
        if let index = massivIzStaChisel.firstIndex(of: elements) {
            massivIzStaChisel.remove(at: index)
        }
    }
}
print("4 массив \(massivIzStaChisel)")

//MARK: - Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
func dobavlenieChiselFibonnachi () -> Array <Int> {
    let fibonnachi = sequence(first: (0, 1), next: {($1, $0 + $1)})
        .prefix(50).map{$0.0}
    massivIzStaChisel.append(contentsOf: fibonnachi)
    return(massivIzStaChisel)
}
let proverka = dobavlenieChiselFibonnachi()
print(proverka)

//MARK: - Заполнить массив из 100 элементов различными простыми числами.
extension Int {
func kvadrat() -> Int {
        return self * self
    }
}
let maksimanlniyElementMassiva = 542
var pervoeProstoeChislo = 2
var massivProstixChisel = (2...maksimanlniyElementMassiva).map{$0}
while (pervoeProstoeChislo.kvadrat() <= maksimanlniyElementMassiva) {
    massivProstixChisel.removeAll(where: {$0 >= pervoeProstoeChislo.kvadrat() && $0.isMultiple(of: pervoeProstoeChislo)})
    pervoeProstoeChislo = massivProstixChisel.first(where: {$0 > pervoeProstoeChislo})!
}
print("Всего \(massivProstixChisel.count) простых чисел: ", massivProstixChisel)
