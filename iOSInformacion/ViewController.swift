//
//  ViewController.swift
//  iOSInformacion
//
//  Created by Alumno on 10/1/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tvContactos: UITableView!
    var contactos : [Contacto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contactos"
        
        contactos.append(Contacto(nombre: "Ana Cota", telefono: 6622971893, direccion: "calle3", correo: "anacr@hotmail.com", foto: "Perfil1"))
        contactos.append(Contacto(nombre: "Carmen Cota", telefono: 6623004022, direccion: "calle 2", correo: "carmenluciac@gmail.com", foto: "Perfil3"))
        contactos.append(Contacto(nombre: "Jesus Cota", telefono: 6622689298, direccion: "calle 1", correo: "jesusc@hotmail.com", foto: "Perfil4"))
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaContacto") as? CeldaContactoController
        
        celda?.imgContacto.image = UIImage(named: contactos[indexPath.row].foto!)
        celda?.lblNombre.text = contactos[indexPath.row].nombre
        celda?.lblTelefono.text = "\(contactos[indexPath.row].telefono!)"
        
        return celda!
    }
    
    func recargarTabla() {
        tvContactos.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToEditar" {
            let destino = segue.destination as? EditarContactoController
            
            destino?.contacto = contactos[tvContactos.indexPathForSelectedRow!.row]
            
            destino?.callbackActualizarTabla = recargarTabla
        }
        
        if segue.identifier == "goToAgregar" {
            let destino = segue.destination as? NuevoContactoController
            contactos.append(Contacto(nombre: "", telefono: 0 , direccion: "calle 1", correo: "jesusc@hotmail.com", foto: "Perfil4"))
            
            destino?.contactos = contactos[contactos.count-1]
            
            destino?.callbackActualizarTabla = recargarTabla
        }
    }
    @IBAction func doTapAgregar(_ sender: Any) {
         
        
        tvContactos.reloadData()
    }
}
