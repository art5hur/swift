//
//  ContatoViewController.swift
//  exercicioGS
//
//  Created by Usuário Convidado on 06/11/25.
//

import UIKit
import CoreData

class ContatoViewController: UIViewController {

    @IBOutlet weak var txtNome: UITextField!
    
    @IBOutlet weak var txtTelefone: UITextField!
    
    
    var pessoaVindaDaTable:NSManagedObject?=nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if pessoaVindaDaTable != nil{
            txtNome.text = pessoaVindaDaTable?.value(forKey: "nome") as? String
            txtTelefone.text = pessoaVindaDaTable?.value(forKey: "telefone") as? String
        }
    }
    
    
    @IBAction func salvar(_ sender: Any) {
        
        self.save(name: txtNome.text!, tele: txtTelefone.text!)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    func save(name: String, tele:String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entidade = NSEntityDescription.entity(forEntityName: "Pessoa", in: managedContext)!
        
        if (pessoaVindaDaTable == nil){
            let pessoa = NSManagedObject(entity: entidade, insertInto: managedContext)
            
            pessoa.setValue(name, forKeyPath: "nome")
            pessoa.setValue(tele, forKeyPath: "telefone")
            
        }else{
            let objectUpdate = pessoaVindaDaTable
            objectUpdate!.setValue(name, forKeyPath: "nome")
            objectUpdate!.setValue(tele, forKeyPath: "telefone")
        }
        
        
        do {
            try managedContext.save()
        }catch let error as NSError {
            print("Não foi poss;ivel salvar. \(error), \(error.userInfo)")
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        
    }
    */

}
