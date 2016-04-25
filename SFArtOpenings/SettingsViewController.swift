//
//  SettingsViewController.swift
//  SFArtOpenings
//
//  Created by christopher soria on 4/16/16.
//  Copyright © 2016 Codepath-Juan-Yousef-Chris. All rights reserved.
//

import UIKit
import Parse

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var colorControl: UISegmentedControl!
    
    let colorDefaults = NSUserDefaults.standardUserDefaults()
    
    var redColor : UIColor!
    
    var greenColor : UIColor!
    
    var orangeColor : UIColor!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        var orangeColor = UIColor.orangeColor()
        var redColor = UIColor.redColor()
        var greenColor = UIColor.greenColor()
        
        if let backColor = colorDefaults.objectForKey("backColor") as? String {
            switch backColor {
            case "red": redColor = UIColor.redColor(); colorControl.selectedSegmentIndex = 2
            case "green": greenColor = UIColor.greenColor(); colorControl.selectedSegmentIndex = 1
            case "orange": orangeColor = UIColor.orangeColor(); colorControl.selectedSegmentIndex = 0
            default: break
            }
            
        
            
            
            
//            if colorControl.selectedSegmentIndex == 0{
//                colorDefaults.setObject(backColor, forKey: "red");
//            }
//            
//            if colorControl.selectedSegmentIndex == 1{
//                colorDefaults.setObject(backColor, forKey: "green");
//            }
            
        }
        
        

        
        colorDefaults.synchronize()
        
        print("view will appear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


        // Do any additional setup after loading the view.
        //
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        colorDefaults.setObject(redColor, forKey: "red")
        colorDefaults.setObject(greenColor, forKey: "green")
        colorDefaults.setObject(orangeColor, forKey: "orange")
        
        colorDefaults.synchronize()
        
        print("view will disappear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogout(sender: AnyObject) {
        PFUser.logOut()
        
        self.dismissViewControllerAnimated(false, completion: nil)
        
        print("bye!")
    }
    
    @IBAction func onRandom(sender: AnyObject) {
        //self.view.backgroundColor = self.randomColor()
    }
        
    
    func redColor1() -> UIColor{
        
        return UIColor(red: 0xc0/255, green: 0x29/255, blue: 0x42/255, alpha: 1.0)
        
    }
    
    func orangeColor1() -> UIColor{
        
        return UIColor(red: 0xd9/255, green: 0x5b/255, blue: 0x43/255, alpha: 1.0)
        
    }
    
    func greenColor1() -> UIColor{
        
        return UIColor(red: 0x53/255, green: 0x77/255, blue: 0x7a/255, alpha: 1.0)
        
    }

    @IBAction func segControlColorChange(sender: AnyObject) {
        
        if (colorControl.selectedSegmentIndex == 0) {
            self.view.backgroundColor = self.orangeColor1()
            colorDefaults.setObject(orangeColor, forKey: "orange")
        }
        if (colorControl.selectedSegmentIndex == 1) {
            self.view.backgroundColor = self.greenColor1()
            colorDefaults.setObject(greenColor, forKey: "green")
            
        }
        if (colorControl.selectedSegmentIndex == 2) {
            self.view.backgroundColor = self.redColor1()
            colorDefaults.setObject(redColor, forKey: "red")
    }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
