//
//  UserViewController.swift
//  petfriendlyAround
//
//  Created by BCR on 8/6/18.
//  Copyright © 2018 JC_Ronald. All rights reserved.
//

import UIKit

class UserViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet var imagenPerfil: UIImageView!
    @IBOutlet var txtUsuario: UITextField!
    @IBOutlet var txtApellidos: UITextField!
    
    @IBOutlet weak var lblCorreo: UILabel!
    @IBOutlet var dpFechaNacimiento: UIDatePicker!
    
    
    let store = StoreManager.sharedInstance
    let login = UserDefaults.standard.string(forKey: "SavedUserName")
    
    @IBAction func ImportImage(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true){
            //After it is complete
        }
    }
    
    @IBAction func btnActualizar(_ sender: UIButton) {
        var UsuarioRegistro: UsuarioModel
        if ValidacionesFormulario() == true {
            let usuario = store.getUsuario(login: login!)
            UsuarioRegistro = UsuarioModel(login!, txtUsuario.text!, txtApellidos.text!, dpFechaNacimiento.date,                                                "")
            UsuarioRegistro.contrasenna = (usuario?.contrasenna)!
            UsuarioRegistro.foto = NSData(data: UIImageJPEGRepresentation(imagenPerfil.image!,0.9)!) as Data
            store.crearUsuario(usuario: UsuarioRegistro)
            //NSData(data: UIImageJPEGRepresentation(imagenPerfil.image!,0.9)!),
            //SAVE A BASE DE DATOS.
            
            //if UsuarioModel.CrearUsuario(UsuarioRegistro) == true {
            //MensajePantalla(Mensaje: "Bienvenido, usuario creado con exito")
            // } else {
            //  MensajePantalla(Mensaje: "Error al crear el usuario, favor volver a intentar")
            // }
            
            MensajePantalla(Mensaje: "Datos actualizados con exito")
            
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imagenPerfil.image = image
        } else {
            //error
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let usuario = store.getUsuario(login: login!)
        lblCorreo.text = usuario?.correo
        txtUsuario.text = usuario?.nombre
        txtApellidos.text = usuario?.apellidos
        dpFechaNacimiento.date=(usuario?.fechaNacimiento)!
        if usuario?.foto == nil{
        }else{
        imagenPerfil.image = UIImage(data: (usuario?.foto)!)
        }
        let tabGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureHandler))
        view.addGestureRecognizer(tabGesture)
        
    }
    @objc func tapGestureHandler(){
        txtUsuario.endEditing(true)
        txtApellidos.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func ValidacionesFormulario() -> Bool {
        
        if txtUsuario.text == "" || txtApellidos.text == ""  {
            MensajePantalla(Mensaje: "Favor completar todos los campos del formulario")
            return false
        }
        
        if store.existeUsuario(login: lblCorreo.text!) {
            
        }
        else{
            MensajePantalla(Mensaje: "Usuario no existe")
            return false
        }
        //No hay errores en el formulario.
        return true
    }
    
    func MensajePantalla(Mensaje: String){
        let alertController = UIAlertController(title: "Informacion de Usuario", message:
            Mensaje, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default,handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
