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
        configConstraints()
        
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
    
    let buttonStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        return stackView
    }()

    
    func configTabBar(){
        //Set the HomeController we created in the previous articles
        // as the main ViewController for the tabbar
        
        viewControllers = [HomeController()]
        
        //Add each of the buttons to the tab bar
        
        tabBar.addSubview(buttonStackView)
        [homeBtn, bagBtn,heartBtn,userBtn].forEach {
            buttonStackView.addArrangedSubview($0)
        }

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
    func configConstraints(){
        
        NSLayoutConstraint.activate([
            buttonStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 6),
            
            
            homeBtn.widthAnchor.constraint(equalToConstant: 40),
            homeBtn.heightAnchor.constraint(equalToConstant: 40),
            
            
            bagBtn.widthAnchor.constraint(equalToConstant: 40),
            bagBtn.heightAnchor.constraint(equalToConstant: 40),
            
            
            heartBtn.widthAnchor.constraint(equalToConstant: 40),
            heartBtn.heightAnchor.constraint(equalToConstant: 40),
            userBtn.widthAnchor.constraint(equalToConstant: 40),
            userBtn.heightAnchor.constraint(equalToConstant: 40),
            
            
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: buttonStackView.trailingAnchor, multiplier: 6)
            
        ])
       
    }
    
}

import SwiftUI

struct TabPreview: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: Context) -> UIViewController{
            return MainTabController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
        
    }
}
