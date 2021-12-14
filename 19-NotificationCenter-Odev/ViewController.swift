

import UIKit

extension Notification.Name {
    static let notificationA = Notification.Name("notificationA")
    static let notificationB = Notification.Name("notificationB")
}



class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let db = DB()
    
    var arr:[CitySt] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.call(sender:)), name: .notificationA, object: nil)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        
        db.fncConnect()
        arr = db.allCityList()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let ct = arr[indexPath.row]        
        cell.textLabel?.text = ct.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        Detail.name = arr[indexPath.row].title
        Detail.cidNo = arr[indexPath.row].cid
        print(Detail.cidNo)
        
        self.performSegue(withIdentifier: "detail", sender: "Bilmem")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detail") {
            let vc = segue.destination as! Detail
            vc.surname = sender as! String
        }
    }
    
    @objc func call ( sender:Notification ) {
        let dic = sender.userInfo
        let cidd = dic!["cid"] as! Int
        let status = db.deleteItem(cid: cidd)
        if (status > 0) {
            arr = db.allCityList()
            tableView.reloadData()
        }
        
    }
    
    


}

