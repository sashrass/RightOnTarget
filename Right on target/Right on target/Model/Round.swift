//
//  Round.swift
//  Right on target
//
//  Created by Александр Рассохин on 19.01.2022.
//

/*import Foundation
import UIKit

protocol RoundProtocol{
    
    associatedtype RoundType
    
    // количество очков за раунд
    var score: Int {get}
    
    // загаданное значение
    var secretValue: RoundType {get set}
    
    // подсчет заработанных за раунд очков
    func calculateScore(with value: RoundType, function: (RoundType)->Int)
}


class Round<T>: RoundProtocol{
    
    //var secretValue: Game<Any>.GameType
    
    typealias RoundType = Game<Any>.GameType
    typealias T = Game<Any>.GameType
    
    var score: Int = 0
    
    // загаданное значение

    private var currentSecretValue: Game<Any>.GameType
   
    var secretValue: Game<Any>.GameType{
        get{
            if (currentSecretValue is Int){
                return currentSecretValue
            }
            else if (currentSecretValue is UIColor){
                return toHEX(color: currentSecretValue as! UIColor) as! T
            }
            else{
                return 0 as Game<Any>.GameType
            }
        }
        set{
            currentSecretValue = newValue
        }
    }
    
//    func calculateScore(with value: Int) {
////        if value > currentSecretValue {
////            score += 50 - value + currentSecretValue
////        }
////        else if value < currentSecretValue {
////            score += 50 - currentSecretValue + value
////                }
////        else {
////            score += 50
////        }
//    }
    
    func calculateScore(with value: Game<Any>.GameType, function: (Game<Any>.GameType)->Int){
        score = function(value)
    }
    
    init(secretValue: Game<Any>.GameType){
        currentSecretValue = secretValue
    }
    
}


//class ColorRound<T>: Round{
//
//    override func calculateScore(with value: Int) {
//        //self.score += value
//    }
//}

*/
