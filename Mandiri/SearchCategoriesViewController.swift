//
//  SearchCategoriesViewController.swift
//  Mandiri
//
//  Created by Aritio modernland on 15/03/22.
//
import UIKit

class SearchCategoriesViewController: BaseViewController {
    
    @IBOutlet weak var tvList: UITableView!
    @IBOutlet weak var vEmptyState: UIView!
    @IBOutlet weak var lblDashboard: UILabel!
    
    @IBOutlet weak var txtLanguage: UITextField!
    @IBOutlet weak var btnKembali: UIButton!
    
    @IBOutlet weak var btnSearch: UIButton!
    
    let vm = CategoriesViewModel()
    var kategori = ""
    var language = ""
    var newsCategories = [NewsCategories]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupTableView()
        getListCategories()
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func setupTableView() {
        tvList.delegate = self
        tvList.dataSource = self
        
        let nearestNib = UINib.init(nibName: "ListMenu2TableViewCell", bundle: nil)
        tvList.register(nearestNib, forCellReuseIdentifier: "ListMenu")
    }
    
    func getListCategories() {
        let apiKey = "bcbfc1d35e3d4524a1e98180f64ad260"
        showLoading()
        vm.postListCategories(
            apiKey : apiKey,
            kategori : self.kategori,
            language : self.language,
            onSuccess: { response in
                self.hideLoading()
                self.newsCategories.removeAll()
                for newsCategories in response {
                    self.newsCategories.append(newsCategories)
                }
                if self.newsCategories.isEmpty {
                    self.vEmptyState.isHidden = false
                }
                self.tvList.reloadData()
        }, onError: { error in
            self.hideLoading()
            print(error)
            Toast.show(message: error, controller: self)
        }, onFailed: { failed in
            self.hideLoading()
            print(failed)
            Toast.show(message: failed, controller: self)
        })
    }
  
    @IBAction func btnSearch(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Source", bundle: nil)
        let secondVc = storyboard.instantiateViewController(withIdentifier: "SearchCategoriesViewController") as! SearchCategoriesViewController
        secondVc.kategori = self.kategori
        secondVc.language = self.txtLanguage.text ?? ""
        secondVc.modalPresentationStyle = .fullScreen
        secondVc.modalTransitionStyle = .crossDissolve
                
        present(secondVc, animated: true, completion: nil)
    }
    
    @IBAction func btnKembali(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let secondVc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        secondVc.modalPresentationStyle = .fullScreen
        secondVc.modalTransitionStyle = .crossDissolve
                
        present(secondVc, animated: true, completion: nil)
    }
    
}

extension SearchCategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(listIOM.count)
        return newsCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListMenu", for: indexPath) as! ListMenu2TableViewCell
        
        cell.lblNomor.text = newsCategories[indexPath.row].name
        cell.lblTitle.text = newsCategories[indexPath.row].description
        cell.lblSubTitle.text = newsCategories[indexPath.row].language
        cell.lblStatus.text = newsCategories[indexPath.row].country
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Artikel", bundle: nil)
        let secondVc = storyboard.instantiateViewController(withIdentifier: "ArtikelViewController") as! ArtikelViewController
        secondVc.id = newsCategories[indexPath.row].id ?? ""
        secondVc.kategori = self.kategori
        secondVc.modalPresentationStyle = .fullScreen
        secondVc.modalTransitionStyle = .crossDissolve
                
        present(secondVc, animated: true, completion: nil)
    }
    
}
