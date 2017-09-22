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
        moveScrollView(.up, for: keyboardHeight(for: notification))
    }
    
    public func keyboardWillHide(_ notification: Notification) {
        moveScrollView(.down, for: keyboardHeight(for: notification))
    }
    
    func moveScrollView(_ direction: ScrollViewMovingDirection, for offset: CGFloat) {
        var currentScrollViewFrame = movableScrollView.frame
        var validOffset = offset
        if direction == .down { validOffset = -offset }
        currentScrollViewFrame.size.height -= validOffset
    }
    
    private func keyboardHeight(for notification: Notification) -> CGFloat {
        guard let userInfo = notification.userInfo, let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue else { return 0 }
        let keyboardHeight = keyboardFrame.cgRectValue.height
        return keyboardHeight
    }
}

public enum ScrollViewMovingDirection {
    case up
    case down
}
