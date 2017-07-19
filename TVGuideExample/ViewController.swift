//
//  ViewController.swift
//  TVGidsExample
//
//  Created by Bart den Hollander on 17/07/2017.
//  Copyright © 2017 Bart den Hollander. All rights reserved.
//

import UIKit
import TVGuide

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tvgids = TVGuide()
        tvgids.requestChannel("NPO 1") { (result) in
            switch result {
            case .success(let response):
                print(response.name)
            case .error(let error):
                print(error)
            }
        }
    }

}

