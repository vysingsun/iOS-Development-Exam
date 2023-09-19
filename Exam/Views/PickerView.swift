//
//  PickerView.swift
//  Exam
//
//  Created by Phalkun Panha on 16/9/23.
//

import UIKit

class PickerView: UIView {
    
    private let places = ["Phnom Penh", "Banteaymeanchey", "Battambong", "Kep", "Kog kong", "Takeo", "Pilen", "Kampot"]
    
    private var pickerView: UIPickerView!
    
    private let textField = UITextField()
    
    private var button: UIButton!
    
    init() {
        super.init(frame: .zero)
        
        pickerView = UIPickerView()
        
        button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Click me!", for: .normal)
        button.addTarget(self, action: #selector(showPickerView), for: .touchUpInside)
        
        addSubview(button)
        
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
     
        addSubview(textField)
//        textField.isHidden = true
//        textField.inputView = pickerView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func showPickerView() {

        pickerView.dataSource = self
        pickerView.delegate = self
        
        backgroundColor = .white
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(clickDone))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([flexible, doneBtn], animated: true)
        textField.inputAccessoryView = toolBar
        textField.becomeFirstResponder()
    }
    

    @objc private func clickDone(){
        textField.resignFirstResponder()
    }
}

extension PickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return places.count
    }
}

extension PickerView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return places[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(places[row])
        button.setTitle(places[row], for: .normal)
    }
}
