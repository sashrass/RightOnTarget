//
//  ViewController.swift
//  Right on target
//
//  Created by Александр Рассохин on 17.01.2022.
//

import UIKit

class ViewController: UIViewController {

    var game: Game<Int>?
    
    //ленивое свойство для хранения View Controller (оно будет вычислено при обращении к нему). Нужно, чтобы вторая сцена загружалась только один раз и не удалялась после закрытия (для этого необходимо, чтобы на ее контроллер была ссылка; если ссылки не будет, то она удалится)
    lazy var secondViewController: SecondViewController = getSecondViewController()
    
    private func getSecondViewController() -> SecondViewController{
        // загрузка storyboard (Класс UIStoryboard позволяет представить storyboard-файл в виде программ- ной сущности)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // загрузка viewController и его сцены со storyboard
        let viewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        
        return viewController as! SecondViewController
    }
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    @IBOutlet var checkButton: UIButton!

    // viewDidLoad вызывается только один раз за всю жизнь сцены
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("viewDiDLoad")
        
        let createGame = GameCreator()
        game = createGame.getNumberGame() as? Game<Int>
        
        if (game == nil){
            checkButton.isEnabled = false
            printContent("game == nil")
            return
        }
    
        updateLabelWithSecretNumber(text: String(game!.secretValue))
    }
    
    // метод вызывается перед тем как добавить элементы в иерархию (вызывается каждый раз когда сцена добавляется в иерархию)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    // метод вызывается после добавления элементов в иерархию и отображения их на экране. Например, можно запустить анимацию на сцене или синхронизировать данные с сервером)
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    //Методы viewWillDisappear и viewDidDisappear похожи на viewWillAppear и viewDidAppear c той лишь разницей, что они вызываются до и после удаления элементов сцены из иерархии view.
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    // загрузка элементов сцены
    override func loadView() {
        
        print("loadView")
        
        super.loadView()
        // Создаем метку для вывода номера версии
        //CGRect - прямоугольник (x,y - где именно должен находиться левый верхний угол данного элемента относительно левого верхнего угла родительского элемента)
//        В инициализатор класса UILabel передается экземпляр типа CGRect, который как раз и описывает, в какую прямоугольную область необходимо вписать текстовую метку (где ее разместить и какого размера она должна быть).
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 35, width: 200, height: 20))
        // изменяем текст метки
        versionLabel.text = "Версия 1.1"
        // добавляем метку в родительский view
        self.view.addSubview(versionLabel)
        
        
    }
    
//    @IBAction func showNextScreen(){
//        // отображение сцены на экране
//        self.present(secondViewController, animated: true, completion: nil)
//    }
    
    @IBAction func checkNumber(){
        let sliderValue = Int(slider.value.rounded())
            
        game!.calculateScore(userValue: sliderValue)
        
        if game!.isGameEnded{
            showAlertWith(score: game!.score)
            game!.restartGame()
        }
        else{
            game!.startNewRound()
        }
        updateLabelWithSecretNumber(text: String(game!.secretValue))
    }
    
    private func showAlertWith(score: Int){
        let alertController = UIAlertController(title: "Game Over", message: "You reached \(game!.score) poins!", preferredStyle: .alert)
        
        let actionOK = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(actionOK)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func updateLabelWithSecretNumber(text: String){
        label.text = text
    }
}



