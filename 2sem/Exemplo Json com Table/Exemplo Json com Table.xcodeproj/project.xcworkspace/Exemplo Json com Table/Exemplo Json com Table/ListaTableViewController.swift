//
//  ListaTableViewController.swift
//  Exemplo Json com Table
//
//  Created by Usuário Convidado on 25/09/25.
//

import UIKit

class ListaTableViewController: UITableViewController {

    var aplicativoArray = [Aplicativo]()
    var app:App!=nil //estrutura que vai receber o Parser
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJson()

    }
    
    func loadJson(){
        let jsonUrlString = "https://itunes.apple.com/br/rss/topfreeapplications/limit=20/json"
        let url = URL(string: jsonUrlString)
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data else {return}
            do{
                self.app = try JSONDecoder().decode(App.self, from: data)
                var aplicativos = self.app.feed.entry
                var indice = 0
                while (indice <= aplicativos.count-1){
                    let objApp = Aplicativo()
                    objApp.nome = aplicativos[indice].name.label
                    self.aplicativoArray.append(objApp) //Add o obj no Array
                    indice+=1
                    
                }
                DispatchQueue.main.sync {
                    self.tableView.reloadData()
                }
                     
                
            }catch let jsonError{
                print("Erro de serialização no Json", jsonError)
            }

        }
        .resume()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return aplicativoArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = aplicativoArray[indexPath.row].nome
        
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
