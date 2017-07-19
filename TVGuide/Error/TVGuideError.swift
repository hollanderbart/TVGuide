//
//  TVGuideError.swift
//  TVGuide
//
//  Created by Bart den Hollander on 19/07/2017.
//  Copyright © 2017 Bart den Hollander. All rights reserved.
//

import Foundation

struct TVGuideError: Error {
    
    var localizedDescription: String
    init(_ localizedDescription: String) {
        self.localizedDescription = localizedDescription
    }
}
