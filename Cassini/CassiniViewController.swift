//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Rob on 1/24/17.
//  Copyright © 2017 Rob. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController
{

    private struct Storyboard {
        static let ShowImageSeque = "Show Image"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
        {
            if segue.identifier == Storyboard.ShowImageSeque {
                if let ivc = (segue.destination.contentViewController as? ImageViewController){
                    let imageName = (sender as? UIButton)?.currentTitle
                    ivc.imageURL = DemoURL.NASAIMageNamed(imageName: imageName)
                    ivc.title = imageName
                }
            }
        }
}

extension UIViewController {
    var contentViewController: UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? self
        } else {
            return self
        }
    }
}
