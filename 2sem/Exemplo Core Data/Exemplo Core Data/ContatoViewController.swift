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
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtTelefone: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func salvar(_ sender: Any) {
        save(name: txtNome.text!, tele: txtTelefone.text!, emai: txtEmail.text!)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func save(name:String,tele:String, emai:String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        //gerenciador de contexto
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entidade = NSEntityDescription.entity(forEntityName: "Pessoa", in: managedContext)!
        //inicio do processo de gravaçao
        let pessoa = NSManagedObject(entity: entidade, insertInto: managedContext)
        
        pessoa.setValue(name, forKey: "nome")
        pessoa.setValue(tele, forKey: "telefone")
        pessoa.setValue(emai, forKey: "email")
        
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Não foi possível salvar \(error), \(error.userInfo)")
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
