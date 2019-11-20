//
//  MenuViewController.swift
//  AssessmentApp
//
//  Created by ankola on 15/11/19.
//  Copyright © 2019 ankola. All rights reserved.
//

import UIKit

class SlideMenuViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet private var tblMenuOptions : UITableView!

    static let Shared = SlideMenuViewController()
    
    private var arrayMenuOptions = ["First VC", "Second VC", "Third VC"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add Swipe Gesture on View
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeToClose))
        swipeGesture.direction = .left
        self.view.addGestureRecognizer(swipeGesture)
    }

    //Swipe To Close
    @objc private func swipeToClose() {
        let btn = UIButton()
        btn.tag = -1
        self.onCloseMenuClick(btn)
    }
    
    //Open Slide Menu
    func onSlideMenuButtonPressed(index : Int?, vc : UIViewController) {
        
        let menuVC = SlideMenuViewController.init(nibName: "SlideMenuViewController", bundle: nil)
        vc.view.addSubview(menuVC.view)
        vc.addChild(menuVC)
        menuVC.view.layoutIfNeeded()
        
        menuVC.view.frame=CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            menuVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        }, completion:nil)
        
        UserDefaults.standard.set(index, forKey: "navigateFromIndex")
    }
    
    //Close Slide Menu
    @IBAction private func onCloseMenuClick(_ button:UIButton!){
        
        let navigateFromIndex = UserDefaults.standard.value(forKey: "navigateFromIndex") as? Int ?? -1

        if button.tag != -1 && navigateFromIndex != button.tag {
            self.NavigateToOthersScreen(index: button!.tag)
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
            }, completion: { (finished) -> Void in
                self.view.removeFromSuperview()
                self.removeFromParent()
        })
    }
    
    //Navigate To Other Screen
    private func NavigateToOthersScreen(index : Int) {
        if index == 0 { //First VC
            print("First VC")
            let vc = FirstVC.init(nibName: "FirstVC", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        
        } else if index == 1 { //Second VC
            print("Second VC")
            let vc = SecondVC.init(nibName: "SecondVC", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
            
        } else if index == 2 { //Third VC
            print("Third VC")
            let vc = ThirdVC.init(nibName: "ThirdVC", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
    //MARK:- --------- UITableView DataSource, Delegate Methods ------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : MenuTblCell?
        
        if cell == nil {
           cell = Bundle.main.loadNibNamed("MenuTblCell", owner: nil, options: nil)?.first as? MenuTblCell
        }

        cell?.lblTitle.text = "    " +  arrayMenuOptions[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let btn = UIButton()
        btn.tag = indexPath.row
        self.onCloseMenuClick(btn)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMenuOptions.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.size.height * 0.08
    }
}
