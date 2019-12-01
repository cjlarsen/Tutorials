//
//  ViewController+UIPickerViewDelegate.swift
//  UIPickerViewTutorial
//
//  Created by Chris Larsen on 11/30/19.
//  Copyright © 2019 Unknown. All rights reserved.
//

import UIKit

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updateTime()
    }
}
