//
//  ViewController.swift
//  UIKIT Swift
//
//  Created by Usuário Convidado on 08/05/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblIdade: UILabel!
    @IBOutlet weak var lblPAS: UILabel!
    @IBOutlet weak var lblPAD: UILabel!
    @IBOutlet weak var lblLink: UILabel!
    
    @IBOutlet weak var segRisco: UISegmentedControl!
    
    @IBOutlet weak var stpIdade: UIStepper!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func mudarIndice(_ sender: Any) {
        switch segRisco.selectedSegmentIndex {
        case 0:
            print("Você clicou no botão 1")
        case 1:
            print("Você clicou no botão 2")
        case 2:
            print("Você clicou no botão 3")
        case 3:
            print("Você clicou no botão 4")
        default:
            break
        }
    }
    
    
    @IBAction func mudarValorSwitch(_ sender: UISwitch) {
        print(sender.isOn)
    }
    

    @IBAction func mudarValorStepper(_ sender: Any) {
        lblIdade.text = String(Int(stpIdade.value))
    }
    
    
    @IBAction func mudarValorSliderPAS(_ sender: UISlider) {
        lblPAS.text = String(Int(sender.value))
    }
    
    @IBAction func mudarValorSliderPAD(_ sender: UISlider) {
        lblPAD.text = String(Int(sender.value))
    }
    
    @IBAction func receberLink(_ sender: Any) {
        let alerta = UIAlertController(
            title: "Forma para receber o Exame",
            message: "Faça sua escolha",
            preferredStyle: UIAlertController.Style.actionSheet)
        
        alerta.addAction(UIAlertAction(
            title: "E-mail",
            style: UIAlertAction.Style.default,
            handler: { action in
                self.lblLink.text = action.title
            }))
        
        alerta.addAction(UIAlertAction(
            title: "SMS",
            style: UIAlertAction.Style.default,
            handler: { action in
                self.lblLink.text = action.title
            }))
        
        alerta.addAction(UIAlertAction(
            title: "Cancelar",
            style: UIAlertAction.Style.cancel,
            handler: nil))
        
        present(alerta, animated: true)

        
    }
    
    
    @IBAction func Avancar(_ sender: Any) {
        
        var msg:String = ""
        var tipo:String = ""
        
        if segRisco.selectedSegmentIndex >= 0 {
            tipo = segRisco.titleForSegment(at: segRisco.selectedSegmentIndex)!
            msg = "Triagem \(tipo), paciente com idade de \(lblIdade.text!) salvo com sucesso"
        }else{
            tipo = ""
            msg = "Antes de avançar escolha uma classificação de risco"
        }
        
        let alerta = UIAlertController(
            title: "Atenção",
            message: msg,
            preferredStyle: UIAlertController.Style.alert)
        
        alerta.addAction(UIAlertAction(
            title: "OK",
            style: UIAlertAction.Style.cancel))
        
        present(alerta, animated: true)
    }
    
    
}

