//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Eduard Tokarev on 24.02.2023.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var result: String?
    var tip: Int?
    var split: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = result
        settingsLabel.text = "Split between \(split ?? 2) people, with \(tip ?? 0)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
