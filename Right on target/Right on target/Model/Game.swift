//
//  Game.swift
//  Right on target
//
//  Created by Александр Рассохин on 19.01.2022.
//

import Foundation

protocol GameProtocol{
    
    associatedtype GameType
    
    // Количество заработанных очков
    var score: Int { get }
    // Секретное число
    var secretValue: GameType! { get }
    // Проверяет, окончена ли игра
    var isGameEnded: Bool { get }
    // Начинает новую игру и сразу стартует первый раунд
    func restartGame()
    // Начинает новый раунд
    func startNewRound()
    // сравнение значения пользователя с загаданным и подсчет очков
    func calculateScore(userValue: GameType)
}



// Т.к. в будущем возможно придется расширять функционал игры, объект которой нужно будет передавать по ссылке, делаем класс

class Game<T>: GameProtocol{
    
    typealias GameType = T
    
    private var secretNumberGenerator: ValueGeneratorProtocol!
    
    var score = 0
    
    var secretValue: T!
    
    private var currentRoundNumber = 0
    private var amountOfRounds: Int
    
    var isGameEnded: Bool{
        if currentRoundNumber >= amountOfRounds{
            return true
        }
        else{
            return false
        }
    }
    
    private var scoreCalcutaionClosure: (T, T) -> Int
    
    func restartGame() {
        score = 0
        currentRoundNumber = 0
        startNewRound()
    }
    
    func startNewRound() {
        secretValue = secretNumberGenerator.generateValue()
        currentRoundNumber += 1
    }
    
    func calculateScore(userValue: T) {
        score += scoreCalcutaionClosure(userValue, secretValue)
    }
        
    init(valueGenerator: ValueGeneratorProtocol , rounds: Int, calculationClosure: @escaping (T, T) -> Int){
        secretNumberGenerator = valueGenerator
        amountOfRounds = rounds
        scoreCalcutaionClosure = calculationClosure
        startNewRound()
    }
    
}

