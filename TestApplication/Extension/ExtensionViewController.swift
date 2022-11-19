//
//  ExtensionUIViewC.swift
//  TestApplication
//
//  Created by Дима Губеня on 13.11.2022.
//

import UIKit

extension UIViewController {

    func addChild(_ child: UIViewController, toContainer container: UIView) {

        addChild(child)

        child.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        child.view.frame = container.bounds
        container.addSubview(child.view)

        child.didMove(toParent: self)
    }

    func removeChild(_ child: UIViewController) {

        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
}
