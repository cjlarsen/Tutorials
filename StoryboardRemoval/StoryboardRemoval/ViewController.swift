//
//  ViewController.swift
//  StoryboardRemoval
//
//  Created by Chris Larsen on 9/14/19.
//  Copyright © 2019 Unknown. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        let testLabel = UILabel(frame: CGRect(x: 10,
                                              y: 10,
                                              width: 200,
                                              height: 100))
        testLabel.text = "Hello no storyboard world"
        view.addSubview(testLabel)
    }


}

