//
//  ConexionDB.swift
//  Encuestas
//
//  Created by Ramses Miramontes Meza on 09/03/17.
//  Copyright © 2017 Ramses Miramontes Meza. All rights reserved.
//

import UIKit

class ConexionDB: NSObject {
    var databasePath = NSString()
    func consultarDB()-> NSString{
        //Generar o comprobar base de datos SQLite
        let filemgr = FileManager.default
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask,true)
        
        let docsDir = dirPaths[0] as NSString
        
        databasePath = docsDir.appendingPathComponent("encuestas.db") as NSString
        
        if !filemgr.fileExists(atPath: databasePath as String) {
            
            let sesionDB = FMDatabase(path: databasePath as String)
            
            if sesionDB == nil {
                print("Error: \(sesionDB?.lastErrorMessage())")
            }
            
            if (sesionDB?.open())! {
                // Crear tabla de encuestas
                let sql_stmt = "CREATE TABLE IF NOT EXISTS AGRICOLA (ID INTEGER PRIMARY KEY, RESULTADO TEXT)"
                //Para borrar table descomentar la siguiente linea y quitar el signo ! de la condicion filemgr
                //let sql_stmt = "DROP TABLE SESION"
                if !(sesionDB?.executeStatements(sql_stmt))! {
                    print("Error: \(sesionDB?.lastErrorMessage())")
                }
          
                sesionDB?.close()
            } else {
                print("Error: \(sesionDB?.lastErrorMessage())")
            }
        }
        return databasePath
    }
    func borrarEncuestas(databasePath:NSString){
        //Agregar sesión en base de datos
        let sesionDB = FMDatabase(path: databasePath as String)
        
        if (sesionDB?.open())! {
            
            //agregar registro
            let insertSQL = "DELETE FROM 'AGRICOLA'"
            
            let result = sesionDB?.executeUpdate(insertSQL,
                                                 withArgumentsIn: nil)
            
            if !result! {
                print("Error al borrar encuestas")
                print("Error: \(sesionDB?.lastErrorMessage())")
            } else {
                print("Encuestas borradas")
            }
        } else {
            print("Error: \(sesionDB?.lastErrorMessage())")
        }
    }
    func agregarEncuesta(databasePath:NSString, Resultado:String){
        //Agregar sesión en base de datos
        let sesionDB = FMDatabase(path: databasePath as String)
        
        if (sesionDB?.open())! {
            
            //agregar registro
            let insertSQL = "INSERT INTO AGRICOLA (RESULTADO) VALUES ('\(Resultado)')"
            
            let result = sesionDB?.executeUpdate(insertSQL,
                                                 withArgumentsIn: nil)
            
            if !result! {
                print("Error al agregar encuesta")
                print("Error: \(sesionDB?.lastErrorMessage())")
            } else {
                print("Encuesta agregada")
            }
        } else {
            print("Error: \(sesionDB?.lastErrorMessage())")
        }
    }
    func obtenerResultados(databasePath: String)->[[String]]{
        //Buscar datos de sesion
        let sesionDB = FMDatabase(path: databasePath)
        //var datosSesion : Array<Array<String>>!
        var datos : [[String]] = []
        if (sesionDB?.open())! {
            let querySQL = "SELECT * FROM AGRICOLA"
            
            let results:FMResultSet? = sesionDB?.executeQuery(querySQL,
                                                              withArgumentsIn: nil)
            var x=0
            while results?.next() == true {
                print("Encuestas encontradas")
                let Id = results?.string(forColumn: "ID")
                let Resultado = results?.string(forColumn: "RESULTADO")
                print("\(Id), \(Resultado)")
                datos.append([Id!])
                //datos[x].append(Id!)
                datos[x].append(Resultado!)
                x+=1
            }
            return datos
            
            // Al copiarla en el else anterior ya no se ejecutaria
            //sesionDB.close()
            
        } else {
            print("Error: \(sesionDB?.lastErrorMessage())")
        }
        //Tenia un "0" recomendado en este return
        return datos
    }

}
