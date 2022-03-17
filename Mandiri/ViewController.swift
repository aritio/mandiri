//
//  CategoriesViewController.swift
//
//

import UIKit

class ViewController: BaseViewController {
    
    @IBOutlet weak var tvList: UITableView!
    @IBOutlet weak var lblDashboard: UILabel!
    
    var CategeryArray = ["business","entertainment","general","health","science","sports","technology"]
          
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupTableView()
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func setupTableView() {
        tvList.delegate = self
        tvList.dataSource = self
        
        let nearestNib = UINib.init(nibName: "ListNameTableViewCell", bundle: nil)
        tvList.register(nearestNib, forCellReuseIdentifier: "ListMenu")
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(listIOM.count)
        return CategeryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListMenu", for: indexPath) as! ListNameTableViewCell
        

        cell.lblName.text = self.CategeryArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Source", bundle: nil)
        let secondVc = storyboard.instantiateViewController(withIdentifier: "CategoriesViewController") as! CategoriesViewController
        secondVc.kategori = self.CategeryArray[indexPath.row]
        secondVc.modalPresentationStyle = .fullScreen
        secondVc.modalTransitionStyle = .crossDissolve
                
        present(secondVc, animated: true, completion: nil)
    }
    
}
