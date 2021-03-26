//
//  HomeController.swift
//  SideBar
//
//  Created by Jorge Pinedo on 6/26/19.
//  Copyright © 2019 Jorge Pinedo. All rights reserved.
//

import UIKit

class HomeController: UIViewController{
    
    var delegate:HomeControllerDelegate?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
    }
    
    @objc func handleMenuToggle(){
        delegate?.handleMenuToogle(forMenuOption: nil)
    }
    
    func configureNavigationBar(){
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "Side Bar"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), style:.plain, target: self, action: #selector(handleMenuToggle))
    }
}
