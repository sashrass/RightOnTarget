//
//  GameCreator.swift
//  Right on target
//
//  Created by Александр Рассохин on 26.01.2022.
//

import Foundation
import UIKit

class GameCreator{
    
    func getNumberGame() -> some GameProtocol{
        return Game<Int>(valueGenerator: NumberGenerator(startValue: 1, endValue: 50)!, rounds: 5){
            (userValue: Int, secretValue: Int) -> Int in
            var compareResult: Int!
                       if secretValue == userValue {
                           compareResult = 50
                       } else if secretValue > userValue{
                           compareResult = 50 - (secretValue - userValue)
                       } else if secretValue < userValue {
                           compareResult = 50 - (userValue - secretValue)
                       }
                       return compareResult
        }
    }
    
    func getColorGame() -> some GameProtocol{
        return Game<UIColor>(valueGenerator: ColorGenerator(), rounds: 5){
            (userValue: UIColor, secretValue: UIColor) -> Int in
            var result: Int
            
            if (toHEX(color: userValue) == toHEX(color: secretValue)){
                result = 1
            }
            else{
                result = 0
            }
            
            return result
        }
    }
}
