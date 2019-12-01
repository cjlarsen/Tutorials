//
//  ViewController.swift
//  UIPickerViewTutorial
//
//  Created by Chris Larsen on 11/17/19.
//  Copyright © 2019 Unknown. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var timeLabel: UILabel!
    private var selectTimeBtn: UIButton!
    private var containerView: UIView!
    private var timePicker: UIPickerView!
    
    private var doneToolbar: UIToolbar!
            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        containerView = UIView()
        timePicker = UIPickerView()
        
        timePicker.dataSource = self
        timePicker.delegate = self
        
        // Set up label
        timeLabel = UILabel(frame: CGRect(x: 10,
                                          y: 50,
                                          width: self.view.frame.width - 10,
                                          height: 50))
        
        
        timeLabel.text = "No time selected"
        timeLabel.textColor = .white
        view.addSubview(timeLabel)
        
        
        // Set up picker display
        selectTimeBtn = UIButton(frame: CGRect(x: timeLabel.frame.minX,
                                               y: timeLabel.frame.minY + timeLabel.frame.height + 5,
                                               width: 100,
                                               height: 50))
        
        selectTimeBtn.setTitle("Pick Time", for: .normal)
        selectTimeBtn.backgroundColor = .gray
        view.addSubview(selectTimeBtn)
        
        selectTimeBtn.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                  action: #selector(self.displayPicker)))
        
        // Set up picker dismissal
        let customButton = UIButton(type: .custom)
        customButton.frame = CGRect(x: 0.0,
                                    y: 0.0,
                                    width: 50,
                                    height: 35)
        
        customButton.setTitle("Done", for: .normal)
        customButton.setTitleColor(.systemBlue, for: .normal)
        
        customButton.addTarget(self,
                               action: #selector(dismissPicker),
                               for: .touchUpInside)
        
        let doneButton = UIBarButtonItem(customView: customButton)
        
        doneToolbar = UIToolbar()
        doneToolbar.sizeToFit()
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                          target: nil,
                                          action: nil)
        
        doneToolbar.setItems([spaceButton, doneButton],
                             animated: false)
        
        doneToolbar.isUserInteractionEnabled = true
    }
    
    @objc
    private func displayPicker() {
        
        let pickerViewHeight = self.view.bounds.height / 3

        // Set up timerPicker
        timePicker.frame = CGRect(x: 0,
                                  y: 0,
                                  width: view.bounds.width,
                                  height: pickerViewHeight)
        
        timePicker.backgroundColor = .white

        // Set up timePickers container
        containerView.frame = CGRect(x: 0,
                                     y: view.bounds.height,
                                     width: view.bounds.width,
                                     height: pickerViewHeight)
        
        // Set toolbar frame
        doneToolbar.frame = CGRect(x: 0,
                                   y: 0,
                                   width: view.bounds.width,
                                   height: 35)
        
        doneToolbar.backgroundColor = .gray
        
        // Add to views
        containerView.addSubview(timePicker)
        containerView.addSubview(doneToolbar)
        view.addSubview(containerView)
        
        // Animate in
        UIView.animate(withDuration: 0.2) {
            self.containerView.frame.origin.y = (self.view.frame.height - pickerViewHeight)
        }
    }
    
    @objc
    private func dismissPicker() {
        UIView.animate(withDuration: 0.2, animations: {
            self.containerView.frame.origin.y = self.view.frame.height
        }) { _ in
            self.updateTime()
        }
    }
    
    // MARK: Update label method
    func updateTime() {
        timeLabel.text = String(describing: timePicker.selectedRow(inComponent: 0)) + " minute(s) and " + String(describing: timePicker.selectedRow(inComponent: 2)) + " second(s)"
    }
}

