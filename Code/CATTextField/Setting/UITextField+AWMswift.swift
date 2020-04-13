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
    @objc (awm_backgroundColor:)
    public func awm_backgroundColor(_ color: UIColor) {
        
        backgroundColor = color
    }
    @objc (awm_font:)
    public func awm_font(_ font: UIFont) {
        
        self.font = font
    }
    @objc (awm_textColor:)
    public func awm_textColor(_ color: UIColor) {
        
        textColor = color
    }
    @objc (awm_textAlignment:)
    public func awm_textAlignment(_ alignment: NSTextAlignment) {
        
        textAlignment = alignment
    }
    @objc (awm_keyboardType:)
    public func awm_keyboardType(_ keyboardType: UIKeyboardType) {
        
        self.keyboardType = keyboardType
    }
    @objc (awm_clearButtonMode:)
    public func awm_clearButtonMode(_ clearButtonMode: UITextField.ViewMode) {
        
        self.clearButtonMode = clearButtonMode
        
    }
    @objc (awm_returnKeyType:)
    public func awm_returnKeyType(_ returnKeyType: UIReturnKeyType) {
        
        self.returnKeyType = returnKeyType
    }
    @objc (awm_rightViewMode:)
    public func awm_rightViewMode(_ rightViewMode: UITextField.ViewMode) {
        
        self.rightViewMode = rightViewMode
    }
    @objc (awm_leftViewMode:)
    public func awm_leftViewMode(_ leftViewMode: UITextField.ViewMode) {
        
        self.leftViewMode = leftViewMode
    }
    @objc (awm_leftView:)
    public func awm_leftView(_ leftView: UIView) {
        
        self.leftView = leftView
    }
    @objc (awm_rightView:)
    public func awm_rightView(_ rightView: UIView) {
        
        self.rightView = rightView
    }
}

public typealias AWMShouldReturn = () -> Bool

public typealias AWMShouldClear = () -> Bool

extension UITextField: UITextFieldDelegate {
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
    }
    
    fileprivate var shouldReturn: AWMShouldReturn! {
        set {
            
            objc_setAssociatedObject(self, "shouldReturn", newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            
            return objc_getAssociatedObject(self, "shouldReturn") as? AWMShouldReturn
        }
    }
    @objc (awm_shouldReturn:)
    public func awm_shouldReturn(_ shouldReturn: @escaping () -> Bool) {
        
        self.shouldReturn = shouldReturn
    }
    @objc (textFieldShouldReturn:)
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if shouldReturn == nil {
            
            return true
        }
        
        return shouldReturn!()
    }
    
    fileprivate var shouldClear: AWMShouldClear! {
        
        set {
            
            objc_setAssociatedObject(self, "shouldClear", newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            
            return objc_getAssociatedObject(self, "shouldClear") as? AWMShouldClear
        }
    }
    @objc (awm_shouldClear:)
    public func awm_shouldClear(_ shouldClear: @escaping () -> Bool) {
        
        self.shouldClear = shouldClear
    }
    
    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        
        if shouldClear == nil {
            
            return true
        }
        
        return shouldClear!()
    }
}

