//
//  ScrollViewContentMovable.swift
//  DiUtilities
//
//  Created by Di on 22.09.2017.
//  Copyright © 2017 Di. All rights reserved.
//

import Foundation

public protocol ScrollViewContentMovableProtocol {
    var movableScrollView: UIScrollView? { get set }
    func setupScrollViewContentMovableProtocol(with scrollView: UIScrollView)
}

public extension ScrollViewContentMovableProtocol where Self: UIViewController {
    mutating func setupScrollViewContentMovableProtocol(with scrollView: UIScrollView) {
        movableScrollView = scrollView
    }
}
