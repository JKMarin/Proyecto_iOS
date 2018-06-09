//
//  RegistroController.swift
//  petfriendlyAround
//
//  Created by Emilia Casasola on 6/2/18.
//  Copyright © 2018 JC_Ronald. All rights reserved.
//

import UIKit

class RegistroController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    

    @IBOutlet var imagenPerfil: UIImageView!
    @IBOutlet var txtUsuario: UITextField!
    @IBOutlet var txtApellidos: UITextField!
    @IBOutlet var txtCorreo: UITextField!
    @IBOutlet var dpFechaNacimiento: UIDatePicker!
    @IBOutlet var txtContrasena: UITextField!
    @IBOutlet var txtRpetirContrasena: UITextField!
    
    let store = StoreManager.sharedInstance
    
    @IBAction func ImportImage(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true){
            //After it is complete
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
        let tabGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureHandler))
        view.addGestureRecognizer(tabGesture)
        
    }
    @objc func tapGestureHandler(){
        txtUsuario.endEditing(true)
        txtApellidos.endEditing(true)
        txtCorreo.endEditing(true)
        txtContrasena.endEditing(true)
        txtRpetirContrasena.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btRegistrar(_ sender: Any) {
        var UsuarioRegistro: UsuarioModel
        if ValidacionesFormulario() == true {
            UsuarioRegistro = UsuarioModel(txtCorreo.text!, txtUsuario.text!, txtApellidos.text!, dpFechaNacimiento.date,                                                txtContrasena.text!)
            UsuarioRegistro.foto = NSData(data: UIImageJPEGRepresentation(imagenPerfil.image!,0.9)!) as Data
            store.crearUsuario(usuario: UsuarioRegistro)
            //NSData(data: UIImageJPEGRepresentation(imagenPerfil.image!,0.9)!),
            //SAVE A BASE DE DATOS.
            
            //if UsuarioModel.CrearUsuario(UsuarioRegistro) == true {
                //MensajePantalla(Mensaje: "Bienvenido, usuario creado con exito")
           // } else {
              //  MensajePantalla(Mensaje: "Error al crear el usuario, favor volver a intentar")
           // }
            UserDefaults.standard.set(false, forKey: "ISRemember")
            UserDefaults.standard.set(txtCorreo.text, forKey: "SavedUserName")
            //MensajePantalla(Mensaje: "Bienvenido, usuario creado con exito")
            self.performSegue(withIdentifier: "RegistroToPrincipal", sender: self)
        }
    }
    
    func ValidacionesFormulario() -> Bool {
        let lContrasenna: String = txtContrasena.text!
        if txtUsuario.text == "" || txtApellidos.text == "" || txtCorreo.text == "" || txtContrasena.text == "" || txtRpetirContrasena.text == "" {
            MensajePantalla(Mensaje: "Favor completar todos los campos del formulario")
                return false
        }
        
        if txtContrasena.text != txtRpetirContrasena.text{
            MensajePantalla(Mensaje: "Las contraseñas son disntintas, favor revisar")
            return false
        }
        if lContrasenna.count < 6{
            MensajePantalla(Mensaje: "La contraseña tiene que tener minimo 6 caracteres")
            return false
        }
        if store.existeUsuario(login: txtCorreo.text!) {
            MensajePantalla(Mensaje: "Login o correo ya registrado")
            return false
        }
        //No hay errores en el formulario.
        return true
    }
    
    func MensajePantalla(Mensaje: String){
        let alertController = UIAlertController(title: "Registro de Usuario", message:
            Mensaje, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default,handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
}
