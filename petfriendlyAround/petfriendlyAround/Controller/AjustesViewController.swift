//
//  AjustesViewController.swift
//  petfriendlyAround
//
//  Created by BCR on 8/6/18.
//  Copyright © 2018 JC_Ronald. All rights reserved.
//

import UIKit

class AjustesViewController: UIViewController {

    @IBOutlet weak var swithButtom: UISwitch!
    @IBOutlet weak var btnSalir: UIButton!
    @IBOutlet weak var btnCambiar: UIButton!
    @IBOutlet weak var txtContrasena: UITextField!
    @IBOutlet weak var txtNuevaContrasena: UITextField!
    @IBOutlet weak var txtConfirmaContrasena: UITextField!
    
    let store = StoreManager.sharedInstance
    let login = UserDefaults.standard.string(forKey: "SavedUserName")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swithButtom.isOn = UserDefaults.standard.bool(forKey: "ISRemember")
        // Do any additional setup after loading the view.
    }
    @IBAction func clickCambiar(_ sender: UIButton) {
         if ValidacionesFormulario() == true {
            let contrasenna = txtContrasena.text
            let nueva = txtNuevaContrasena.text
            let resultado = store.cambiarContrasenaUsuario(login: login!, password: contrasenna!, nuevopass: nueva!)
            if resultado{
                MensajePantalla(Mensaje: "Actualizacion realizada con exito")
                txtNuevaContrasena.text = ""
                txtContrasena.text = ""
                txtConfirmaContrasena.text = ""
            }else{
                MensajePantalla(Mensaje: "No se realiza la actualizacion")
            }
        }
    }
    
    @IBAction func clickSalir(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "Salir", message:nil , preferredStyle: .actionSheet)
        
        let alertAction1 = UIAlertAction(title: "Cerrar Sesion", style: UIAlertActionStyle.default){ (action) in
            UserDefaults.standard.removeObject( forKey: "ISRemember")
            UserDefaults.standard.removeObject(forKey: "SavedUserName")
            self.performSegue(withIdentifier: "DoLogout", sender: nil)
        }
        let alertAction2 = UIAlertAction(title: "Cerrar y Eliminar", style: UIAlertActionStyle.default){ (action) in
            UserDefaults.standard.removeObject( forKey: "ISRemember")
            UserDefaults.standard.removeObject(forKey: "SavedUserName")
            
            let usuario = self.store.getUsuario(login: self.login!)
        
            self.store.eliminarUsuario(usuario: usuario!)
            
            self.performSegue(withIdentifier: "DoLogout", sender: nil)
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel){ action in
            // ...
        }
        
      
        
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        alertController.addAction(cancelAction)
        
       
        self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func switchChange(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "ISRemember")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func ValidacionesFormulario() -> Bool {
        let lContrasenna: String = txtNuevaContrasena.text!
        if  txtContrasena.text == "" || txtNuevaContrasena.text == "" || txtConfirmaContrasena.text == "" {
            MensajePantalla(Mensaje: "Favor completar todos los campos del formulario")
            return false
        }
        
        if txtNuevaContrasena.text != txtConfirmaContrasena.text{
            MensajePantalla(Mensaje: "Las contraseñas son disntintas, favor revisar")
            return false
        }
        if lContrasenna.count < 6{
            MensajePantalla(Mensaje: "La contraseña tiene que tener minimo 6 caracteres")
            return false
        }
        
        //No hay errores en el formulario.
        return true
    }
    
    func MensajePantalla(Mensaje: String){
        let alertController = UIAlertController(title: "Ajustes de Usuario", message:
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
