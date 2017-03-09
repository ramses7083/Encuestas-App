//
//  CheckBox.swift
//  checkbox
//
//  Created by kent on 9/27/14.
//  Copyright (c) 2014 kent. All rights reserved.
//

import UIKit

class CheckBox: UIButton {
    var botonID = ""
    //images
    let checkedImage = UIImage(named: "checked_checkbox")
    let unCheckedImage = UIImage(named: "unchecked_checkbox")
    
    //bool propety
    var isChecked:Int = 0{
        didSet{
            if isChecked == 1{
                self.setImage(checkedImage, for: .normal)
            }else{
                self.setImage(unCheckedImage, for: .normal)
            }
        }
    }

    
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(buttonClicked), for: UIControlEvents.touchUpInside)
        self.isChecked = 0
    }
    


    func buttonClicked(sender:UIButton) {
        if(sender == self){
            if isChecked == 1{
                isChecked = 0
                print("CheckBox del \(botonID) NO marcado")

            }else{
                isChecked = 1
                print("CheckBox \(botonID) marcado")
                
            }
        }
    }

}
