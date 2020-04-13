//
//  UITextField+WL.swift
//  TSTFKit_Swift
//
//  Created by three stone 王 on 2018/11/17.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    @objc (cat_backgroundColor:)
    public func cat_backgroundColor(_ color: UIColor) {
        
        backgroundColor = color
    }
    @objc (cat_font:)
    public func cat_font(_ font: UIFont) {
        
        self.font = font
    }
    @objc (cat_textColor:)
    public func cat_textColor(_ color: UIColor) {
        
        textColor = color
    }
    @objc (cat_textAlignment:)
    public func cat_textAlignment(_ alignment: NSTextAlignment) {
        
        textAlignment = alignment
    }
    @objc (cat_keyboardType:)
    public func cat_keyboardType(_ keyboardType: UIKeyboardType) {
        
        self.keyboardType = keyboardType
    }
    @objc (cat_clearButtonMode:)
    public func cat_clearButtonMode(_ clearButtonMode: UITextField.ViewMode) {
        
        self.clearButtonMode = clearButtonMode
        
    }
    @objc (cat_returnKeyType:)
    public func cat_returnKeyType(_ returnKeyType: UIReturnKeyType) {
        
        self.returnKeyType = returnKeyType
    }
    @objc (cat_rightViewMode:)
    public func cat_rightViewMode(_ rightViewMode: UITextField.ViewMode) {
        
        self.rightViewMode = rightViewMode
    }
    @objc (cat_leftViewMode:)
    public func cat_leftViewMode(_ leftViewMode: UITextField.ViewMode) {
        
        self.leftViewMode = leftViewMode
    }
    @objc (cat_leftView:)
    public func cat_leftView(_ leftView: UIView) {
        
        self.leftView = leftView
    }
    @objc (cat_rightView:)
    public func cat_rightView(_ rightView: UIView) {
        
        self.rightView = rightView
    }
}

public typealias CATShouldReturn = () -> Bool

public typealias CATShouldClear = () -> Bool

extension UITextField: UITextFieldDelegate {
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
    }
    
    fileprivate var shouldReturn: CATShouldReturn! {
        set {
            
            objc_setAssociatedObject(self, "shouldReturn", newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            
            return objc_getAssociatedObject(self, "shouldReturn") as? CATShouldReturn
        }
    }
    @objc (cat_shouldReturn:)
    public func cat_shouldReturn(_ shouldReturn: @escaping () -> Bool) {
        
        self.shouldReturn = shouldReturn
    }
    @objc (textFieldShouldReturn:)
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if shouldReturn == nil {
            
            return true
        }
        
        return shouldReturn!()
    }
    
    fileprivate var shouldClear: CATShouldClear! {
        
        set {
            
            objc_setAssociatedObject(self, "shouldClear", newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            
            return objc_getAssociatedObject(self, "shouldClear") as? CATShouldClear
        }
    }
    @objc (cat_shouldClear:)
    public func cat_shouldClear(_ shouldClear: @escaping () -> Bool) {
        
        self.shouldClear = shouldClear
    }
    
    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        
        if shouldClear == nil {
            
            return true
        }
        
        return shouldClear!()
    }
}

