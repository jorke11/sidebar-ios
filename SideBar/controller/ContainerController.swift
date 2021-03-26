//
//  ContainerController.swift
//  SideBar
//
//  Created by Jorge Pinedo on 6/26/19.
//  Copyright © 2019 Jorge Pinedo. All rights reserved.
//

import UIKit

class ContainerController: UIViewController{
    
    
    var menuController:MenuController!
    var centerController:UIViewController!
    var isExpanded = false
    
    override func viewDidLoad(){
        super.viewDidLoad()
        configureHomeController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation{
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool{
        return isExpanded
    }
    
    func configureHomeController(){
        let homeControler = HomeController()
        homeControler.delegate = self
        centerController  = UINavigationController(rootViewController: homeControler)
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configureMenuController(){
        if menuController == nil {
            menuController = MenuController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
            print("Did add menu controller")
        }
    }
    
    func animatePanel(shouldExpand: Bool, menuOption: MenuOption?){
        if shouldExpand{
            UIView.animate(withDuration: 0.5,delay: 0,usingSpringWithDamping: 0.8,initialSpringVelocity: 0,options: .curveEaseOut,animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
            },completion: nil)
        }else{
            UIView.animate(withDuration: 0.5,delay: 0,usingSpringWithDamping: 0.8,initialSpringVelocity: 0,options: .curveEaseOut,animations: {
                self.centerController.view.frame.origin.x = 0
            },completion: nil)
            print("lleg")
            UIView.animate(withDuration: 0.5,delay: 0,usingSpringWithDamping: 0.8,initialSpringVelocity: 0,options: .curveEaseOut,animations: {
                self.centerController.view.frame.origin.x = 0
            }){(_) in
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
        
        animateStatusBar()
    }
    
    func didSelectMenuOption(menuOption: MenuOption){
        switch menuOption {
        case .Profile:
            print("show Profile")
        case .Inbox:
            print("show Inbox")
        case .Notifications:
            print("show Notifications")
        case .Settings:
            let controller = SettingsController()
            controller.username = "Test Username"
            present(UINavigationController(rootViewController: SettingsController()),animated: true, completion: nil)
            
            print("show Settings")
        }
    }
    
    func animateStatusBar(){
        UIView.animate(withDuration: 0.5,delay: 0,usingSpringWithDamping: 0.8,initialSpringVelocity: 0,options: .curveEaseOut,animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        },completion: nil)
    }
}

extension ContainerController: HomeControllerDelegate{
    func handleMenuToogle(forMenuOption menuOption: MenuOption?) {
        if !isExpanded{
            configureMenuController()
        }
        
        isExpanded = !isExpanded
        animatePanel(shouldExpand: isExpanded,menuOption: menuOption)
    }
}
