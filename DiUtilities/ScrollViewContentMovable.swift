//
//  ScrollViewContentMovable.swift
//  DiUtilities
//
//  Created by Di on 22.09.2017.
//  Copyright © 2017 Di. All rights reserved.
//

import Foundation

public protocol ScrollViewContentMovableProtocol {
    var movableScrollView: UIScrollView { get set }
    func setupObservers()
}

public extension ScrollViewContentMovableProtocol where Self: UIViewController { 
    public func setupObservers() {
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillShow, object: nil, queue: nil) { [weak self] notification in
            self?.keyboardWillShow(notification)
        }
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillHide, object: nil, queue: nil) { [weak self] notification in
            self?.keyboardWillHide(notification)
        }
    }
    
    public func keyboardWillShow(_ notification: Notification) {
        
    }
    
    public func keyboardWillHide(_ notification: Notification) {
        
    }
}
