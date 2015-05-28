//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Richard Hubbard on 5/25/15.
//  Copyright (c) 2015 Hubbard Consultants. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    
    var myTigers:[Tiger] = []
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var myTiger = Tiger()
        myTiger.name  = "Tigger"
        myTiger.breed = "Bengal"
        myTiger.age = 3
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        myTigers.append(myTiger)
        
        println("My tiger's name is \(myTiger.name), its breed is \(myTiger.breed), its age is \(myTiger.age) and it looks like \(myTiger.image)")
        
        myImageView.image = myTiger.image
        nameLabel.text = myTiger.name
        ageLabel.text = "\(myTiger.age)"
        breedLabel.text = myTiger.breed
        
        var secondTiger = Tiger()
        secondTiger.name  = "Tigress"
        secondTiger.breed = "IndoChinese"
        secondTiger.age = 2
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg")

        var thirdTiger = Tiger()
        thirdTiger.name  = "Jacob"
        thirdTiger.breed = "Malayan"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")

        var fourthTiger = Tiger()
        fourthTiger.name  = "Spar"
        fourthTiger.breed = "Siberian"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        
        myTigers += [secondTiger, thirdTiger, fourthTiger]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        
        var randomIndex:Int
        do {
            randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        } while currentIndex == randomIndex
        
        
//        let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        let tiger = myTigers[randomIndex]
//        myImageView.image = tiger.image
//        nameLabel.text = tiger.name
//        ageLabel.text = "\(tiger.age)"
//        breedLabel.text = tiger.breed
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            self.myImageView.image = tiger.image
            self.nameLabel.text = tiger.name
            self.ageLabel.text = "\(tiger.age)"
            self.breedLabel.text = tiger.breed
            
            }, completion: {
                (finished: Bool) -> () in
        })

    }
}

