//
//  ModiComensalesViewController.swift
//  Encuestas
//
//  Created by Ramses Miramontes Meza on 09/03/17.
//  Copyright © 2017 Ramses Miramontes Meza. All rights reserved.
//

import UIKit
import MessageUI

class ModiComensalesViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var encuestasLabel: UILabel!
    let tableName = "MODI_COMENSALES"
    let fileName = "encuesta_modi_comensales.csv"//"sample.txt"
    let directory = NSTemporaryDirectory()
    var path2 : URL?
    let conexionDB = ConexionDB()
    var databasePath = NSString()
    var contentsOfFile = ""
    var encuestas: [[String]] = []
    @IBOutlet weak var o1A: CheckBox!
    @IBOutlet weak var o1B: CheckBox!
    @IBOutlet weak var o2A: CheckBox!
    @IBOutlet weak var o2B: CheckBox!
    @IBOutlet weak var o2C: CheckBox!
    @IBOutlet weak var o3A: CheckBox!
    @IBOutlet weak var o3B: CheckBox!
    @IBOutlet weak var o4A: CheckBox!
    @IBOutlet weak var o4B: CheckBox!
    @IBOutlet weak var o4C: CheckBox!
    @IBOutlet weak var o4D: CheckBox!
    @IBOutlet weak var o5A: CheckBox!
    @IBOutlet weak var o5B: CheckBox!
    @IBOutlet weak var o5C: CheckBox!
    @IBOutlet weak var o5D: CheckBox!
    @IBOutlet weak var o6A: CheckBox!
    @IBOutlet weak var o6B: CheckBox!
    @IBOutlet weak var o6C: CheckBox!
    @IBOutlet weak var o6D: CheckBox!
    @IBOutlet weak var o6E: CheckBox!
    @IBOutlet weak var o7A: CheckBox!
    @IBOutlet weak var o7B: CheckBox!
    @IBOutlet weak var o7C: CheckBox!
    @IBOutlet weak var o7CTextField: UITextField!
    @IBOutlet weak var o8A: CheckBox!
    @IBOutlet weak var o8B: CheckBox!
    @IBOutlet weak var o9A: CheckBox!
    @IBOutlet weak var o9B: CheckBox!
    @IBOutlet weak var o9B1: CheckBox!
    @IBOutlet weak var o9B2: CheckBox!
    @IBOutlet weak var o9B3: CheckBox!
    @IBOutlet weak var o9B3TextField: UITextField!
    @IBOutlet weak var o10A: CheckBox!
    @IBOutlet weak var o10B: CheckBox!
    @IBOutlet weak var o10C: CheckBox!
    @IBOutlet weak var o10D: CheckBox!
    @IBOutlet weak var o10E: CheckBox!
    @IBOutlet weak var o11A: CheckBox!
    @IBOutlet weak var o11B: CheckBox!
    @IBOutlet weak var o11C: CheckBox!
    @IBOutlet weak var o11D: CheckBox!
    @IBOutlet weak var o11E: CheckBox!
    @IBOutlet weak var o11ETextField: UITextField!
    @IBOutlet weak var o12A: CheckBox!
    @IBOutlet weak var o12B: CheckBox!
    @IBOutlet weak var o13A: CheckBox!
    @IBOutlet weak var o13B: CheckBox!
    @IBOutlet weak var o13C: CheckBox!
    @IBOutlet weak var o13D: CheckBox!
    @IBOutlet weak var o13E: CheckBox!
    @IBOutlet weak var o13F: CheckBox!
    @IBOutlet weak var o14A: CheckBox!
    @IBOutlet weak var o14B: CheckBox!
    @IBOutlet weak var o14C: CheckBox!
    @IBOutlet weak var o15A: CheckBox!
    @IBOutlet weak var o15B: CheckBox!
    @IBOutlet weak var o15C: CheckBox!
    @IBOutlet weak var o15D: CheckBox!
    @IBOutlet weak var o15E: CheckBox!
    @IBOutlet weak var o15F: CheckBox!
    @IBOutlet weak var o16A: CheckBox!
    @IBOutlet weak var o16B: CheckBox!
    @IBOutlet weak var o16C: CheckBox!
    @IBOutlet weak var o16D: CheckBox!
    @IBOutlet weak var o16E: CheckBox!

    override func viewDidLoad() {
        super.viewDidLoad()
        databasePath = conexionDB.consultarDB()
        restaurarEncuesta()
    }
    @IBAction func guardarEncuesta(_ sender: Any) {
        //Obtener resultado de la encuesta
        let resultadoEncuesta = "\(o1A.isChecked),\(o1B.isChecked),\(o2A.isChecked),\(o2B.isChecked),\(o2C.isChecked),\(o3A.isChecked),\(o3B.isChecked),\(o4A.isChecked),\(o4B.isChecked),\(o4C.isChecked),\(o4D.isChecked),\(o5A.isChecked),\(o5B.isChecked),\(o5C.isChecked),\(o5D.isChecked),\(o6A.isChecked),\(o6B.isChecked),\(o6C.isChecked),\(o6D.isChecked),\(o6E.isChecked),\(o7A.isChecked),\(o7B.isChecked),\(o7C.isChecked),\(o7CTextField.text!),\(o8A.isChecked),\(o8B.isChecked),\(o9A.isChecked),\(o9B.isChecked),\(o9B1.isChecked),\(o9B2.isChecked),\(o9B3.isChecked),\(o9B3TextField.text!),\(o10A.isChecked),\(o10B.isChecked),\(o10C.isChecked),\(o10D.isChecked),\(o10E.isChecked),\(o11A.isChecked),\(o11B.isChecked),\(o11C.isChecked),\(o11D.isChecked),\(o11E.isChecked),\(o11ETextField.text!),\(o12A.isChecked),\(o12B.isChecked),\(o13A.isChecked),\(o13B.isChecked),\(o13C.isChecked),\(o13D.isChecked),\(o13E.isChecked),\(o13F.isChecked),\(o14A.isChecked),\(o14B.isChecked),\(o14C.isChecked),\(o15A.isChecked),\(o15B.isChecked),\(o15C.isChecked),\(o15D.isChecked),\(o15E.isChecked),\(o15F.isChecked),\(o16A.isChecked),\(o16B.isChecked),\(o16C.isChecked),\(o16D.isChecked),\(o16E.isChecked)"
        
        //Guardarlo en SQLite
        conexionDB.agregarEncuesta(databasePath: databasePath, tableName: tableName, Resultado: resultadoEncuesta)
        
        //Restaurando encuesta
        restaurarEncuesta()
        self.scrollView.setContentOffset(CGPoint(x:0, y:0), animated: true)
    }
    
    @IBAction func enviarEmail(_ sender: Any) {
        //Inicializar la cabecera del archivo
        contentsOfFile = "No.,1)Consume comida que no sea preparada en casa,,2)En que momento consume comida no preparada en casa?,,,3)Que tipo de lugar frecuenta para este tipo de comida?,,4)De que forma consume sus alimentos no preparados en casa?,,,,5)Con que frecuencia compra sus alimentos en servicio a domicilio?,,,,6)En promedio cuanto gasta por pedido?,,,,,7)Desde que lugar pide servicio a domicilio?,,,,8)Cuando consume alimentos fuera de casa paga con tarjeta?,,9)Ha realizado compras en linea con tarjeta bancaria?,,,,,,10)Que influye en su decision al consumir alimentos fuera de casa?,,,,,11)Como se entera de la oferta de restaurantes/cafes/cocina economica?,,,,,,12)Sexo,,13)En que grupo de edad se encuentra?,,,,,,14)Cual es su estado civil?,,,15)Ocupacion,,,,,,16)Cual es su ingreso mensual?,,,,\n,Si,No,Desayuno,Comida,Cena,Restaurante,Comida econo,Domicilio,En Restaur,Mostrador,Driver Thru,Una vez por sem,Mas de una vez hasta 3 veces por sem,Mas de 3 veces por sem,No lo hace,Menos de 100,Entre 101-200,Entre 201-300,Entre 301-400,Mas de 401,Casa,Trabajo,Otro,Otro desc,Si,No,Si,No,No-Desconfianza de mis datos,No-No tengo tarjeta,Otra,Otra desc,Precio,Promocion del dia,Reputacion del lugar,Ubicacion,Rapidez en la toma y entrega del pedido,Pagina Web,Amigos,Facebook,En el lugar,Otra,Otra desc,Femenino,Masculino,15 a 19 anos,20 a 29 anos,30 a 39 anos,40 a 49 anos,50 a 59 anos,60 anos y mas,Soltero,Actualmente unidos (casados/union libre),Alguna vez unidos (divorciados/separados),Estudiante,Trabajador de la educacion,Funcionario publico,Oficinista,Emprendedor/empresario/dueno,Desocupado,Hasta 2041.2 mensuales,Mas de 2401.2 hasta 4802.4 mensuales,Mas de 4802.4 hasta 7203.6 mensuales,Mas de 7203.6 hasta 12006 mensuales,Mas de 12006 mensuales\n"
        
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
    func restaurarEncuesta(){
        //Reiniciar valores
        contentsOfFile = ""
        o1A.isChecked = 0
        o1B.isChecked = 0
        o2A.isChecked = 0
        o2B.isChecked = 0
        o2C.isChecked = 0
        o3A.isChecked = 0
        o3B.isChecked = 0
        o4A.isChecked = 0
        o4B.isChecked = 0
        o4C.isChecked = 0
        o4D.isChecked = 0
        o5A.isChecked = 0
        o5B.isChecked = 0
        o5C.isChecked = 0
        o5D.isChecked = 0
        o6A.isChecked = 0
        o6B.isChecked = 0
        o6C.isChecked = 0
        o6D.isChecked = 0
        o6E.isChecked = 0
        o7A.isChecked = 0
        o7B.isChecked = 0
        o7C.isChecked = 0
        o7CTextField.text = ""
        o8A.isChecked = 0
        o8B.isChecked = 0
        o9A.isChecked = 0
        o9B.isChecked = 0
        o9B1.isChecked = 0
        o9B2.isChecked = 0
        o9B3.isChecked = 0
        o9B3TextField.text = ""
        o10A.isChecked = 0
        o10B.isChecked = 0
        o10C.isChecked = 0
        o10D.isChecked = 0
        o10E.isChecked = 0
        o11A.isChecked = 0
        o11B.isChecked = 0
        o11C.isChecked = 0
        o11D.isChecked = 0
        o11E.isChecked = 0
        o11ETextField.text = ""
        o12A.isChecked = 0
        o12B.isChecked = 0
        o13A.isChecked = 0
        o13B.isChecked = 0
        o13C.isChecked = 0
        o13D.isChecked = 0
        o13E.isChecked = 0
        o13F.isChecked = 0
        o14A.isChecked = 0
        o14B.isChecked = 0
        o14C.isChecked = 0
        o15A.isChecked = 0
        o15B.isChecked = 0
        o15C.isChecked = 0
        o15D.isChecked = 0
        o15E.isChecked = 0
        o15F.isChecked = 0
        o16A.isChecked = 0
        o16B.isChecked = 0
        o16C.isChecked = 0
        o16D.isChecked = 0
        o16E.isChecked = 0
        
        //Obteniendo encuestas
        encuestas = conexionDB.obtenerResultados(databasePath: databasePath as String, tableName: tableName)
        print("Encuestas:\(encuestas)")
        encuestasLabel.text = "\(encuestas.count)"
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        self.dismiss(animated: true, completion: nil)
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
