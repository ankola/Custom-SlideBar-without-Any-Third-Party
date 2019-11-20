//
//  ThirdVC.swift
//  SlideBarDemo
//
//  Created by ankola on 19/11/19.
//  Copyright © 2019 ankola. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button:UIButton = UIButton(frame: CGRect(x: 15, y: 50, width: 60, height: 50))
        button.setTitle("Menu", for: .normal)
        button.addTarget(self, action:#selector(self.clickOnMenuBtn), for: .touchUpInside)
        self.view.addSubview(button)
    }
        
    @objc func clickOnMenuBtn() {
        SlideMenuViewController.Shared.onSlideMenuButtonPressed(index: 2, vc: self)
    }

}
