//
//  LoginController.swift
//  petfriendlyAround
//
//  Created by Emilia Casasola on 6/2/18.
//  Copyright © 2018 JC_Ronald. All rights reserved.
//

import UIKit

class LoginController: UIViewController{
    
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtContrasena: UITextField!
    @IBOutlet weak var btIniciarSesion: UIButton!
    @IBOutlet var SwRecordarme: UISwitch!
    let store = StoreManager.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //SwRecordarme.addTarget(self, action: #selector(self.stateChanged), for: .valueChanged)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let defaults: UserDefaults? = UserDefaults.standard
        
        if (defaults?.bool(forKey: "ISRemember"))! {
            //txtUsuario.text = defaults?.value(forKey: "SavedUserName") as? String
            //txtContrasena.text = defaults?.value(forKey: "SavedPassword") as? String
            //SwRecordarme.setOn(true, animated: false)
            self.performSegue(withIdentifier: "LoginMenuPrincipal", sender: self)
            //self.show(self.storyboard!.instantiateViewController(withIdentifier: "homeview"), sender: nil)
        }
        else {
            SwRecordarme.setOn(false, animated: false)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func stateChanged(_ switchState: UISwitch) {
        
        let defaults: UserDefaults? = UserDefaults.standard
        if switchState.isOn {
            defaults?.set(true, forKey: "ISRemember")
            defaults?.set(txtUsuario.text, forKey: "SavedUserName")
            defaults?.set(txtContrasena.text, forKey: "SavedPassword")
        }
        else {
            defaults?.set(false, forKey: "ISRemember")
        }
    }
    
    @IBAction func btIniciarSesion(_ sender: Any) {
        let cUsuario = txtUsuario.text
        let cContrasena = txtContrasena.text
        let validacion = validaDatos()
        if validacion{
            let autenticado = store.autenticar(login: cUsuario!, password: cContrasena!)
            if autenticado{
                let defaults: UserDefaults? = UserDefaults.standard
                if SwRecordarme.isOn {
                    defaults?.set(true, forKey: "ISRemember")
                    defaults?.set(txtUsuario.text, forKey: "SavedUserName")
                    //defaults?.set(txtContrasena.text, forKey: "SavedPassword")
                }
                else {
                    defaults?.set(false, forKey: "ISRemember")
                    defaults?.set(txtUsuario.text, forKey: "SavedUserName")
                }
                self.performSegue(withIdentifier: "LoginMenuPrincipal", sender: self)
            }else{
                self.MensajePantalla("Login", "Usuario o contraseña incorrectos")
            }
            
            //IniciarLogin(pUsuari: cUsuario!, pContrasena: cContrasena!)
            //SAVE A BASE DE DATOS.
            
        }else{
            self.MensajePantalla("Login", "Los campos son obligatorios")
        }
    }
    
    
    func IniciarLogin(pUsuari: String, pContrasena: String){
         UserDefaults.standard.set(true, forKey: "status")
        
    }
    
    func validaDatos() -> Bool {
        let cUsuario = txtUsuario.text
        let cContrasena = txtContrasena.text
        
        if (cUsuario == "" || cContrasena == "")
        {
            return false
        }else{
            return true
        }
    }
    func MensajePantalla(_ titulo: String,_ mensaje: String){
        let alertController = UIAlertController(title: titulo, message:
            mensaje, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default,handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}
