//
//  EditarContactoController.swift
//  iOSInformacion
//
//  Created by Alumno on 10/1/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation
import UIKit

class EditarContactoController : UIViewController {
    
    var contacto : Contacto?
    var callbackActualizarTabla: (() -> Void)?

    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtTelefono: UITextField!
    
    override func viewDidLoad() {
        txtTelefono.text = "\(contacto!.telefono!)"
        txtNombre.text = contacto!.nombre
    }
    
    @IBAction func doTapGuardar(_ sender: Any) {
        contacto?.nombre = txtNombre.text
        contacto?.telefono = Int(txtTelefono.text!)!
        callbackActualizarTabla!()
        self.navigationController?.popViewController(animated: true)
    }
}
