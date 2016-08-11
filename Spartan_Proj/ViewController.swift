//
//  ViewController.swift
//  Spartan_Proj
//
//  Created by Edward Garcia on 8/10/16.
//  Copyright © 2016 Edward Garcia. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var playerHead: UIButton!
    
    @IBOutlet weak var enemyHead: UIButton!
    
    @IBOutlet weak var ChooseLbl: UILabel!
    
    @IBOutlet weak var txtHolder: UIImageView!
    
    @IBOutlet weak var plyr1AttkBtn: UIButton!
    
    @IBOutlet weak var plyr2AttkBtn: UIButton!
    
    @IBOutlet weak var enemyImg: UIImageView!
    
    @IBOutlet weak var playerImg: UIImageView!
    
    @IBOutlet weak var messageLbl: UILabel!
    
    @IBOutlet weak var enemyHPLbl: UILabel!
    
    @IBOutlet weak var heroHPLbl: UILabel!
    
    
    var player: Hero!
    var enemy: Enemy!
    var messages: String!
    var bkRoundSound: AVAudioPlayer!
    var hitSound: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // players
        player = Hero(name: "SirEmo2016", attackPwr: 30, hp: 105)
        enemy = Enemy(name: "The Grumbler", attackPwr: 25, hp: 75)
        
        // input Hit Sound
        let hitPath = NSBundle.mainBundle().pathForResource("punch", ofType: "wav")
        let hitSoundUrl = NSURL(fileURLWithPath: hitPath!)
        
        do {
            try hitSound = AVAudioPlayer(contentsOfURL: hitSoundUrl)
            hitSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
   
        // input Backround Music
        let path = NSBundle.mainBundle().pathForResource("bkrdMusic", ofType: "wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            try bkRoundSound = AVAudioPlayer(contentsOfURL: soundUrl)
            bkRoundSound.prepareToPlay()
            bkRoundSound.play()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    
  
    @IBAction func onenemyAttkBtnTapped(sender: AnyObject) {
        playHitSound()
        plyr2AttkBtn.hidden = true
        delayAttack()
        if player.attemptAttack(enemy.attackPwr) {
            messageLbl.text = "You Attacked \(player.name) for \(player.attackPwr)"
            heroHPLbl.text = "\(player.hp) HP"
        } else {
            messageLbl.text = "Your Attack Did Not Work"
        }
        gameOver()
    
    }
    
    
    @IBAction func onheroAttkBtnTapped(sender: AnyObject) {
        playHitSound()
        plyr1AttkBtn.hidden = true
        delayAttack()
        if enemy.attemptAttack(player.attackPwr) {
            messageLbl.text = "You Attacked \(enemy.name) for \(enemy.attackPwr)"
            enemyHPLbl.text = "\(enemy.hp) HP"
        } else {
            messageLbl.text = "Your Attack Did Not Work"
        }
        
        gameOver()
    }
    
    
    @IBAction func onHeroTapped(sender: AnyObject) {
        playerSelected()
        playHitSound()
        messageLbl.text = "Your Warrior is \(player.name)"
        showLabel()
        
    }
    
    @IBAction func onEnemyTapped(sender: AnyObject) {
        playerSelected()
        playHitSound()
        messageLbl.text = "Your Warrior is \(enemy.name)"
        showLabel()
    }
    
    func playerSelected() {
        viewDidLoad()
        playerHead.hidden = true
        enemyHead.hidden = true
        ChooseLbl.hidden = true
        
        txtHolder.hidden = false
        playerImg.hidden = false
        enemyImg.hidden = false
        plyr1AttkBtn.hidden = false
        plyr2AttkBtn.hidden = false
        enemyHPLbl.hidden = false
        heroHPLbl.hidden = false
        messageLbl.hidden = false
        
    }
    
    func gameOver() -> Bool{
        
        if !player.isAlive || !enemy.isAlive {
        playerHead.hidden = false
        enemyHead.hidden = false
        ChooseLbl.hidden = false
        
        txtHolder.hidden = true
        playerImg.hidden = true
        enemyImg.hidden = true
        plyr1AttkBtn.hidden = true
        plyr2AttkBtn.hidden = true
        enemyHPLbl.text = ""
        heroHPLbl.text = ""
        enemyHPLbl.hidden = true
        heroHPLbl.hidden = true
        messageLbl.hidden = true
        return true
        }
        return false
    }
    
    func playHitSound() {
        if hitSound.playing {
            hitSound.stop()
        }
        hitSound.play()
    }
    
    func showLabel() {
        heroHPLbl.text = "\(player.hp) HP"
        enemyHPLbl.text = "\(enemy.hp) HP"
    }
    
    func showControls() -> Bool{
        
        if gameOver() == false {
            if plyr1AttkBtn.hidden == true {
                plyr1AttkBtn.hidden = false
            } else if plyr2AttkBtn.hidden == true {
                plyr2AttkBtn.hidden = false
            }

        }
        return false
    }
    
    func delayAttack() {
        if plyr1AttkBtn.hidden == true {
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.showControls), userInfo: nil, repeats: false)
        } else if plyr2AttkBtn.hidden == true {
            NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.showControls), userInfo: nil, repeats: false)
       }

}
}


