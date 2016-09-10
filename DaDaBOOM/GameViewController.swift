//
//  GameViewController.swift
//  DaDaBOOM
//
//  Created by Teddy Chen on 9/10/16.
//  Copyright © 2016 Teddy Chen. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        view.backgroundColor = UIColor.redColor()
    }
    
    func startRound() {
        view.backgroundColor = UIColor.greenColor()
    }

    @IBAction func onTappedReloadButton(sender: UIButton) {
    }
    @IBAction func onTappedShieldButton(sender: UIButton) {
    }
    @IBAction func onTappedShootButton(sender: UIButton) {
    }
  
}
