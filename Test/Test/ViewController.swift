//
//  ViewController.swift
//  Test
//
//  Created by Stroman on 2021/9/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.targetLabel.text = localString("testkey0")
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var targetLabel: UILabel!
    
    @IBAction func tapGestureAction(_ sender: UITapGestureRecognizer) {
        let controller:LanguagesViewController = LanguagesViewController.init()
        controller.modalPresentationStyle = .fullScreen
        controller.selectedLanguageClosure = {
            print("会掉的是",$0)
            SFLocalizationManager.sharedInstance.updateLanguage(language: $0)
            self.targetLabel.text = localString("testkey0")
        }
        self.present(controller, animated: true) {
        }
    }
}

