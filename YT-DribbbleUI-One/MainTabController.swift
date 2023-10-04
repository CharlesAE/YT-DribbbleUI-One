//
//  MainTabController.swift
//  YT-DribbbleUI-One
//
//  Created by Charles Edwards on 10/10/23.
//

import Foundation
import UIKit

class MainTabController: UITabBarController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTabBar()
        configContraints()
        
    }
    
    //Create buttons
    let homeBtn: UIButton = {
        var btn = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 16, weight: .light, scale: .large)
        let image = UIImage(systemName: "house.fill", withConfiguration: config)
        btn.setImage(image, for: .normal)
        btn.backgroundColor = UIColor(named: "orangeColor")
        btn.tintColor = .white
        btn.layer.cornerRadius = 20
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let bagBtn : UIButton = {
        var btn = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 16, weight: .light, scale: .large)
        let image = UIImage(systemName: "bag", withConfiguration: config)
        btn.setImage(image, for: .normal)
        btn.backgroundColor = .clear
        btn.tintColor = UIColor(named: "whiteColor")
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let heartBtn : UIButton = {
        let btn = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 16, weight: .light, scale: .large)
        let image = UIImage(systemName: "heart", withConfiguration: config)
        btn.setImage(image, for: .normal)
        btn.backgroundColor = .clear
        btn.tintColor = UIColor(named: "whiteColor")
        btn.translatesAutoresizingMaskIntoConstraints = false
            return btn
        }()
    
    let userBtn : UIButton = {
        let btn = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 16, weight: .light, scale: .large)
        let image = UIImage(systemName: "person", withConfiguration: config)
        btn.setImage(image, for: .normal)
        btn.backgroundColor = .clear
        btn.tintColor = UIColor(named: "whiteColor")
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
        }()

    
    func configTabBar(){
        //Set the HomeController we created in the previous articles
        // as the main ViewController for the tabbar
        viewControllers = [HomeController()]
        
        //Add each of the buttons to the tab bar
        tabBar.addSubview(homeBtn)
        tabBar.addSubview(bagBtn)
        tabBar.addSubview(heartBtn)
        tabBar.addSubview(userBtn)

        // creates a black horizontal rectangle with rounded corners
        let layer = CAShapeLayer()
        let x: CGFloat = 25
        let y: CGFloat = 20
        let height = self.tabBar.bounds.height + y * 1.5
        layer.path = UIBezierPath(roundedRect:
        CGRect(x: x, y: self.tabBar.bounds.minY - y,
        width: self.tabBar.bounds.width - 50,
        height: height),
        cornerRadius: 16).cgPath
        layer.fillColor = UIColor.black.cgColor
        // assign the shape to the tabbar
        tabBar.layer.insertSublayer(layer, at: 0)

        // this sets the portions of the tab bar,
        // not governed by the horizontal rectangle
        // to be transparent
        tabBar.backgroundImage = UIImage()
        
    }
    func configContraints(){
        // the x value for each button is unique
        // to place each button at a differnet location
        // along the tab bar's X (horizontal) axis.
        // You can play with these values as you like
        homeBtn.frame = CGRect(x: self.tabBar.bounds.width / 8, y: 0 , width: 40, height: 40)
        bagBtn.frame = CGRect(x: self.tabBar.bounds.width / 3, y: 0 , width: 40, height: 40)
        heartBtn.frame = CGRect(x: self.tabBar.bounds.width / 1.75 , y: 0 , width: 40, height: 40)
        userBtn.frame = CGRect(x: self.tabBar.bounds.width / 1.25, y: 0 , width: 40, height: 40)
        
        
       
    }
    
}

