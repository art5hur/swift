//
//  ContatoViewController.swift
//  Exemplo Core Data
//
//  Created by Usuário Convidado on 09/10/25.
//

import UIKit
import CoreData

class ContatoViewController: UIViewController {

    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtTelefone: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    var pessoaVindoDaTable:NSManagedObject?=nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if pessoaVindoDaTable != nil{
            txtNome.text = pessoaVindoDaTable?.value(forKey: "nome") as? String
            txtTelefone.text = pessoaVindoDaTable?.value(forKey: "telefone") as? String
            txtEmail.text = pessoaVindoDaTable?.value(forKey: "email") as? String
        }
        
        
        
        // Do any additional setup after loading the view.

    }
    
    
    @IBAction func salvar(_ sender: Any) {
        save(name: txtNome.text!, tele: txtTelefone.text!, emai: txtEmail.text!)
        self.navigationController?.popViewController(animated: true)
    }
    
    func save(name:String, tele:String, emai:String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entidade = NSEntityDescription.entity(forEntityName: "Pessoa", in: managedContext)!
        
        if pessoaVindoDaTable == nil{
            //inicio do processo de Gravação
            let pessoa = NSManagedObject(entity: entidade, insertInto: managedContext)
            pessoa.setValue(name, forKey: "nome")
            pessoa.setValue(tele, forKey: "telefone")
            pessoa.setValue(emai, forKey: "email")
        }else{
            let objectUpdate = pessoaVindoDaTable
            objectUpdate!.setValue(name, forKey: "nome")
            objectUpdate!.setValue(tele, forKey: "telefone")
            objectUpdate!.setValue(emai, forKey: "email")
        }
        
     
        
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Não foi possível salvar  \(error), \(error.userInfo)")
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
       
        }
        
    }
    */

}
