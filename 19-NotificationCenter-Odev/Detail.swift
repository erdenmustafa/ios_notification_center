//
//  Detail.swift
//  19-NotificationCenter-Odev
//
//  Created by emir kartal on 15.10.2020.
//

import UIKit

class Detail: UIViewController {
    
    
    
    static var name = ""
    static var cidNo = 0
    var surname = ""
    
    
    @IBOutlet weak var lblText: UITextField!
    @IBAction func fncBtn(_ sender: UIButton) {
        
        let dic = [ "cid": Detail.cidNo]
        
        
        NotificationCenter.default.post(name: .notificationA, object: nil, userInfo: dic)
        //dismiss(animated: true, completion: nil)
        self.navigationController?.popToRootViewController(animated: true)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(surname)
        
        title = Detail.name
        lblText.text = Detail.name
    }
    
    

}
