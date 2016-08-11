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
        player = Hero(name: "SirEmo2016", attackPwr: 8, hp: 217)
        enemy = Enemy(name: "The Grumbler", attackPwr: 25, hp: 300)
        
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
        if enemy.attemptAttack(player.attackPwr) {
            messageLbl.text = "You Attacked \(enemy.name) for \(player.attackPwr)"
        } else {
            messageLbl.text = "Your Attack Did Not Work"
        }
    
    }
    
    
    @IBAction func onheroAttkBtnTapped(sender: AnyObject) {
        playHitSound()
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


}

