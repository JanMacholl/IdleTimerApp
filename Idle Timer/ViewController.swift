//
//  ViewController.swift
//  Idle Timer
//
//  Created by Joey on 29.10.19.
//  Copyright © 2019 Meixner & Ruof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mainTreeImageView: UIImageView!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var actionButton: UIButton!
    
    @IBOutlet var treeTRhumbnails: [UIImageView]!
    
    var currentTree = 1
    var timePassed = 0
    var grownTrees = 0
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func updateTrees() {
        currentTree += 1
        if let image = UIImage(named: "Tree\(currentTree)") {
            widthConstraint.constant += widthConstraint.constant * 0.5
            mainTreeImageView.image = image
        } else if let image = UIImage(named: "Tree1") {
            treeTRhumbnails[grownTrees].alpha = 1.0
            grownTrees += 1
            widthConstraint.constant = 100
            mainTreeImageView.image = image
            currentTree = 1
        }
    }

    @objc func updateTime() {
        timePassed += 1
        if timePassed % 2 == 0 {
            updateTrees()
        }
    }
    
    @IBAction func actionButtonHandler(_ sender: UIButton) {
        switch actionButton.titleLabel?.text {
        case "START":
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            actionButton.setTitle("STOP", for: .normal)
        case "STOP":
            timer?.invalidate()
            actionButton.setTitle("START", for: .normal)
        default:
            break
        }
    }
    
}

