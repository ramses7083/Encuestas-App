//
//  ViewController.swift
//  Encuestas
//
//  Created by Ramses Miramontes Meza on 08/03/17.
//  Copyright © 2017 Ramses Miramontes Meza. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {
    @IBOutlet weak var encuestasLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    let fileName = "encuesta_agricola.csv"//"sample.txt"
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
    @IBOutlet weak var o1F: CheckBox!
    @IBOutlet weak var o1G: CheckBox!
    @IBOutlet weak var o1H: CheckBox!
    @IBOutlet weak var o1I: CheckBox!
    @IBOutlet weak var o1ITextField: UITextField!
    @IBOutlet weak var o2A: CheckBox!
    @IBOutlet weak var o2B: CheckBox!
    @IBOutlet weak var o2C: CheckBox!
    @IBOutlet weak var o2D: CheckBox!
    @IBOutlet weak var o3A: CheckBox!
    @IBOutlet weak var o3B: CheckBox!
    @IBOutlet weak var o3C: CheckBox!
    @IBOutlet weak var o3D: CheckBox!
    @IBOutlet weak var o3E: CheckBox!
    @IBOutlet weak var o4A: CheckBox!
    @IBOutlet weak var o4B: CheckBox!
    @IBOutlet weak var o4ATextField: UITextField!
    @IBOutlet weak var o5A: CheckBox!
    @IBOutlet weak var o5B: CheckBox!
    @IBOutlet weak var o5A1: CheckBox!
    @IBOutlet weak var o5A2: CheckBox!
    @IBOutlet weak var o5A3: CheckBox!
    @IBOutlet weak var o5A4: CheckBox!
    @IBOutlet weak var o5A5: CheckBox!
    @IBOutlet weak var o5A5TextField: UITextField!
    @IBOutlet weak var o6A: CheckBox!
    @IBOutlet weak var o6B: CheckBox!
    @IBOutlet weak var o6ATextField: UITextField!
    @IBOutlet weak var o7A: CheckBox!
    @IBOutlet weak var o7B: CheckBox!
    @IBOutlet weak var o7C: CheckBox!
    @IBOutlet weak var o7D: CheckBox!
    @IBOutlet weak var o7E: CheckBox!
    @IBOutlet weak var o7ETextField: UITextField!
    @IBOutlet weak var o8A: CheckBox!
    @IBOutlet weak var o8B: CheckBox!
    @IBOutlet weak var o8C: CheckBox!
    @IBOutlet weak var o8D: CheckBox!
    @IBOutlet weak var o8E: CheckBox!
    @IBOutlet weak var o8ETextField: UITextField!
    @IBOutlet weak var o9A: CheckBox!
    @IBOutlet weak var o9B: CheckBox!
    @IBOutlet weak var o9A1: CheckBox!
    @IBOutlet weak var o9A2: CheckBox!
    @IBOutlet weak var o10A: CheckBox!
    @IBOutlet weak var o10B: CheckBox!
    @IBOutlet weak var o11A: CheckBox!
    @IBOutlet weak var o11B: CheckBox!
    @IBOutlet weak var o11C: CheckBox!
    @IBOutlet weak var o11D: CheckBox!
    @IBOutlet weak var o11E: CheckBox!
    @IBOutlet weak var o11F: CheckBox!
    @IBOutlet weak var o12A: CheckBox!
    @IBOutlet weak var o12B: CheckBox!
    @IBOutlet weak var o12C: CheckBox!
    @IBOutlet weak var o12D: CheckBox!
    @IBOutlet weak var o12E: CheckBox!
    @IBOutlet weak var o12F: CheckBox!
    @IBOutlet weak var o12G: CheckBox!
    @IBOutlet weak var o12GTextField: UITextField!
    @IBOutlet weak var o13A: CheckBox!
    @IBOutlet weak var o13B: CheckBox!
    @IBOutlet weak var o13C: CheckBox!
    @IBOutlet weak var o13D: CheckBox!
    @IBOutlet weak var o13DTextField: UITextField!
    @IBOutlet weak var o14A: CheckBox!
    @IBOutlet weak var o14B: CheckBox!
    @IBOutlet weak var o14C: CheckBox!
    @IBOutlet weak var o15A: CheckBox!
    @IBOutlet weak var o15B: CheckBox!
    @IBOutlet weak var o15C: CheckBox!
    @IBOutlet weak var o15D: CheckBox!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Revisar las encuestas agricolas
        databasePath = conexionDB.consultarDB()
        restaurarEncuesta()
    }
    
    @IBAction func sendEmail(_ sender: Any) {
        //Inicializar la cabecera del archivo
        contentsOfFile = "No.,1)Que se produce en el cultivo?,,,,,,,,,,2)Cual es la superficie cosechada de su cultivo?,,,,3)Cuantas toneladas produce por hectarea?,,,,,4)Pertenece a alguna asociacion de productores agricolas?,,,5)Recibe apoyo de alguna agencia de gobierno?,,,,,,,,6)Asiste a ferias-exposiciones organizadas por asociaciones o gobierno,,,7)Que considera mas importante en el proceso de produccion agricola?,,,,,,8)Cual es la principal problematica que enfrenta ante la posible perdida de cultivo?,,,,,,9)Cuenta con una metodologia para prevenir-mitigar su principal problematica,,,,10)Utiliza algun tipo de tecnologia en su cultivo?,,11)En que etapa de produccion utiliza tecnologia?,,,,,,12)Que tipo de tecnologia utiliza?,,,,,,,,13)Como se entera de la tecnologia que utiliza?,,,,,14)Esta dispuesto a cambiar la tecnologia que utiliza actualmente?,,,15)Cuanto estaria dispuesto a pagar por tecnologia?,,,\n,Limon,Papaya,Cana,Pina,Sandia,Melon,Chile V,Maiz G,Otro,Otro desc,menor a 5,entre 6 y 10,entre 11 y 15,mas de 16,menos de 20,entre 21 y 40,entre 41 y 60,entre 61 y 70,mas de 70,SI,NO,SI desc,SI,NO,SEFOME,SEDUR,SAGARPA,SEC ECONO,Otro,Otro desc,SI,NO,SI desc,Reduccion de costos,Control de riesgos,Uso optimo de recursos,Manejo de tiempo,Otra,Otra desc,Riesgos climaticos,Riesgos por plagas,Riesgos por propiedades de suelos,Riesgos por uso inadecuado de la maquinaria,Otra,Otra desc,SI,NO,SI desarrollada,SI comprada,SI,NO,Preparacion,Siembra,Riego,Fertilizante,Plaguicidas,Recoleccion,Tractor,Analisis de muestras de tierra,Sensores de humedad,Estaciones climatologicas,Sistema de riego,Vehiculos-drones,Otra,Otra desc,Pagina Web o Facebook,Por recomendaciones,Ferias-exposiciones,Otra,Otra desc,NO,SI-manteniendo precio,SI-ofreciendo mayor calidad,menos de 10000,entre 10001 y 30000,entre 30001 y 50000,mas de 50000\n"
        
        //Obtener resultado de las encuestas
        encuestas = conexionDB.obtenerResultados(databasePath: databasePath as String)
        print("Encuestas:\(encuestas.count)")
        encuestasLabel.text = "\(encuestas.count)"
        for x in (0..<encuestas.count) {
            contentsOfFile = "\(contentsOfFile)\n\(encuestas[x][0]),\(encuestas[x][1])\n"
        }
        
        // Escribir archivo
        let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("encuesta_agricola.csv")
        path2 = path
        print(directory)
        print(path!)
        do {
            try contentsOfFile.write(to: path!, atomically: true, encoding: String.Encoding.utf8)
            print("File sample.csv created at tmp directory")
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
                mailComposer.addAttachmentData(fileData as Data, mimeType: "csv", fileName: "encuesta_agricola.csv")
            }
            self.present(mailComposer, animated: true, completion: nil)
        }
    }
    @IBAction func guardarEncuesta(_ sender: Any) {
        //Obtener resultado de la encuesta
        let resultadoEncuesta = "\(o1A.isChecked),\(o1B.isChecked),\(o1C.isChecked),\(o1D.isChecked),\(o1E.isChecked),\(o1F.isChecked),\(o1G.isChecked),\(o1H.isChecked),\(o1I.isChecked),\(o1ITextField.text!),\(o2A.isChecked),\(o2B.isChecked),\(o2C.isChecked),\(o2D.isChecked),\(o3A.isChecked),\(o3B.isChecked),\(o3C.isChecked),\(o3D.isChecked),\(o3E.isChecked),\(o4A.isChecked),\(o4B.isChecked),\(o4ATextField.text!),\(o5A.isChecked),\(o5B.isChecked),\(o5A1.isChecked),\(o5A2.isChecked),\(o5A3.isChecked),\(o5A4.isChecked),\(o5A5.isChecked),\(o5A5TextField.text!),\(o6A.isChecked),\(o6B.isChecked),\(o6ATextField.text!),\(o7A.isChecked),\(o7B.isChecked),\(o7C.isChecked),\(o7D.isChecked),\(o7E.isChecked),\(o7ETextField.text!),\(o8A.isChecked),\(o8B.isChecked),\(o8C.isChecked),\(o8D.isChecked),\(o8E.isChecked),\(o8ETextField.text!),\(o9A.isChecked),\(o9B.isChecked),\(o9A1.isChecked),\(o9A2.isChecked),\(o10A.isChecked),\(o10B.isChecked),\(o11A.isChecked),\(o11B.isChecked),\(o11C.isChecked),\(o11D.isChecked),\(o11E.isChecked),\(o11F.isChecked),\(o12A.isChecked),\(o12B.isChecked),\(o12C.isChecked),\(o12D.isChecked),\(o12E.isChecked),\(o12F.isChecked),\(o12G.isChecked),\(o12GTextField.text!),\(o13A.isChecked),\(o13B.isChecked),\(o13C.isChecked),\(o13D.isChecked),\(o13DTextField.text!),\(o14A.isChecked),\(o14B.isChecked),\(o14C.isChecked),\(o15A.isChecked),\(o15B.isChecked),\(o15C.isChecked),\(o15D.isChecked)"
        
        //Guardarlo en SQLite
        conexionDB.agregarEncuesta(databasePath: databasePath, Resultado: resultadoEncuesta)
        
        //Restaurando encuesta
        restaurarEncuesta()
        self.scrollView.setContentOffset(CGPoint(x:0, y:0), animated: true)
    }
    
    @IBAction func borrarEncuestas(_ sender: Any) {
        let optionAlert = UIAlertController(title: "Eliminar!", message: "Segura que deseas borrar todas las encuestas?", preferredStyle: UIAlertControllerStyle.alert)
        
        optionAlert.addAction(UIAlertAction(title: "NO", style: .default, handler: { (action: UIAlertAction) in
            print("Handle Cancel Logic here")
        }))
        
        optionAlert.addAction(UIAlertAction(title: "SI, eliminar", style: .default, handler: { (action: UIAlertAction) in
            print("User accepted")
            self.conexionDB.borrarEncuestas(databasePath: self.databasePath)
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
        o1F.isChecked = 0
        o1G.isChecked = 0
        o1H.isChecked = 0
        o1I.isChecked = 0
        o1ITextField.text = ""
        o2A.isChecked = 0
        o2B.isChecked = 0
        o2C.isChecked = 0
        o2D.isChecked = 0
        o3A.isChecked = 0
        o3B.isChecked = 0
        o3C.isChecked = 0
        o3D.isChecked = 0
        o3E.isChecked = 0
        o4A.isChecked = 0
        o4B.isChecked = 0
        o4ATextField.text = ""
        o5A.isChecked = 0
        o5B.isChecked = 0
        o5A1.isChecked = 0
        o5A2.isChecked = 0
        o5A3.isChecked = 0
        o5A4.isChecked = 0
        o5A5.isChecked = 0
        o5A5TextField.text = ""
        o6A.isChecked = 0
        o6B.isChecked = 0
        o6ATextField.text = ""
        o7A.isChecked = 0
        o7B.isChecked = 0
        o7C.isChecked = 0
        o7D.isChecked = 0
        o7E.isChecked = 0
        o7ETextField.text = ""
        o8A.isChecked = 0
        o8B.isChecked = 0
        o8C.isChecked = 0
        o8D.isChecked = 0
        o8E.isChecked = 0
        o8ETextField.text = ""
        o9A.isChecked = 0
        o9B.isChecked = 0
        o9A1.isChecked = 0
        o9A2.isChecked = 0
        o10A.isChecked = 0
        o10B.isChecked = 0
        o11A.isChecked = 0
        o11B.isChecked = 0
        o11C.isChecked = 0
        o11D.isChecked = 0
        o11E.isChecked = 0
        o11F.isChecked = 0
        o12A.isChecked = 0
        o12B.isChecked = 0
        o12C.isChecked = 0
        o12D.isChecked = 0
        o12E.isChecked = 0
        o12F.isChecked = 0
        o12G.isChecked = 0
        o12GTextField.text = ""
        o13A.isChecked = 0
        o13B.isChecked = 0
        o13C.isChecked = 0
        o13D.isChecked = 0
        o13DTextField.text = ""
        o14A.isChecked = 0
        o14B.isChecked = 0
        o14C.isChecked = 0
        o15A.isChecked = 0
        o15B.isChecked = 0
        o15C.isChecked = 0
        o15D.isChecked = 0
        
        //Obteniendo encuestas
        encuestas = conexionDB.obtenerResultados(databasePath: databasePath as String)
        print("Encuestas:\(encuestas)")
        encuestasLabel.text = "\(encuestas.count)"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

