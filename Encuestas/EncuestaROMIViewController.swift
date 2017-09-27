//
//  EncuestaROMIViewController.swift
//  Encuestas
//
//  Created by Ramses Miramontes Meza on 27/09/17.
//  Copyright © 2017 Ramses Miramontes Meza. All rights reserved.
//

import UIKit
import MessageUI

class EncuestaROMIViewController: UIViewController, MFMailComposeViewControllerDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var encuestasLabel: UILabel!
    let tableName = "ENCUESTA_ROMI"
    let fileName = "encuesta_romi.csv"//"sample.txt"
    let directory = NSTemporaryDirectory()
    var path2 : URL?
    let conexionDB = ConexionDB()
    var databasePath = NSString()
    var contentsOfFile = ""
    var encuestas: [[String]] = []
    @IBOutlet weak var o1A: CheckBox!
    @IBOutlet weak var o1B: CheckBox!
    @IBOutlet weak var o1C: CheckBox!
    @IBOutlet weak var o1D: CheckBox!
    @IBOutlet weak var o1E: CheckBox!
    @IBOutlet weak var o2A: CheckBox!
    @IBOutlet weak var o2B: CheckBox!
    @IBOutlet weak var o2C: CheckBox!
    @IBOutlet weak var o2D: CheckBox!
    @IBOutlet weak var o2E: CheckBox!
    @IBOutlet weak var o2ETextField: UITextField!
    @IBOutlet weak var o3A1: CheckBox!
    @IBOutlet weak var o3A2: CheckBox!
    @IBOutlet weak var o3A3: CheckBox!
    @IBOutlet weak var o3A4: CheckBox!
    @IBOutlet weak var o3A5: CheckBox!
    @IBOutlet weak var o3B1: CheckBox!
    @IBOutlet weak var o3B2: CheckBox!
    @IBOutlet weak var o3B3: CheckBox!
    @IBOutlet weak var o3B4: CheckBox!
    @IBOutlet weak var o3B5: CheckBox!
    @IBOutlet weak var o3C1: CheckBox!
    @IBOutlet weak var o3C2: CheckBox!
    @IBOutlet weak var o3C3: CheckBox!
    @IBOutlet weak var o3C4: CheckBox!
    @IBOutlet weak var o3C5: CheckBox!
    @IBOutlet weak var o3D1: CheckBox!
    @IBOutlet weak var o3D2: CheckBox!
    @IBOutlet weak var o3D3: CheckBox!
    @IBOutlet weak var o3D4: CheckBox!
    @IBOutlet weak var o3D5: CheckBox!
    @IBOutlet weak var o3E1: CheckBox!
    @IBOutlet weak var o3E2: CheckBox!
    @IBOutlet weak var o3E3: CheckBox!
    @IBOutlet weak var o3E4: CheckBox!
    @IBOutlet weak var o3E5: CheckBox!
    @IBOutlet weak var o3F1: CheckBox!
    @IBOutlet weak var o3F2: CheckBox!
    @IBOutlet weak var o3F3: CheckBox!
    @IBOutlet weak var o3F4: CheckBox!
    @IBOutlet weak var o3F5: CheckBox!
    @IBOutlet weak var o3G1: CheckBox!
    @IBOutlet weak var o3G2: CheckBox!
    @IBOutlet weak var o3G3: CheckBox!
    @IBOutlet weak var o3G4: CheckBox!
    @IBOutlet weak var o3G5: CheckBox!
    @IBOutlet weak var o4A: CheckBox!
    @IBOutlet weak var o4B: CheckBox!
    @IBOutlet weak var o4C: CheckBox!
    @IBOutlet weak var o4D: CheckBox!
    @IBOutlet weak var o4E: CheckBox!
    @IBOutlet weak var o5A: CheckBox!
    @IBOutlet weak var o5B: CheckBox!
    @IBOutlet weak var o6A: CheckBox!
    @IBOutlet weak var o6B: CheckBox!
    @IBOutlet weak var o6C: CheckBox!
    @IBOutlet weak var o6D: CheckBox!
    @IBOutlet weak var o6E: CheckBox!
    @IBOutlet weak var o7A1: CheckBox!
    @IBOutlet weak var o7A2: CheckBox!
    @IBOutlet weak var o7A3: CheckBox!
    @IBOutlet weak var o7A4: CheckBox!
    @IBOutlet weak var o7A5: CheckBox!
    @IBOutlet weak var o7B1: CheckBox!
    @IBOutlet weak var o7B2: CheckBox!
    @IBOutlet weak var o7B3: CheckBox!
    @IBOutlet weak var o7B4: CheckBox!
    @IBOutlet weak var o7B5: CheckBox!
    @IBOutlet weak var o7C1: CheckBox!
    @IBOutlet weak var o7C2: CheckBox!
    @IBOutlet weak var o7C3: CheckBox!
    @IBOutlet weak var o7C4: CheckBox!
    @IBOutlet weak var o7C5: CheckBox!
    @IBOutlet weak var o7D1: CheckBox!
    @IBOutlet weak var o7D2: CheckBox!
    @IBOutlet weak var o7D3: CheckBox!
    @IBOutlet weak var o7D4: CheckBox!
    @IBOutlet weak var o7D5: CheckBox!
    @IBOutlet weak var o8A: CheckBox!
    @IBOutlet weak var o8B: CheckBox!
    @IBOutlet weak var o9ATextField: UITextField!
    @IBOutlet weak var o10A: CheckBox!
    @IBOutlet weak var o10B: CheckBox!
    @IBOutlet weak var o11A: CheckBox!
    @IBOutlet weak var o11B: CheckBox!
    @IBOutlet weak var o11C: CheckBox!
    @IBOutlet weak var o11D: CheckBox!
    @IBOutlet weak var o12A: CheckBox!
    @IBOutlet weak var o12B: CheckBox!
    @IBOutlet weak var o12C: CheckBox!
    @IBOutlet weak var o12D: CheckBox!
    @IBOutlet weak var o12E: CheckBox!
    @IBOutlet weak var o12ETextField: UITextField!
    @IBOutlet weak var o13ATextField: UITextField!
    @IBOutlet weak var o14A1: CheckBox!
    @IBOutlet weak var o14A2: CheckBox!
    @IBOutlet weak var o14BTextField: UITextField!
    @IBOutlet weak var o14CTextField: UITextField!
    @IBOutlet weak var o14DTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        super.viewDidLoad()
        databasePath = conexionDB.consultarDB()
        restaurarEncuesta()
    }
    
    @IBAction func guardarEncuesta(_ sender: Any) {
        //Obtener resultado de la encuesta
        let resultadoEncuesta = "\(o1A.isChecked),\(o1B.isChecked),\(o1C.isChecked),\(o1D.isChecked),\(o1E.isChecked),\(o2A.isChecked),\(o2B.isChecked),\(o2C.isChecked),\(o2D.isChecked),\(o2E.isChecked),\(o2ETextField.text!),\(o3A1.isChecked),\(o3A2.isChecked),\(o3A3.isChecked),\(o3A4.isChecked),\(o3A5.isChecked),\(o3B1.isChecked),\(o3B2.isChecked),\(o3B3.isChecked),\(o3B4.isChecked),\(o3B5.isChecked),\(o3C1.isChecked),\(o3C2.isChecked),\(o3C3.isChecked),\(o3C4.isChecked),\(o3C5.isChecked),\(o3D1.isChecked),\(o3D2.isChecked),\(o3D3.isChecked),\(o3D4.isChecked),\(o3D5.isChecked),\(o3E1.isChecked),\(o3E2.isChecked),\(o3E3.isChecked),\(o3E4.isChecked),\(o3E5.isChecked),\(o3F1.isChecked),\(o3F2.isChecked),\(o3F3.isChecked),\(o3F4.isChecked),\(o3F5.isChecked),\(o3G1.isChecked),\(o3G2.isChecked),\(o3G3.isChecked),\(o3G4.isChecked),\(o3G5.isChecked),\(o4A.isChecked),\(o4B.isChecked),\(o4C.isChecked),\(o4D.isChecked),\(o4E.isChecked),\(o5A.isChecked),\(o5B.isChecked),\(o6A.isChecked),\(o6B.isChecked),\(o6C.isChecked),\(o6D.isChecked),\(o6E.isChecked),\(o7A1.isChecked),\(o7A2.isChecked),\(o7A3.isChecked),\(o7A4.isChecked),\(o7A5.isChecked),\(o7B1.isChecked),\(o7B2.isChecked),\(o7B3.isChecked),\(o7B4.isChecked),\(o7B5.isChecked),\(o7C1.isChecked),\(o7C2.isChecked),\(o7C3.isChecked),\(o7C4.isChecked),\(o7C5.isChecked),\(o7D1.isChecked),\(o7D2.isChecked),\(o7D3.isChecked),\(o7D4.isChecked),\(o7D5.isChecked),\(o8A.isChecked),\(o8B.isChecked),\(o9ATextField.text!),\(o10A.isChecked),\(o10B.isChecked),\(o11A.isChecked),\(o11B.isChecked),\(o11C.isChecked),\(o11D.isChecked),\(o12A.isChecked),\(o12B.isChecked),\(o12C.isChecked),\(o12D.isChecked),\(o12E.isChecked),\(o12ETextField.text!),\(o13ATextField.text!),\(o14A1.isChecked),\(o14A2.isChecked),\(o14BTextField.text!),\(o14CTextField.text!),\(o14DTextField.text!)"
        
        //Guardarlo en SQLite
        conexionDB.agregarEncuesta(databasePath: databasePath, tableName: tableName, Resultado: resultadoEncuesta)
        
        //Restaurando encuesta
        restaurarEncuesta()
        self.scrollView.setContentOffset(CGPoint(x:0, y:0), animated: true)
    }
    @IBAction func enviarEmail(_ sender: Any) {
        //Inicializar la cabecera del archivo
        contentsOfFile = "No.,1)Que te parecio el curso?,,,,,2)Por que tomaste este curso?,,,,,,3.1)Expositores-Claridad expositiva,,,,,3.2)Expositores-Claridad de instrucciones,,,,,3.3)Expositores-Capacidad de motivacion,,,,,3.4)Expositores-Dominio de metodos didacticos,,,,,3.5)Expositores-Dominio del contenido,,,,,3.6)Expositores-Capacidad para propiciar reflex,,,,,3.7)Expositores-Capacidad para saber escuchar,,,,,4)Que opinas del contenido del curso?,,,,,5)Consideras que el contenido del curso te sirve para tu formacion como profesionista?,,6)Que opinas de ROMI?,,,,,7.1)ROMI-Imagen,,,,,7.2)ROMI-Carcasa,,,,,7.3)ROMI-App,,,,,7.4)ROMI-Habilidades,,,,,8)Consideras que ROMI es un robot educativo para niñis?,,9)Por que?,10)Comprarias ROMI?,,11)Cuanto estas dispuesto a pagar?,,,,12)En donde te gustaria encontrarlo?,,,,,,13)Que cambiarias o mejorarias de ROMI?,Datos demográficos,,,,\n,Muy bueno,Bueno,Normal,Malo,Muy malo,Para mejorar mis conocimientos,Adquirir nuevas habilidades,Adquirir nuevas actitudes,Por interes personal,Otros,Otros: Especifique,Muy mala,Mala,Normal,Bueno,Muy bueno,Muy mala,Mala,Normal,Bueno,Muy bueno,Muy mala,Mala,Normal,Bueno,Muy bueno,Muy mala,Mala,Normal,Bueno,Muy bueno,Muy mala,Mala,Normal,Bueno,Muy bueno,Muy mala,Mala,Normal,Bueno,Muy bueno,Muy mala,Mala,Normal,Bueno,Muy bueno,Muy bueno,Bueno,Normal,Malo,Muy malo,Si,No,Muy bueno,Bueno,Normal,Malo,Muy malo,Muy mala,Mala,Normal,Bueno,Muy bueno,Muy mala,Mala,Normal,Bueno,Muy bueno,Muy mala,Mala,Normal,Bueno,Muy bueno,Muy mala,Mala,Normal,Bueno,Muy bueno,Si,No,Por que?,Si,No,$1500 a $3000,$3001 a $4500,$4501 a $6000,$6001 en adelante,Tiendas de tecnologia,Tiendas departamentales,Tiendas comerciales,Paginas Web,Otros,Otros:Especifique,Que cambiarias: Especifique,Sexo-Masculino,Sexo-Femenino,Edad,Facultad,Correo\n"
        
        //Obtener resultado de las encuestas
        encuestas = conexionDB.obtenerResultados(databasePath: databasePath as String, tableName: tableName)
        print("Encuestas:\(encuestas.count)")
        encuestasLabel.text = "\(encuestas.count)"
        for x in (0..<encuestas.count) {
            contentsOfFile = "\(contentsOfFile)\n\(encuestas[x][0]),\(encuestas[x][1])\n"
        }
        
        // Escribir archivo
        let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
        path2 = path
        print(directory)
        print(path!)
        do {
            try contentsOfFile.write(to: path!, atomically: true, encoding: String.Encoding.utf8)
            print("File s created at tmp directory")
        } catch {
            
            print("Failed to create file")
            print("\(error)")
        }
        //Leer archivo
        do {
            let text2 = try String(contentsOf: path!, encoding: String.Encoding.utf8)
            print(text2)
        }
        catch {/* error handling here */}
        
        //Check to see the device can send email.
        if( MFMailComposeViewController.canSendMail() ) {
            print("Can send email.")
            
            let mailComposer = MFMailComposeViewController()
            mailComposer.mailComposeDelegate = self
            
            //Set the subject and message of the email
            mailComposer.setSubject("Resultados enviados desde el iPad")
            mailComposer.setMessageBody("Descarga el archivo anexo y abrelo con Excel.", isHTML: false)
            /*
             //if let filePath = Bundle.main.path(forResource: "sample", ofType: "csv", inDirectory: directory) {
             if let filePath = Bundle.main.path(forResource: "sample", ofType: "csv") {
             print("File path loaded.")
             
             if let fileData = NSData(contentsOfFile: filePath) {
             print("File data loaded.")
             mailComposer.addAttachmentData(fileData as Data, mimeType: "csv", fileName: "sample")
             }
             }
             */
            if let fileData = NSData(contentsOf: path2!) {
                print("File data loaded.")
                mailComposer.addAttachmentData(fileData as Data, mimeType: "csv", fileName: fileName)
            }
            self.present(mailComposer, animated: true, completion: nil)
        }
        
    }
    @IBAction func borrarEncuestas(_ sender: Any) {
        let optionAlert = UIAlertController(title: "Eliminar!", message: "Segura que deseas borrar todas las encuestas?", preferredStyle: UIAlertControllerStyle.alert)
        
        optionAlert.addAction(UIAlertAction(title: "NO", style: .default, handler: { (action: UIAlertAction) in
            print("Handle Cancel Logic here")
        }))
        
        optionAlert.addAction(UIAlertAction(title: "SI, eliminar", style: .default, handler: { (action: UIAlertAction) in
            print("User accepted")
            self.conexionDB.borrarEncuestas(databasePath: self.databasePath, tableName: self.tableName)
            self.restaurarEncuesta()
            self.scrollView.setContentOffset(CGPoint(x:0, y:0), animated: true)
        }))
        
        present(optionAlert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        self.dismiss(animated: true, completion: nil)
    }
    func restaurarEncuesta(){
        //Reiniciar valores
        contentsOfFile = ""
        o1A.isChecked = 0
        o1B.isChecked = 0
        o1C.isChecked = 0
        o1D.isChecked = 0
        o1E.isChecked = 0
        o2A.isChecked = 0
        o2B.isChecked = 0
        o2C.isChecked = 0
        o2D.isChecked = 0
        o2E.isChecked = 0
        o2ETextField.text = ""
        o3A1.isChecked = 0
        o3A2.isChecked = 0
        o3A3.isChecked = 0
        o3A4.isChecked = 0
        o3A5.isChecked = 0
        o3B1.isChecked = 0
        o3B2.isChecked = 0
        o3B3.isChecked = 0
        o3B4.isChecked = 0
        o3B5.isChecked = 0
        o3C1.isChecked = 0
        o3C2.isChecked = 0
        o3C3.isChecked = 0
        o3C4.isChecked = 0
        o3C5.isChecked = 0
        o3D1.isChecked = 0
        o3D2.isChecked = 0
        o3D3.isChecked = 0
        o3D4.isChecked = 0
        o3D5.isChecked = 0
        o3E1.isChecked = 0
        o3E2.isChecked = 0
        o3E3.isChecked = 0
        o3E4.isChecked = 0
        o3E5.isChecked = 0
        o3F1.isChecked = 0
        o3F2.isChecked = 0
        o3F3.isChecked = 0
        o3F4.isChecked = 0
        o3F5.isChecked = 0
        o3G1.isChecked = 0
        o3G2.isChecked = 0
        o3G3.isChecked = 0
        o3G4.isChecked = 0
        o3G5.isChecked = 0
        o4A.isChecked = 0
        o4B.isChecked = 0
        o4C.isChecked = 0
        o4D.isChecked = 0
        o4E.isChecked = 0
        o5A.isChecked = 0
        o5B.isChecked = 0
        o6A.isChecked = 0
        o6B.isChecked = 0
        o6C.isChecked = 0
        o6D.isChecked = 0
        o6E.isChecked = 0
        o7A1.isChecked = 0
        o7A2.isChecked = 0
        o7A3.isChecked = 0
        o7A4.isChecked = 0
        o7A5.isChecked = 0
        o7B1.isChecked = 0
        o7B2.isChecked = 0
        o7B3.isChecked = 0
        o7B4.isChecked = 0
        o7B5.isChecked = 0
        o7C1.isChecked = 0
        o7C2.isChecked = 0
        o7C3.isChecked = 0
        o7C4.isChecked = 0
        o7C5.isChecked = 0
        o7D1.isChecked = 0
        o7D2.isChecked = 0
        o7D3.isChecked = 0
        o7D4.isChecked = 0
        o7D5.isChecked = 0
        o8A.isChecked = 0
        o8B.isChecked = 0
        o9ATextField.text = ""
        o10A.isChecked = 0
        o10B.isChecked = 0
        o11A.isChecked = 0
        o11B.isChecked = 0
        o11C.isChecked = 0
        o11D.isChecked = 0
        o12A.isChecked = 0
        o12B.isChecked = 0
        o12C.isChecked = 0
        o12D.isChecked = 0
        o12E.isChecked = 0
        o12ETextField.text = ""
        o13ATextField.text = ""
        o14A1.isChecked = 0
        o14A2.isChecked = 0
        o14BTextField.text = ""
        o14CTextField.text = ""
        o14DTextField.text = ""
        
        //Obteniendo encuestas
        encuestas = conexionDB.obtenerResultados(databasePath: databasePath as String, tableName: tableName)
        print("Encuestas:\(encuestas)")
        encuestasLabel.text = "\(encuestas.count)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
