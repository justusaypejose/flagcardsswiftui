//
//  AppHelper.swift
//  FlagsSwiftUI
//
//  Created by Justus Aype Jose on 07/07/23.
//

import Foundation
import SwiftUI

extension UIScreen {
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

let placeholderPathFlag = Bundle.main.path(forResource: "placeholder-flag", ofType: "jpg")
