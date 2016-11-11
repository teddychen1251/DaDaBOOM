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
    var AIshotsLeft = 0
    
    var yourTurn = false
    var yourMove = "r"
    var shotsLeft = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        view.backgroundColor = UIColor.redColor()
        startRound()
    }
    
    func startRound() {
        view.backgroundColor = UIColor.greenColor()
        daDaSetUp()
    }
    
    func daDaSetUp() {
        let chance = Int(arc4random_uniform(100))
        if chance < AIreloadChance {
            AImove = "r"
            AIshotsLeft += 1
        } else if chance < AIshootChance {
            AImove = "s"
            AIshotsLeft -= 1
        } else {
            AImove = "i"
        }
        yourTurn = true
    }
    
    func comparator() {
        if AImove == yourMove {
            if yourMove == "s" {
                print("tie" + " AI: \(AImove) You: \(yourMove)")
            } else {
                print("nothing happens" + " AI: \(AImove) You: \(yourMove)")
                AIchanceAdjustor()
                daDaSetUp()
            }
        } else if AImove == "i" || yourMove == "i" {
            print("nothing happens" + " AI: \(AImove) You: \(yourMove)")
            AIchanceAdjustor()
            daDaSetUp()
        } else if AImove == "r" {
            print("you win" + " AI: \(AImove) You: \(yourMove)")
        } else if yourMove == "r" {
            print("AI wins" + " AI: \(AImove) You: \(yourMove)")
        }
    }
    
    func AIchanceAdjustor() {
        if AIshotsLeft == 0 {
            AIreloadChance = 35
            AIshootChance = 0
        } else {
            AIreloadChance = 30 - (3 * AIshotsLeft)
            AIshootChance = 50 + (2 * AIshotsLeft)
        }
    }

    @IBAction func onTappedReloadButton(sender: UIButton) {
        if yourTurn {
            yourTurn = false
            yourMove = "r"
            shotsLeft += 1
            comparator()
        }
    }
    @IBAction func onTappedShieldButton(sender: UIButton) {
        if yourTurn {
            yourTurn = false
            yourMove = "i"
            comparator()
        }
    }
    @IBAction func onTappedShootButton(sender: UIButton) {
        if yourTurn {
            yourTurn = false
            if shotsLeft > 0 {
                yourMove = "s"
                shotsLeft -= 1
            } else {
                yourMove = "r"
            }
            comparator()
        }
    }
  
}
