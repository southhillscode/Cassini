//
//  DemoURL.swift
//  Cassini
//
//  Created by Rob on 1/22/17.
//  Copyright © 2017 Rob. All rights reserved.
//

import Foundation

struct DemoURL {
    static let Stanford = "http://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg"
    
    static let NASA = [
        "Cassini" : "http://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg",
        "Earth" : "http://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg",
        "Saturn" : "http://www.nasa.gove/sites/default/files/saturn_collage.jpg"
    ]
    
    static func NASAIMageNamed(imageName: String?) -> NSURL? {
        if let urlstring = NASA[imageName ?? ""] {
            return NSURL(string: urlstring)
        } else {
            return nil
        }
    }
}
