//
//  AllOrderList.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 15/03/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import Foundation
import UIKit

class AllOrderList: UIViewController{

    @IBOutlet weak var menuBar: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    var models = [AllOrderListModel]()
    override func viewWillAppear(_ animated: Bool) {
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.isHidden = true
    }
    override func viewDidLoad() {
        menuBar.action = #selector(backClickedBtn(sender:))
      getOrderList()
       
    }
    
    //MARK: - Custom UIBarButton
    
    
    func getOrderList(){
        let mobileno = AppUserDefaults.value(forKey: .USERMOBILE, fallBackValue: "").stringValue
        let Mehod = AppConstants.METHOD_ORDER_LIST
        WebServices.shared.getOrderList(methodName: Mehod, mobileNo: mobileno, type: "1", completion: { (reponse,error) in
            if(error == nil){
                let statusTxt = reponse![AppConstants.STATUSTXT] as! String
                switch(statusTxt){
                case AppConstants.SUCCESS:
                    let listOrder: [[String: Any]] = reponse!["data"] as! [[String: Any]]
                    for item in listOrder{
                    self.models.append(AllOrderListModel(UniqueId: (item["uniqid"] as? String), MoveStr:  (item["move"] as? String), EnquiryDateStr:  (item["move"] as? String), MoveNameStr: (item["movename"] as? String), MoveDateStr: (item["movedate"] as? String), OriginAreaStr: (item["originarea"] as? String), OriginAddressStr: (item["originaddress"] as? String), DestinationAreaStr: (item["destinationarea"] as? String), DestinationAddressStr: (item["destinationaddress"] as? String), DestinationDistrictStr: (item["destinationdistrict"] as? String), DestinationPinCodeStr: (item["destinationpincode"] as? String), SurveyDateStr: (item["surveydate"] as? String), SurveyNumberStr: (item["surveynumber"] as? String), SurveyStatusStr: (item["surveystatus"] as? String), QuotationStr: (item["quotation"] as? String), QuotationNumberStr: (item["quotationnumber"] as? String), AmountStr: (item["amount"] as? String), SurveyStatusId: (item["surveystatusid"] as? String), NameStr: (item["name"] as? String), EmailStr: (item["email"] as? String), MobileStr: (item["mobile"] as? String), MtypeStr: (item["mtype"] as? String), OrderStatusStr: (item["orderstatus"] as? String), CancelStr: (item["cancel"] as? String), SurveyStr: (item["survey"] as? Int), DayssStr: (item["dayss"] as? Int), Date1Str: (item["date1"] as? String), Date2Str: (item["date2"] as? String), DaysStr: (item["days"] as? Int), PaidPriceStr: (item["paidprice"] as? String), DeleveryStatusStr: (item["deliverystatus"] as? String)))
                        
                    }
                    self.tableView.reloadData()
                    break
                case AppConstants.FAILED:
                    break
                default:
                    break
                }
            }
        })
    }
    @objc func backClickedBtn(sender: UIBarButtonItem){
        self.navigationController?.popViewController(animated: true)
    }
}
extension AllOrderList: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.CellName, for: indexPath) as! AllOrderListCustomCell
        cell.setUpData(cell: cell,model: models[indexPath.row])
        return cell
    }
}
extension AllOrderList: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let orderDetails = OrderDetails.instantiate(fromAppStoryboard: .OrderDetailsMain)
        self.navigationController?.pushViewController(orderDetails, animated: true)
    }
    
}
