//
//  ViewController.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 16/02/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//https://github.com/dkhamsing/open-source-ios-apps
//https://github.com/matteocrippa/awesome-swift

import UIKit
import SVProgressHUD
import CoreLocation

class GetStartController: UIViewController,UIScrollViewDelegate,CLLocationManagerDelegate {
    
    //MARK: Outlets
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var headingTxtView: UITextView!
    @IBOutlet weak var descriptionTxtView: UITextView!
    @IBOutlet weak var pageControll: UIPageControl!
    //MARK: Variable/Constant
    var locationManager: CLLocationManager!
    var countScroll:Int = 0
    //hide status bar
    open override var prefersStatusBarHidden: Bool { return true }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getlatlong()
        getBannerApi()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: IBOutlet Method
    @IBAction func skipClickedBtn(_ sender: Any) {
    
        let loginVC = LoginSignup.instantiate(fromAppStoryboard: .Main)
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    @IBAction func nextClickedButton(_ sender: Any) {
        
        if Int(countScroll) == 0{
        
            countScroll = countScroll + 1
            var  frame:CGRect = self.scrollview.frame;
            frame.origin.x = CGFloat(Float(frame.size.width) * Float(countScroll));
            frame.origin.y = 0;
            self.scrollview.scrollRectToVisible(frame, animated: true)
            self.pageControll.currentPage = Int(countScroll);
        }else if Int(countScroll) == 1{
            
            countScroll = countScroll + 1
            var  frame:CGRect = self.scrollview.frame;
            frame.origin.x = CGFloat(Float(frame.size.width) * Float(countScroll));
            frame.origin.y = 0;
            self.scrollview.scrollRectToVisible(frame, animated: true)
            self.pageControll.currentPage = Int(countScroll);
        }else if Int(countScroll) == 2{
           
            countScroll = countScroll + 1
            var  frame:CGRect = self.scrollview.frame;
            frame.origin.x = CGFloat(Float(frame.size.width) * Float(countScroll));
            frame.origin.y = 0;
            self.pageControll.currentPage = Int(countScroll);
            self.scrollview.scrollRectToVisible(frame, animated: true)
        }else{
            
            let loginVC = LoginSignup.instantiate(fromAppStoryboard: .Main)
            self.navigationController?.pushViewController(loginVC, animated: true)
            // countScroll = countScroll + 1 pushViewController
            // Show the "Let's Start" button in the last slide (with a fade in animation)
            
        }
        
        
    }
    //MARK: Custom Method
    
    func customAlert(msg: String,titles: String) -> Void {
        let alert = UIAlertController(title:titles, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func getBannerApi(){
        
        
        WebServices.shared.getStartBannerApi(methodName: AppConstants.METHOD_GET_EXPLORE, completion: { (response, error) in
            
            if error == nil{
                
                let status = response![AppConstants.STATUSTXT] as! String
                let msg = response![AppConstants.MESSAGETXT] as! String
                switch(status)
                {
                    
                case AppConstants.SUCCESS:
                    let data = response![AppConstants.DATATXT] as! [[String:Any]]
                    self.setupLayout(response: data)
                    break
                case AppConstants.FAILED:
                    self.customAlert(msg: msg, titles: "Error!!")
                    break
                default: break
                    
                }
                //let message = response(value(forKey: "message"))
            }
            
            
            
        })
        
    }
    func setupLayout(response : [[String:Any]]){
        let scrollViewFramWidth:CGFloat = self.view.frame.size.width
        let scrollViewFramHieght:CGFloat = self.view.frame.height
        let contentView = UIView(frame:CGRect(x: 0, y: 0, width: scrollViewFramWidth * 4, height: scrollViewFramHieght))
        var count = 0
        for item in response{
            
            let mainView = UIView(frame:CGRect(x: scrollViewFramWidth * CGFloat(count), y: 0, width: scrollViewFramWidth, height: scrollViewFramHieght))
            count = count + 1
            //viewOne.backgroundColor = UIColor.white
            let innerView = UIView()
            innerView.frame.origin = mainView.bounds.origin
            //innerviewOne.backgroundColor = UIColor.white
            innerView.frame.size =  CGSize(width: 343, height: 392)
            innerView.center = mainView.convert(innerView.frame.origin, to: mainView)
            //  = UIView(frame:CGRect(h))
            innerView.center = mainView.center
            let showImage = UIImageView(frame:CGRect(x: 30, y: 8, width: 280, height: 220))
            WebServices.shared.getUploadedImages(urlImage: item["image"] as! String, completion:{ (response,error) in
                if error == nil{
                    showImage.image = UIImage(data: response as! Data )
                }
            })
            let headingTxt = UITextView(frame:CGRect(x: 16, y: 249, width: 310, height: 48))
            headingTxt.text = item["description1"] as! String
            headingTxt.font = headingTxt.font?.withSize(16)
            headingTxt.isSelectable = false
            headingTxt.isEditable = false
            headingTxt.textAlignment = .center
            let describtionTxt = UITextView(frame:CGRect(x: 16, y: 300, width: 310, height: 77))
            describtionTxt.text = item["description2"] as! String
            describtionTxt.font = headingTxt.font?.withSize(14)
            describtionTxt.textColor = UIColor.darkGray
            describtionTxt.textAlignment = .center
            describtionTxt.isEditable = false
            headingTxt.isSelectable = false
            innerView.addSubview(showImage)
            innerView.addSubview(headingTxt)
            innerView.addSubview(describtionTxt)
            contentView.addSubview(innerView)
            
        }
        self.scrollview.addSubview(contentView as UIView)
        
        self.scrollview.contentSize = CGSize(width:scrollViewFramWidth * 4, height:self.scrollview.frame.height)
        self.scrollview.delegate = self
        self.scrollview.bounces = false
        self.scrollview.showsVerticalScrollIndicator = false
        self.scrollview.showsHorizontalScrollIndicator = false
        self.scrollview.isPagingEnabled = true
        self.pageControll.currentPage = 0
    }
    func getlatlong(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
    }
    //locationManager func declaration
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status != .authorizedWhenInUse {return}
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        let locValue: CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        
    }
    
    
   
}
private typealias ScrollView = GetStartController
extension ScrollView
{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        self.pageControll.currentPage = Int(currentPage);
        // Change the text accordingly
        countScroll = Int(currentPage)
        
    }
}

