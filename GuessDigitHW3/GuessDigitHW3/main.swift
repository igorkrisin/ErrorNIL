//
//  main.swift
//  GuessDigitHW3
//
//  Created by Игорь Крысин on 11.02.2024.
//

import Foundation
func guessDigit(){
    let guessNumber: Int = Int.random(in: 0...100)
    
    print("Please enter number on the next line")
    var userNumber = Int(readLine() ?? "") ?? 0
    if userNumber == guessNumber {
        print("you are the champion!")
        return
    }
    if userNumber > guessNumber {
        print("guess number less then user number")
    }
    if userNumber < guessNumber {
        print("guess number more then user number")
    }
    
    while userNumber != guessNumber {
        userNumber = Int(readLine() ?? "") ?? 0
        if userNumber > guessNumber {
            print("guess number less then user number")
        }
        if userNumber < guessNumber {
            print("guess number more then user number")
        }
        if userNumber == guessNumber {
            print("you are the champion!")
            return
        }
    }
}

guessDigit()
