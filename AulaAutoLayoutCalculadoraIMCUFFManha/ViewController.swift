//
//  ViewController.swift
//  AulaAutoLayoutCalculadoraIMCUFFManha
//
//  Created by Student on 30/06/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

        
    @IBOutlet weak var userWeightField: UITextField!
    @IBOutlet weak var userHeightField: UITextField!
    @IBOutlet weak var resultTextView: UITextView!
    @IBOutlet weak var resultImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func returnClassificatio(resultIMC:Double!) -> Array<String>{
                   if(resultIMC < 18.5){
                       
                       return ["Abaixo do Peso", "happy"]
                       
                   } else if((resultIMC >= 18.5) && (resultIMC < 24.9)){
                       
                       return ["Peso Ideal", "happy"]
                       
                   }  else if((resultIMC >= 24.9) && (resultIMC < 29.9)){
                       
                       return ["Levemente Acima do Peso", "happy"]
                       
                   } else if((resultIMC >= 29.9) && (resultIMC < 34.9)){
                       
                       return ["Obesidade Grau I", "happy"]
                       
                   } else if((resultIMC >= 34.9) && (resultIMC < 39.9)){
                       
                       return ["Obesidade Grau II", "sad"]
                       
                   } else {
                       
                       return ["Obesidade Grau III", "alert"]
                       
                   }
               }
    func beep() {
        let systemSoundID : SystemSoundID = 1015
        AudioServicesPlayAlertSound(systemSoundID)
    }

    @IBAction func btnCalculate(_ sender: Any){
        
        
        if ((userWeightField.text? .isEmpty == true) || (userHeightField.text? .isEmpty == true)){
                    beep()
                    let actionController = UIAlertController(title: "Erro Preencha os Campos", message : "message", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                    })
                    actionController.addAction(okAction)
                    self.present(actionController, animated: true, completion: nil)
        
                } else {
        
                    let userWeightDouble = Double(userWeightField.text!)
                    let userHeightDouble = Double(userHeightField.text!)
        
                    let resultIMC = userWeightDouble! / (pow(userHeightDouble!, 2))
        
                    let resultClassification = returnClassificatio(resultIMC: resultIMC)
        
                    resultTextView.text = resultClassification[0]
                    resultImage.image = UIImage(named: resultClassification[1])
                }
        self.view.endEditing(true)

    }
}
