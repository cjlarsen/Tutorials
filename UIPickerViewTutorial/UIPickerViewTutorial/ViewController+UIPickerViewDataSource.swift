//
//  UIPickerViewDataSource.swift
//  UIPickerViewTutorial
//
//  Created by Chris Larsen on 11/30/19.
//  Copyright © 2019 Unknown. All rights reserved.
//

import UIKit

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 1, 3:
            return 1 // Just text, hours / minutes
        case 0:
            return 11 // Max is 15 minutes
        case 2:
            return 60 // Max is 59 seconds
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        switch component {
        case 1, 3:
            return self.view.frame.width * 0.4 // hours / minutes text
        case 0, 2:
            return self.view.frame.width * 0.1 // just numbers
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(row) "
        case 1:
            return "minute(s)"
        case 2:
            return "\(row) "
        case 3:
            return "second(s)"
        default:
            return ""
        }
    }
}
