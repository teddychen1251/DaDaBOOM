//
//  GameViewController.swift
//  DaDaBOOM
//
//  Created by Teddy Chen on 9/10/16.
//  Copyright © 2016 Teddy Chen. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var shotsLeftLabel: UILabel!
    @IBOutlet weak var rightHand: UIImageView!
    @IBOutlet weak var leftHand: UIImageView!
    @IBOutlet weak var hands: UIStackView!
    
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
        startRound()
    }
    
    func startRound() {
        daDaSetUp()
    }
    
    func daDaSetUpHelper() {
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
    
    func daDaSetUp() {
        print(hands.center.y)
        rightHand.image = UIImage(named: "rightSetupHand")
        leftHand.image = UIImage(named: "leftSetupHand")
        UIView.animateWithDuration(0.2, animations: {
            self.hands.center.y += 75
            }) { (finished) in
                UIView.animateWithDuration(0.2, animations: { 
                    self.hands.center.y -= 75
                    }, completion: { (finished) in
                        UIView.animateWithDuration(0.2, animations: { 
                            self.hands.center.y += 75
                            }, completion: { (finished) in
                                UIView.animateWithDuration(0.2, animations: { 
                                    self.hands.center.y -= 75
                                    }, completion: { (finished) in
                                        self.daDaSetUpHelper()
                                })
                        })
                })
        }
    }
    
    func handImageShower() {
        switch AImove {
        case "r":
            rightHand.image = UIImage(named: "rightReloadHand")
            leftHand.image = UIImage(named: "leftReloadHand")
        case "s":
            rightHand.image = UIImage(named: "rightShootHand")
            leftHand.image = UIImage(named: "leftShootHand")
        case "i":
            rightHand.image = UIImage(named: "rightShieldHand")
            leftHand.image = UIImage(named: "leftShieldHand")
        default: break
        }
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(GameViewController.comparator), userInfo: nil, repeats: false)
    }
    func comparator() {
        if AImove == yourMove {
            if yourMove == "s" {
                print("tie" + " AI: \(AImove) You: \(yourMove)")
                rightHand.image = UIImage(named: "rightStalemateHand")
                leftHand.image = UIImage(named: "leftStalemateHand")
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
            rightHand.image = UIImage(named: "rightDeathHand")
            leftHand.image = UIImage(named: "leftDeathHand")
        } else if yourMove == "r" {
            print("AI wins" + " AI: \(AImove) You: \(yourMove)")
            rightHand.image = UIImage(named: "winHand")
            leftHand.image = UIImage(named: "winHand")
        }
    }
    
    func AIchanceAdjustor() {
        print("AI shots left: \(AIshotsLeft) Your shots left: \(shotsLeft)")
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
            //The label changing numbers is somehow causing the hands to glitch upwards
            shotsLeft += 1
            shotsLeftLabel.text = String(shotsLeft)
            handImageShower()
        }
    }
    @IBAction func onTappedShieldButton(sender: UIButton) {
        if yourTurn {
            yourTurn = false
            yourMove = "i"
            handImageShower()
        }
    }
    @IBAction func onTappedShootButton(sender: UIButton) {
        if yourTurn {
            yourTurn = false
            if shotsLeft > 0 {
                yourMove = "s"
                shotsLeft -= 1
                shotsLeftLabel.text = String(shotsLeft)
            } else {
                yourMove = "r"
            }
            handImageShower()
        }
    }
  
}
