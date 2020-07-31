//
//  UIViewExtensions.swift
//  branchbit-ios
//
//  Created by Hugo on 30/07/20.
//  Copyright © 2020 Elektra. All rights reserved.
//

import UIKit

extension UIView{
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
        
    }

}
extension Bool {
    static func ^ (left: Bool, right: Bool) -> Bool {
        return left != right
    }
}
