//
//  SelectColorController.swift
//  Right on target
//
//  Created by Александр Рассохин on 19.01.2022.
//

import UIKit


class SelectColorController: UIViewController{
    
    var game: Game<UIColor>!
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    
    var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.setTitle("Вариант 1", for: .normal)
        button2.setTitle("Вариант 2", for: .normal)
        button3.setTitle("Вариант 3", for: .normal)
        button4.setTitle("Вариант 4", for: .normal)
        
        buttons = [button1, button2, button3, button4]

        let createGame = GameCreator()
        game = createGame.getColorGame() as? Game<UIColor>
        
        if (game == nil){
            button1.isEnabled = false
            button2.isEnabled = false
            button3.isEnabled = false
            button4.isEnabled = false
            print("game == nil")
            return
        }

        setNewButtonColors(text: String(toHEX(color: game.secretValue)))
    }
    
    func setNewButtonColors(text: String){
        label.text = text
        let rightButtonNumber = Int.random(in: 0...3)
        
        buttons[rightButtonNumber].tintColor = game.secretValue
        let colorGenerator = ColorGenerator()
        
        for i in 0...3{
            if i == rightButtonNumber{
                continue
            }
            buttons[i].tintColor = colorGenerator.generateValue()
        }
    }
    
    @IBAction func checkRightAnswer(_ sender: UIButton){
        game.calculateScore(userValue: sender.tintColor)
        
        if (game.isGameEnded){
            showAlertWith(score: game.score)
            game.restartGame()
        }
        else{
            game.startNewRound()
        }
        
        setNewButtonColors(text: toHEX(color: game.secretValue))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let colorCheck = button1.tintColor!
       // colorCheck.
    }
    
    private func showAlertWith(score: Int){
        let alertController = UIAlertController(title: "Game Over", message: "You reached \(game!.score) poins!", preferredStyle: .alert)
        
        let actionOK = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(actionOK)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
