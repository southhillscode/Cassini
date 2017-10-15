//
//  ImageViewController.swift
//  Cassini
//
//  Created by Rob on 1/22/17.
//  Copyright © 2017 Rob. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {

    var imageURL: NSURL? {
        didSet {
            image = nil
            if view.window != nil {
                fetchImage()
            }
            
        }
    }
    
    private func fetchImage() {
        if let url = imageURL {
            DispatchQueue.async(group: DispatchQueue(label: QOS_CLASS_USER_INITIATED),qos: 0) {
                let contentOfURL = NSData(contentsOf: url as URL)
                DispatchQueue.async.asynchronously() {
                    if let imageData =  contentsOfURL {
                      self.image = UIImage(data: imageData as Data)
                    }
                }
            }
        }
    }
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentSize = imageView.frame.size
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 1.0

        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    private var imageView = UIImageView()
    
    private var image: UIImage? {
        get {
            return imageView.image
        }
        
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil {
            fetchImage()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(imageView)
    }

}
