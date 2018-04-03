//
//  ArticleListComplete.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 05/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import UIKit
import AlamofireImage
class ArticleListComplete: UIViewController  {
    
    //MARK: - Properties
    @IBOutlet weak var enquiryNumberLbl: UILabel!
    @IBOutlet weak var totalArticleLbl: UILabel!
    @IBOutlet weak var totalCftLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var ListModel = [ArticleListModel]()
    //MARK: - UIViewController Method
    override func viewWillAppear(_ animated: Bool) {
       enquiryNumberLbl.text = AppUserDefaults.value(forKey: .UNIQUE, fallBackValue: "").string!
       getArticleListFromUniq()
    }
    override func viewDidLoad() {
         super.viewDidLoad()
        collectionView.dataSource = (self as UICollectionViewDataSource)
        collectionView.delegate = (self  as UICollectionViewDelegate)
    }
    //MARK: - Custome Method
    
    
    func getArticleListFromUniq(){
        WebServices.shared.getArticleList(methodName: AppConstants.METHOD_ARTICLE_LIST, uniqid: AppUserDefaults.value(forKey: .UNIQUE, fallBackValue: "").string!, completion: {(response,error) in
            if error == nil{
                let status = response![AppConstants.STATUSTXT] as! Int
                let statusString = "\(status)"
                switch(statusString){
                case AppConstants.SUCCESS:
                    self.ListModel.removeAll()
                    let TotalArticle: String = response!["totalitem"] as! String
                    let TotalCft: String = response!["cftcount"] as! String
                    self.totalArticleLbl.text = TotalArticle
                    self.totalCftLbl.text = TotalCft
                    let listArray: [[String: Any]] = response!["data"] as! [[String: Any]]
                    for list in listArray{
                        self.ListModel.append(ArticleListModel(articleId: list["id"] as! String, articleImg: list["image"] as! String, articleName: list["name"] as! String, articleCount: list["count"] as! String, articleCft: list["cftcount"] as! String))
                    }
                    self.collectionView.reloadData()
                    break
                    
                case AppConstants.FAILED:
                    self.showToast(message: AppConstants.DNP)
                    
                default:
                    break
                }
            }
        })
    }
    //MARK: - IBOutlet Method
    @IBAction func backClcikedBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func submitCLcikedBtn(_ sender: Any) {
        let articledetails = FinalReviewComplete.instantiate(fromAppStoryboard: .CompleteHouseHoldMain)
        self.navigationController?.pushViewController(articledetails, animated: true)
    }
    @IBAction func viewArticleDetails(_ sender: Any) {
        let articledetails = ArticleDetailsComplete.instantiate(fromAppStoryboard: .CompleteHouseHoldMain)
        self.navigationController?.pushViewController(articledetails, animated: true)
    }
}

 //MARK: - UICollectionViewDelegateFlowLayout Method
extension ArticleListComplete: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 147, height: 123)
    }
}

 //MARK: - UICollectionViewDataSource Method
extension ArticleListComplete: UICollectionViewDataSource{
    func numberOfSections(in cxollectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ListModel.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppConstants.CellName, for: indexPath) as! MyCollectionViewCell
        let listItem: ArticleListModel
        listItem = ListModel[indexPath.row]
        cell.setUpLayOut(listModel: listItem, cell: cell)
        
        return cell
    }
}

 //MARK: - UICollectionViewDelegate Method
extension ArticleListComplete: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let listItem: ArticleListModel
        listItem = ListModel[indexPath.row]
        let catId = listItem.articleId
        let catName = listItem.articleName
        let articleDetailsComplete = ArticleDetailsComplete.instantiate(fromAppStoryboard: .CompleteHouseHoldMain)
        articleDetailsComplete.CatName = catName
        articleDetailsComplete.CatId = catId
        self.navigationController?.pushViewController(articleDetailsComplete, animated: true)
        
    }
    
}
