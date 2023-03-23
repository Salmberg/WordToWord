//
//  FinishViewController.swift
//  WordToWord
//
//  Created by David Salmberg on 2023-03-23.
//

import UIKit

class FinishViewController: UIViewController {
    
    var points: Int?

    @IBOutlet weak var pointsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let unwrappedPoints = points {
            pointsLabel.text = "Nice! in 10 rounds you got \(unwrappedPoints) points"
        } else {
            // handle the case where points is nil
        }

    }
   
}
