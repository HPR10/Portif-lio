//
//  ViewController.swift
//  Project2
//
//  Created by HP on 22/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    // Botões que sinalizam cada bandeira
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    // Array vazio de string
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Array de Strings
        countries += ["estonia", "france", "germany", "ireland, italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        //Bordas das bandeiras
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        // Cor das bordas das bandeiras(cinza_claro)
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        
        askQuestion()
    }
    
    // Função que sorteia as bandeiras para exibir na tela
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        // Titulo no topo da tela com a posicão escolhida no correctAnswer
        title = countries[correctAnswer].uppercased()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Acertou"
            score += 1
        } else {
            title = "Errou"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Você tem \(score) pontos!", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion(action:)))
        
        present(ac, animated: true)
    }
    
        
    
}


















