//
//  GameViewController.swift
//  DaDaBOOM
//
//  Created by Teddy Chen on 9/10/16.
//  Copyright © 2016 Teddy Chen. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var AIreloadChance = 100
    var AIshootChance = 0
    var AImove = "r"

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
    
    func daDaSetUp() {
        let chance = Int(arc4random_uniform(100))
        if chance < AIreloadChance {
            AImove = "r"
        } else if chance < AIshootChance {
            AImove = "s"
        } else {
            AImove = "i"
        }
    }

    @IBAction func onTappedReloadButton(sender: UIButton) {
    }
    @IBAction func onTappedShieldButton(sender: UIButton) {
    }
    @IBAction func onTappedShootButton(sender: UIButton) {
    }
  
}
