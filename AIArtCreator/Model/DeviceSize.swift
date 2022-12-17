//
//  DeviceSize.swift
//  AIArtCreator
//
//  Created by Recep Akkoyun on 10.11.2022.
//

import Foundation
import UIKit

var screenWidth = CGFloat()
var screenHeight = CGFloat()

func setDefaultSize(view: UIView) {
    screenWidth = view.bounds.width
    screenHeight = view.bounds.height
}
