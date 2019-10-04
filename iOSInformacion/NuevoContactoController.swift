    //
//  File.swift
//  iOSInformacion
//
//  Created by Alumno on 10/4/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation
import UIKit

    class NuevoContactoController : UIViewController {
        var callbackActualizarTabla: (() -> Void)?

        var contactos : Contacto?
        
        
        @IBOutlet weak var txtNuevoNombre: UITextField!
        
        @IBOutlet weak var txtNuevoTelefono: UITextField!
        
        override func viewDidLoad() {
            txtNuevoTelefono.text = ""
            txtNuevoNombre.text = ""
        }
        @IBAction func doTapGuardar(_ sender: Any) {
            contactos?.nombre = txtNuevoNombre.text
            contactos?.telefono = Int(txtNuevoTelefono.text!)!
            callbackActualizarTabla!()
            self.navigationController?.popViewController(animated: true)
        }
        
    }
