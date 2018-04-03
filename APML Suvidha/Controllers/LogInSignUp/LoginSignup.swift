//
//  LoginSignup.swift
//  APML Suvidha
//
//  Created by Nishant Gupta on 17/02/18.
//  Copyright © 2018 Interactive Bees. All rights reserved.
//

import UIKit
class LoginSignup: UIViewController,UIScrollViewDelegate {
    
    //MARK: Properties
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    open override var prefersStatusBarHidden: Bool { return true }
    let login = Bundle.main.loadNibNamed("login", owner: self, options: nil)!.first! as! login
    let signup = Bundle.main.loadNibNamed("signup", owner: self, options: nil)!.last! as! signup
    var loginview:UIView? = nil
    var signupview:UIView? = nil
    
    //MARK: UIVIewController Method
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setUpLayout()
         loginview = UIView(frame:CGRect(x:0, y:loginBtn.frame.size.height - 1.0, width:loginBtn.frame.size.width, height:1))
        loginview?.backgroundColor=UIColor.red
        loginBtn.addSubview(loginview!)
        signupview = UIView(frame:CGRect(x:0
            , y:signupBtn.frame.size.height - 1.0, width:signupBtn.frame.size.width, height:1))
        signupview?.backgroundColor=UIColor.darkGray
        signupview?.isHidden = true
        signupBtn.addSubview(signupview!)
    }

    override func viewWillAppear(_ animated: Bool) {
        let OriginLocation = AppUserDefaults.value(forKey: .Location_Origin, fallBackValue: "")
        if OriginLocation == ""{
        }else{
            signup.locationFromLbl.text = OriginLocation.stringValue
        }
        let DestinationLocation = AppUserDefaults.value(forKey: .Location_Destination, fallBackValue: "").stringValue
        if DestinationLocation == ""{
        }else{
            signup.locationToLbl.text = DestinationLocation
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
       //MARK: IBAction Method
    @IBAction func loginClickedBtn(_ sender: Any) {
        var  frame:CGRect = self.scrollView.frame;
        frame.origin.x = 0;
        loginBtn.setTitleColor(UIColor.init(red: 216.0/255, green: 30.0/255, blue: 29.0/255, alpha: 1), for: UIControlState.normal)
        signupBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        frame.origin.y = 0;
        self.scrollView.scrollRectToVisible(frame
            , animated: true)
     
        loginview?.backgroundColor=UIColor.red
     loginview?.isHidden = false
        signupview?.isHidden = true
        signupview?.backgroundColor=UIColor.darkGray
        //loginBtn.addSubview(loginview)
    }
    
    @IBAction func signupClickedBtn(_ sender: Any) {
        var  frame:CGRect = self.scrollView.frame;
        frame.origin.x = CGFloat(Float(frame.size.width));
        loginBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        signupBtn.setTitleColor(UIColor.init(red: 216.0/255, green: 30.0/255, blue: 29.0/255, alpha: 1), for: UIControlState.normal)
        frame.origin.y = 0;
        self.scrollView.scrollRectToVisible(frame, animated: true)
        loginview?.backgroundColor=UIColor.darkGray
        loginview?.isHidden = true
        signupview?.isHidden = false
        signupview?.backgroundColor=UIColor.red
        
       
    }
    //MARK : NSNotification Method
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
  
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y = 0
            }
        }
    }
    //MARK: Custom Method
    func setUpLayout(){
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(LoginSignup.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(LoginSignup.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        login.sendOtpBtn.addTarget(self, action: #selector(loginBtn(btn:)), for: .touchUpInside)
        signup.submitBtn.addTarget(self, action: #selector(signupBtn(btn:)), for: .touchUpInside)
        signup.locationFromBtn.addTarget(self, action: #selector(locationFromBtn(btn:)), for: .touchUpInside)
          signup.locationToTxtField.addTarget(self, action: #selector(locationToTxtField(btn:)), for: .touchUpInside)
        let scrollViewFramWidth = self.view.frame.size.width
        //        let scrollViewFramHieght:CGFloat = self.scrollView.frame.size.height
        let scrollViewFramHieght = self.view.bounds.height
        let mainvie = UIView(frame:CGRect(x: 0, y: 0, width: scrollViewFramWidth * 2, height: scrollViewFramHieght))
        mainvie.backgroundColor = UIColor.white
        
        let viewOne = UIView(frame:CGRect(x: 0, y: 0, width: scrollViewFramWidth, height: scrollViewFramHieght))
        
        viewOne.addSubview(login)
        let viewTwo = UIView(frame:CGRect(x: scrollViewFramWidth, y: 0, width: scrollViewFramWidth, height: scrollViewFramHieght))
        
        let scroll = UIScrollView(frame:CGRect(x: 0, y: 0, width: scrollViewFramWidth, height: scrollViewFramHieght))
        
        //        let contentView = UIView(frame: CGRect(x: 0, y: 0, width: scrollViewFramWidth, height: scrollViewFramHieght + 200))
        //        scroll.addSubview(contentView)
        scroll.contentSize = CGSize(width:scrollViewFramWidth, height:scrollViewFramHieght + 200)
        scroll.addSubview(signup)
        viewTwo.addSubview(scroll)
        mainvie.addSubview(viewOne)
        mainvie.addSubview(viewTwo)
        self.scrollView.addSubview(mainvie as UIView)
        //getBannerApi()
        self.scrollView.contentSize = CGSize(width:scrollViewFramWidth * 2, height:self.scrollView.frame.height)
        self.scrollView.delegate = self
        self.scrollView.bounces = false
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.isPagingEnabled = true
        // self.pageControll.currentPage = 0
    }
    @objc func locationFromBtn(btn: UIButton){
         let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "location") as? Locations
        vc?.text = AppConstants.METHOD_ORIGIN
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    @objc func locationToTxtField(btn: UIButton){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "location") as? Locations
        vc?.text = AppConstants.METHOD_DESTINATION
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @objc func signupBtn(btn: UIButton){
        if signup.nameTxtField.text! == ""{
            customAlert(msg: "Please enter name field", titles:"Error!!" )
        }
        else{
            if signup.mobileTxtField.text! == "" || !Validate.shared.validateMobile(value: signup.mobileTxtField.text!){
                 customAlert(msg: "Please enter mobile number field", titles:"Error!!" )
            }
            else{
                if Validate.shared.isValid(signup.emailTxtField.text!)
                {
                     let OriginLocation = AppUserDefaults.value(forKey: .Location_Origin, fallBackValue: "")
                     let DestinationLocation = AppUserDefaults.value(forKey: .Location_Destination, fallBackValue: "")
                if OriginLocation == "" || DestinationLocation == ""{
                    customAlert(msg: "Please select location first", titles:"Error!!" )
                   }else{
                        signupAPiMethodCall(deviceTkn: "sd", mobileNo: signup.mobileTxtField.text!, Name: signup.nameTxtField.text!, Email: signup.emailTxtField.text!, Origin: OriginLocation.stringValue, Destination: DestinationLocation.stringValue, NewEnwuiry: "1")
                    }
                }  else{
                    customAlert(msg: "Please enter email field", titles:"Error!!" )
                }
            }
        }
   }
    @objc func loginBtn(btn: UIButton){
        
        if login.mobileTxtField.text! == "" || !Validate.shared.validateMobile(value: login.mobileTxtField.text!){
            customAlert(msg: "Please enter correct mobile number", titles:"Error!!" )
        }
        else{
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "otp") as? otpScreen
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    func customAlert(msg: String,titles: String) -> Void {
        let alert = UIAlertController(title:titles, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        if currentPage == 0{
            loginview?.backgroundColor=UIColor.red
            loginview?.isHidden = false
            signupview?.isHidden = true
            signupview?.backgroundColor=UIColor.darkGray
            loginBtn.setTitleColor(UIColor.init(red: 216.0/255, green: 30.0/255, blue: 29.0/255, alpha: 1), for: UIControlState.normal)
            signupBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        }
        else{
            loginview?.backgroundColor=UIColor.red
            loginview?.isHidden = true
            signupview?.isHidden = false
            signupview?.backgroundColor=UIColor.red
            loginBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
            signupBtn.setTitleColor(UIColor.init(red: 216.0/255, green: 30.0/255, blue: 29.0/255, alpha: 1), for: UIControlState.normal)
        }
        
    }
    
    //MARK: - API Method
    func loginApiMethodCall(){
        WebServices.shared.loginApi(methodName: AppConstants.METHOD_LOGIN, MobileNumber: login.mobileTxtField.text!, DeviceId: "ss", completion: {(response,error) in
            
        })
    }
    
    func signupAPiMethodCall(deviceTkn: String,mobileNo: String,Name: String,Email: String,Origin: String,Destination: String,NewEnwuiry: String){
        WebServices.shared.getSignUpApi(methodName: AppConstants.METHOD_SIGNUP, deviceToken: deviceTkn, mobileNumber: mobileNo, userName: Name, userEmail: Email, originLocation: Origin, destinationLocstion: Destination, newEnquiry: NewEnwuiry, completion: {(response,error) in
            if error == nil{
                guard  let status = response![AppConstants.STATUSTXT] as? Int else { return }
                let statusString = "\(status)"
                switch (statusString){
                case AppConstants.SUCCESS:
                    let mobileOtpStatus = response!["mobileotp"] as! String
                    let UniqId = response!["uniqid"] as! String
                    AppUserDefaults.save(value: Name, forKey: .USERNAME)
                    AppUserDefaults.save(value: Email, forKey: .USEREMAIL)
                    AppUserDefaults.save(value: mobileNo, forKey: .USERMOBILE)
                    AppUserDefaults.save(value: Origin, forKey: .Location_Origin)
                    AppUserDefaults.save(value: Destination, forKey: .Location_Destination)
                    AppUserDefaults.save(value: UniqId, forKey: .UNIQUE)
                    
                    if mobileOtpStatus == "Otpsent"{
                        let otp = response!["otp"] as! String
                        AppUserDefaults.save(value: otp, forKey: .OTP)
                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                        let vc = storyBoard.instantiateViewController(withIdentifier: "otp") as? otpScreen
                        self.navigationController?.pushViewController(vc!, animated: true)
                        
                    }else if mobileOtpStatus == "firstuser"{
                        
                        
                        let storyBoard = UIStoryboard(name: "Main", bundle:nil)
                        let vc = storyBoard.instantiateViewController(withIdentifier: "RAMAnimatedTabBarController") as? RAMAnimatedTabBarController
                        self.navigationController?.show(vc!, sender: nil)
                    }
                    break
                case AppConstants.FAILED:
                   self.showToast(message: "You have Already Registered")
                    break
                default:
                    break
                }
            }
        })
    }
}




