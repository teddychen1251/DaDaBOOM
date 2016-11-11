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
    
    var yourTurn = false
    var yourMove = "r"
    var shotsLeft = 0

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
        yourTurn = true
    }
    
    func comparator() {
        if AImove == yourMove {
            if yourMove == "s" {
                print("tie")
            } else {
                print("nothing happens")
            }
        } else if AImove == "i" || yourMove == "i" {
            print("nothing happens")
        } else if AImove == "r" {
            print("you win")
        } else if yourMove == "r" {
            print("AI wins")
        }
    }

    @IBAction func onTappedReloadButton(sender: UIButton) {
        if yourTurn {
            yourMove = "r"
            shotsLeft += 1
            comparator()
            yourTurn = false
        }
    }
    @IBAction func onTappedShieldButton(sender: UIButton) {
        if yourTurn {
            yourMove = "i"
            comparator()
            yourTurn = false
        }
    }
    @IBAction func onTappedShootButton(sender: UIButton) {
        if yourTurn {
            if shotsLeft > 0 {
                yourMove = "s"
                shotsLeft -= 1
            } else {
                yourMove = "r"
            }
            comparator()
            yourTurn = false
        }
    }
  
}
