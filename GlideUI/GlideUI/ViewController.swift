//
//  ViewController.swift
//  GlideUI
//
//  Created by Osama Naeem on 24/10/2019.
//  Copyright © 2019 NexThings. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var glideManager : Glide!
    var window = UIWindow()
    let blackView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
         view.backgroundColor = .white
        self.title = "Glide UI"
        
         let glideConfig = Configuration() // Glide Configuration File
         let cardController = CardViewController() // Card View Controller
        
        /// One line manager initializer
         glideManager = Glide(parentViewController: self, configuration: glideConfig, card: cardController)
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show", style: .plain, target: self, action: #selector(handleCardTrigger))
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    @objc func handleCardTrigger() {
        glideManager.triggerCard()
    }
    


}

