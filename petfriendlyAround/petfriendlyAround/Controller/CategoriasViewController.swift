//
//  CategoriasViewController.swift
//  petfriendlyAround
//
//  Created by user139236 on 6/3/18.
//  Copyright © 2018 JC_Ronald. All rights reserved.
//


import UIKit

class CategoriasViewController: UICollectionViewController {
    
    let store = StoreManager.sharedInstance
    var categorias = ListaModel<CategoriaModel>()
   
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categorias.lista.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        
        let categoria = categorias.lista[indexPath.row]
        
        cell.displayContent(image: UIImage(named: categoria.nombre)!, title: categoria.nombre)
        cell.tag = categoria.identificador
        
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        //1
        switch kind {
        //2
        case UICollectionElementKindSectionHeader:
            //3
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: "headerViewCell",
                                                                             for: indexPath) as! myHeaderViewCell
            //headerView.h.text = searches[(indexPath as NSIndexPath).section].searchTerm
            return headerView
        default:
            //4
            assert(false, "Unexpected element kind")
        }
    }
    
    @IBAction func switchTapClick(_ sender: UIBarButtonItem) {
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        categorias = store.getCategorias()
        self.collectionView?.reloadSections(IndexSet(integer: 0))
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueCategoriaDetalle"{
            var detailView = segue.destination
            let selectedCell = sender as! UICollectionViewCell
            let index = self.collectionView?.indexPath(for: selectedCell)
            let categoria = categorias.lista[index!.row]
            detailView.title = categoria.nombre
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
