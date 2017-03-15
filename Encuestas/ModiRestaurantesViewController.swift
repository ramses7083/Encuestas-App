//
//  ModiRestaurantesViewController.swift
//  Encuestas
//
//  Created by Ramses Miramontes Meza on 10/03/17.
//  Copyright © 2017 Ramses Miramontes Meza. All rights reserved.
//

import UIKit
import MessageUI

class ModiRestaurantesViewController: UIViewController, MFMailComposeViewControllerDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var encuestasLabel: UILabel!
    let tableName = "MODI_RESTAURANTES"
    let fileName = "encuesta_modi_restaurantes.csv"//"sample.txt"
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
    @IBOutlet weak var o2A: CheckBox!
    @IBOutlet weak var o2B: CheckBox!
    @IBOutlet weak var o2C: CheckBox!
    @IBOutlet weak var o2D: CheckBox!
    @IBOutlet weak var o3A: CheckBox!
    @IBOutlet weak var o3B: CheckBox!
    @IBOutlet weak var o3B1: CheckBox!
    @IBOutlet weak var o3B2: CheckBox!
    @IBOutlet weak var o3B3: CheckBox!
    @IBOutlet weak var o4A: CheckBox!
    @IBOutlet weak var o4B: CheckBox!
    @IBOutlet weak var o5ATextField: UITextField!
    @IBOutlet weak var o5BTextField: UITextField!
    @IBOutlet weak var o5CTextField: UITextField!
    @IBOutlet weak var o5DTextField: UITextField!
    @IBOutlet weak var o5D1TextField: UITextField!
    @IBOutlet weak var o6ATextField: UITextField!
    @IBOutlet weak var o7A: CheckBox!
    @IBOutlet weak var o7B: CheckBox!
    @IBOutlet weak var o7C: CheckBox!
    @IBOutlet weak var o7D: CheckBox!
    @IBOutlet weak var o8A: CheckBox!
    @IBOutlet weak var o8B: CheckBox!
    @IBOutlet weak var o8C: CheckBox!
    @IBOutlet weak var o9A: CheckBox!
    @IBOutlet weak var o9B: CheckBox!
    @IBOutlet weak var o9C: CheckBox!
    @IBOutlet weak var o9D: CheckBox!
    @IBOutlet weak var o9E: CheckBox!
    @IBOutlet weak var o10A: CheckBox!
    @IBOutlet weak var o10B: CheckBox!
    @IBOutlet weak var o10C: CheckBox!
    @IBOutlet weak var o10D: CheckBox!
    @IBOutlet weak var o10E: CheckBox!
    @IBOutlet weak var o10A1: CheckBox!
    @IBOutlet weak var o10A2: CheckBox!
    @IBOutlet weak var o10B1: CheckBox!
    @IBOutlet weak var o10B2: CheckBox!
    @IBOutlet weak var o10C1: CheckBox!
    @IBOutlet weak var o10C2: CheckBox!
    @IBOutlet weak var o10D1: CheckBox!
    @IBOutlet weak var o10D2: CheckBox!
    @IBOutlet weak var o10E1: CheckBox!
    @IBOutlet weak var o10E2: CheckBox!
    @IBOutlet weak var o10E3: CheckBox!
    @IBOutlet weak var o11A: CheckBox!
    @IBOutlet weak var o11B: CheckBox!
    @IBOutlet weak var o11B1: CheckBox!
    @IBOutlet weak var o11B2: CheckBox!
    @IBOutlet weak var o11B3: CheckBox!
    @IBOutlet weak var o11B1TextField: UITextField!
    @IBOutlet weak var o11B3TextField: UITextField!
    @IBOutlet weak var o12A: CheckBox!
    @IBOutlet weak var o12B: CheckBox!
    @IBOutlet weak var o13A: CheckBox!
    @IBOutlet weak var o13B: CheckBox!
    @IBOutlet weak var o13C: CheckBox!
    @IBOutlet weak var o13D: CheckBox!
    @IBOutlet weak var o14A: CheckBox!
    @IBOutlet weak var o14B: CheckBox!
    @IBOutlet weak var o14C: CheckBox!
    @IBOutlet weak var o14D: CheckBox!
    @IBOutlet weak var o15A: CheckBox!
    @IBOutlet weak var o15B: CheckBox!
    @IBOutlet weak var o15A1: CheckBox!
    @IBOutlet weak var o15A2: CheckBox!
    @IBOutlet weak var o15A3: CheckBox!
    @IBOutlet weak var o15B1: CheckBox!
    @IBOutlet weak var o15B2: CheckBox!
    @IBOutlet weak var o15B3: CheckBox!
    @IBOutlet weak var o16A: CheckBox!
    @IBOutlet weak var o16B: CheckBox!
    @IBOutlet weak var o16C: CheckBox!
    @IBOutlet weak var o16D: CheckBox!
    @IBOutlet weak var o16E: CheckBox!
    @IBOutlet weak var o16ETextField: UITextField!
    @IBOutlet weak var o17A: CheckBox!
    @IBOutlet weak var o17B: CheckBox!
    @IBOutlet weak var o17C: CheckBox!
    @IBOutlet weak var o17D: CheckBox!
    @IBOutlet weak var o17E: CheckBox!
    @IBOutlet weak var o17A1: CheckBox!
    @IBOutlet weak var o17A2: CheckBox!
    @IBOutlet weak var o17B1: CheckBox!
    @IBOutlet weak var o17B2: CheckBox!
    @IBOutlet weak var o17C1: CheckBox!
    @IBOutlet weak var o17C2: CheckBox!
    @IBOutlet weak var o17D1: CheckBox!
    @IBOutlet weak var o17D2: CheckBox!
    @IBOutlet weak var o17E1: CheckBox!
    @IBOutlet weak var o17E2: CheckBox!
    @IBOutlet weak var o17E3: CheckBox!
    @IBOutlet weak var o17E4: CheckBox!
    @IBOutlet weak var o17E4TextField: UITextField!
    @IBOutlet weak var o18A: CheckBox!
    @IBOutlet weak var o18B: CheckBox!
    @IBOutlet weak var o19A: CheckBox!
    @IBOutlet weak var o19B: CheckBox!
    @IBOutlet weak var o19A1: CheckBox!
    @IBOutlet weak var o19A2: CheckBox!
    @IBOutlet weak var o19A3: CheckBox!
    @IBOutlet weak var o19B1: CheckBox!
    @IBOutlet weak var o19B2: CheckBox!
    @IBOutlet weak var o19B3: CheckBox!
    @IBOutlet weak var o20A: CheckBox!
    @IBOutlet weak var o20B: CheckBox!
    @IBOutlet weak var o20C: CheckBox!
    @IBOutlet weak var o20CTextField: UITextField!
    @IBOutlet weak var o21A: CheckBox!
    @IBOutlet weak var o21B: CheckBox!
    @IBOutlet weak var observacionesTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        databasePath = conexionDB.consultarDB()
        restaurarEncuesta()
    }
    
    @IBAction func guardarEncuesta(_ sender: Any) {
        //Obtener resultado de la encuesta
        let resultadoEncuesta = "\(o1A.isChecked),\(o1B.isChecked),\(o1C.isChecked),\(o1D.isChecked),\(o2A.isChecked),\(o2B.isChecked),\(o2C.isChecked),\(o2D.isChecked),\(o3A.isChecked),\(o3B.isChecked),\(o3B1.isChecked),\(o3B2.isChecked),\(o3B3.isChecked),\(o4A.isChecked),\(o4B.isChecked),\(o5ATextField.text!),\(o5BTextField.text!),\(o5CTextField.text!),\(o5DTextField.text!),\(o5D1TextField.text!),\(o6ATextField.text!),\(o7A.isChecked),\(o7B.isChecked),\(o7C.isChecked),\(o7D.isChecked),\(o8A.isChecked),\(o8B.isChecked),\(o8C.isChecked),\(o9A.isChecked),\(o9B.isChecked),\(o9C.isChecked),\(o9D.isChecked),\(o9E.isChecked),\(o10A.isChecked),\(o10B.isChecked),\(o10C.isChecked),\(o10D.isChecked),\(o10E.isChecked),\(o10A1.isChecked),\(o10A2.isChecked),\(o10B1.isChecked),\(o10B2.isChecked),\(o10C1.isChecked),\(o10C2.isChecked),\(o10D1.isChecked),\(o10D2.isChecked),\(o10E1.isChecked),\(o10E2.isChecked),\(o10E3.isChecked),\(o11A.isChecked),\(o11B.isChecked),\(o11B1.isChecked),\(o11B2.isChecked),\(o11B3.isChecked),\(o11B1TextField.text!),\(o11B3TextField.text!),\(o12A.isChecked),\(o12B.isChecked),\(o13A.isChecked),\(o13B.isChecked),\(o13C.isChecked),\(o13D.isChecked),\(o14A.isChecked),\(o14B.isChecked),\(o14C.isChecked),\(o14D.isChecked),\(o15A.isChecked),\(o15B.isChecked),\(o15A1.isChecked),\(o15A2.isChecked),\(o15A3.isChecked),\(o15B1.isChecked),\(o15B2.isChecked),\(o15B3.isChecked),\(o16A.isChecked),\(o16B.isChecked),\(o16C.isChecked),\(o16D.isChecked),\(o16E.isChecked),\(o16ETextField.text!),\(o17A.isChecked),\(o17B.isChecked),\(o17C.isChecked),\(o17D.isChecked),\(o17E.isChecked),\(o17A1.isChecked),\(o17A2.isChecked),\(o17B1.isChecked),\(o17B2.isChecked),\(o17C1.isChecked),\(o17C2.isChecked),\(o17D1.isChecked),\(o17D2.isChecked),\(o17E1.isChecked),\(o17E2.isChecked),\(o17E3.isChecked),\(o17E4.isChecked),\(o17E4TextField.text!),\(o18A.isChecked),\(o18B.isChecked),\(o19A.isChecked),\(o19B.isChecked),\(o19A1.isChecked),\(o19A2.isChecked),\(o19A3.isChecked),\(o19B1.isChecked),\(o19B2.isChecked),\(o19B3.isChecked),\(o20A.isChecked),\(o20B.isChecked),\(o20C.isChecked),\(o20CTextField.text!),\(o21A.isChecked),\(o21B.isChecked),\(observacionesTextField.text!)"
        
        //Guardarlo en SQLite
        conexionDB.agregarEncuesta(databasePath: databasePath, tableName: tableName, Resultado: resultadoEncuesta)
        
        //Restaurando encuesta
        restaurarEncuesta()
        self.scrollView.setContentOffset(CGPoint(x:0, y:0), animated: true)
    }
    @IBAction func enviarEmail(_ sender: Any) {
        //Inicializar la cabecera del archivo
        contentsOfFile = "No.,1)Giro al que pertenece el restaurante?,,,,2)Cuanto tiempo lleva operando su negocio?,,,,3)Cuenta con internet?,,,,,4)Cuenta con servicio a domicilio?,,5)Por que medios recibe los pedidos a domicilio,,,,,6)Que porcentaje de sus ventas son por pedido a domicilio?,7)A traves de que modalidades hace sus ventas?,,,,8)En promedio cuantos pedidos realiza a la semana?,,,9)En promedio de cuanto es cada pedido?,,,,,10)Que es mas importante en la administracion de su negocio?,,,,,,,,,,,,,,,,11)Cuenta con servicio de terminal bancaria?,,,,,,,12)Tiene algun software para el manejo del restaurante?,,13)Razones por las que no tiene software?,,,,14)Razones por las que SI tiene software:,,,,15)Cuanto pago por el software?,,,,,,,,16)Por que medio se entero del software que maneja actualmente?,,,,,,17)Que ofrece el servicio de software que tiene actualmente?,,,,,,,,,,,,,,,,,,18)Estaría dipuesto a cambiar su software actual o adquirir uno?,,19)Al adquirir un software usted preferiria?,,,,,,,,20)Se anuncia en algun otro lugar para estar en contacto con sus clientes?,,,,21)Le gustaria promocionarse y recibir pedidos de sus clientes a traves de una App?,,Obervaciones:\n,Cocina economica,Restaurante,Cafe,Bar,Menor a 1 ano,1 ano,De 1 ano a 3 anos,Mas de 3 anos,No,Si,Si-Para uso del restaurante,Si-Para uso de los comensales,Si-Para ambos,Si,No,Whatsapp,FB,Telefono,Otro,Otro desc,%,Mesas,Mostrador,Servicio a domicilio,Drive Thru,Menos de 50,Entre 51 - 100,Mas de 100,Menos de 100,Entre 101 - 200,Entre 201 - 300,Entre 301 - 400,Mas de 401,Control de ventas,Control de insumos,Control financiero,Control de recursos humanos,Servicio al cliente,Ventas-Numero de ventas,Ventas-Generacion de reportes de productividad,Insumos-Control de inventario,Insumos-Actualizacion del menu,Financiero-Ingresos/Egresos,Financiero-Facturacion,RH-Asistencia,RH-Manejo de caja por empleados,SAC-Atencion de meseros,SAC-Estado del pedido,SAC-Generacion de recibos/tickes/tomar orden,Si,No,No-Me cobra comision,No-No cuento con cuenta banc,No-Otra,No-comision desc,No-Otra desc,Si,No,Falta de dinero,No tiene gusto por la tecn,No lo cree necesario,No sabe usarlo,Necesita control de su negoc,Les gusta innovar,Los demas negocios lo tienen,Tiene facilidad de adquirirlo,Pagar una cantidad unica,Licencias mensuales,CU-Menos de 2000,CU-De 2000 - 3000,CU-Mas de 3000,LM-Menos de 300,LM-Entre 300 y 500,LM-Mas de 500,Por recomendaciones,Lo busco en internet,Fueron a ofrecer software,Ferias/Convenciones/Congresos,Otros,Otros desc,Control de ventas,Control de insumos,Control financiero,Control de recursos humanos,Servicio al cliente,Ventas-Numero de ventas,Ventas-Generacion de reportes de productividad,Insumos-Control de inventario,Insumos-Actualizacion del menu,Financiero-Ingresos/Egresos,Financiero-Facturacion,RH-Asistencia,RH-Manejo de caja por empleados,SAC-Atencion de meseros,SAC-Estado del pedido,SAC-Generacion de recibos/tickes/tomar orden,Otros,Otros desc,Si,No,Pagar una cantidad unica,Licencias mensuales,CU-Menos de 2000,CU-De 2000 - 3000,CU-Mas de 3000,LM-Menos de 300,LM-Entre 300 y 500,LM-Mas de 500,Pagina web,Facebook,Otra red social,Otra red desc,Si,No,Obervaciones\n"
        
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
        o2A.isChecked = 0
        o2B.isChecked = 0
        o2C.isChecked = 0
        o2D.isChecked = 0
        o3A.isChecked = 0
        o3B.isChecked = 0
        o3B1.isChecked = 0
        o3B2.isChecked = 0
        o3B3.isChecked = 0
        o4A.isChecked = 0
        o4B.isChecked = 0
        o5ATextField.text = ""
        o5BTextField.text = ""
        o5CTextField.text = ""
        o5DTextField.text = ""
        o5D1TextField.text = ""
        o6ATextField.text = ""
        o7A.isChecked = 0
        o7B.isChecked = 0
        o7C.isChecked = 0
        o7D.isChecked = 0
        o8A.isChecked = 0
        o8B.isChecked = 0
        o8C.isChecked = 0
        o9A.isChecked = 0
        o9B.isChecked = 0
        o9C.isChecked = 0
        o9D.isChecked = 0
        o9E.isChecked = 0
        o10A.isChecked = 0
        o10B.isChecked = 0
        o10C.isChecked = 0
        o10D.isChecked = 0
        o10E.isChecked = 0
        o10A1.isChecked = 0
        o10A2.isChecked = 0
        o10B1.isChecked = 0
        o10B2.isChecked = 0
        o10C1.isChecked = 0
        o10C2.isChecked = 0
        o10D1.isChecked = 0
        o10D2.isChecked = 0
        o10E1.isChecked = 0
        o10E2.isChecked = 0
        o10E3.isChecked = 0
        o11A.isChecked = 0
        o11B.isChecked = 0
        o11B1.isChecked = 0
        o11B2.isChecked = 0
        o11B3.isChecked = 0
        o11B1TextField.text = ""
        o11B3TextField.text = ""
        o12A.isChecked = 0
        o12B.isChecked = 0
        o13A.isChecked = 0
        o13B.isChecked = 0
        o13C.isChecked = 0
        o13D.isChecked = 0
        o14A.isChecked = 0
        o14B.isChecked = 0
        o14C.isChecked = 0
        o14D.isChecked = 0
        o15A.isChecked = 0
        o15B.isChecked = 0
        o15A1.isChecked = 0
        o15A2.isChecked = 0
        o15A3.isChecked = 0
        o15B1.isChecked = 0
        o15B2.isChecked = 0
        o15B3.isChecked = 0
        o16A.isChecked = 0
        o16B.isChecked = 0
        o16C.isChecked = 0
        o16D.isChecked = 0
        o16E.isChecked = 0
        o16ETextField.text = ""
        o17A.isChecked = 0
        o17B.isChecked = 0
        o17C.isChecked = 0
        o17D.isChecked = 0
        o17E.isChecked = 0
        o17A1.isChecked = 0
        o17A2.isChecked = 0
        o17B1.isChecked = 0
        o17B2.isChecked = 0
        o17C1.isChecked = 0
        o17C2.isChecked = 0
        o17D1.isChecked = 0
        o17D2.isChecked = 0
        o17E1.isChecked = 0
        o17E2.isChecked = 0
        o17E3.isChecked = 0
        o17E4.isChecked = 0
        o17E4TextField.text = ""
        o18A.isChecked = 0
        o18B.isChecked = 0
        o19A.isChecked = 0
        o19B.isChecked = 0
        o19A1.isChecked = 0
        o19A2.isChecked = 0
        o19A3.isChecked = 0
        o19B1.isChecked = 0
        o19B2.isChecked = 0
        o19B3.isChecked = 0
        o20A.isChecked = 0
        o20B.isChecked = 0
        o20C.isChecked = 0
        o20CTextField.text = ""
        o21A.isChecked = 0
        o21B.isChecked = 0
        observacionesTextField.text = ""
        
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
