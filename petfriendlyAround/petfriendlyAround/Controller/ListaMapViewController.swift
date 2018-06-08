//
//  MasterMapViewController.swift
//  petfriendlyAround
//
//  Created by user139236 on 6/6/18.
//  Copyright © 2018 JC_Ronald. All rights reserved.
//

import UIKit
protocol CategoriasControllerDelegate: class {
    //func asociar(forViewController controlador: CategoriasViewController)
}
class CeldaCustom: UITableViewCell{
    
}
class ListaMapViewController: UITableViewController {
    weak var delegateCategorias: CategoriasControllerDelegate?
    let store = StoreManager.sharedInstance
    var anotaciones: [Anotacion] = []
    var selected: Anotacion?
    var categoria: Int = 0
    func cargarLugares(){
        let lugares = store.getLugares(porCategoria: categoria)
        let cat = store.getCategoria(porCategoria: categoria)
        for lugar in lugares{
            self.anotaciones.append(Anotacion(lugar,cat.nombre))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        let rightBarButton = UIBarButtonItem(title: "Mapa", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.showMapa(_:)))
        //rightBarButton.image = UIImage(named: "switchList")
        //self.navigationItem.rightBarButtonItem = rightBarButton
        self.navigationItem.rightBarButtonItems = [rightBarButton]
        if anotaciones.count == 0 {
            cargarLugares()
        }
        
    }
    @IBAction func showMapa(_ sender: UIBarButtonItem) {
       self.performSegue(withIdentifier: "showMapa", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMapa" {
            if let destination = segue.destination as? MapViewController {
                destination.anotaciones = self.anotaciones // you can pass value to destination view controller
                
                // destination.nomb = arrayNombers[(sender as! UIButton).tag] // Using button Tag
            }
        }
        if segue.identifier == "showDetalle" {
            if let destination = segue.destination as? DetalleViewController {
                destination.anotacion = self.selected // you can pass value to destination view controller
               
                //destination.nombre.text = self.selected?.title
                //destination.descripcion.text = self.selected?.subtitle
                //destination.categoria.text = cat.nombre
                // destination.nomb = arrayNombers[(sender as! UIButton).tag] // Using button Tag
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.anotaciones.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriaCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = self.anotaciones[indexPath.row].title
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selected = self.anotaciones[indexPath.row]
        //delegate?.monsterSelected(selectedMonster)
        self.performSegue(withIdentifier: "showDetalle", sender: self)
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

