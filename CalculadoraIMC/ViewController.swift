//
//  ViewController.swift
//  CalculadoraIMC
//
//  Created by Tardes on 10/12/24.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var weightView: UIView!
    @IBOutlet weak var heightView: UIView!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var commentLabel: UILabel!
    var height: Int = 120
    var weight: Float = 60.0
    
    override func viewDidLoad() {
        heightLabel.text = String(height) + " cm"
        weightLabel.text = String(weight) + " KG"
        super.viewDidLoad()
        heightView.layer.cornerRadius = 16
        weightView.layer.cornerRadius = 16
        resultView.layer.cornerRadius = 16
        
        
        
        
        //slider.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func setHeight(_ sender: UISlider) {
        height = Int(sender.value)
        heightLabel.text="\(height) cm"
    }
    
    @IBAction func setWeight(_ sender: UIStepper) {
        weight = Float(sender.value)
        sender.stepValue=0.5
        weightLabel.text="\(weight) KG"
        
    }
    
    @IBAction func calculate(_ sender: Any) {
        let h = Float(height)/100
        let result = (weight/pow(h,2))
        
       
        printImc(result: result)
        
    }
    
    @IBAction func closeInfo (_ sender: UIStoryboardSegue)
    {
        
        
    }
    
    
    
    func printImc(result: Float) -> Void {
        
        
        
        switch result{
        case ..<18.5:
            resultView.backgroundColor = UIColor.under
            commentLabel.text = "bajo peso"
        case 18.5..<25:
            resultView.backgroundColor = UIColor.normal
            commentLabel.text = "peso normal"
        case 25..<30:
            resultView.backgroundColor = UIColor.over
            commentLabel.text = "sobrepeso"
        case 30..<35:
            resultView.backgroundColor = UIColor.obesity
            commentLabel.text = "obesidad"
        default:
            resultView.backgroundColor = UIColor.morbid
            commentLabel.text = "obesidad morbida"
        }
        
      
        resultLabel.text = String(format: "%.2f", result)
        
    }
    
    
}

