//
//  Channel.swift
//  TVGids
//
//  Created by Bart den Hollander on 17/07/2017.
//  Copyright © 2017 Bart den Hollander. All rights reserved.
//

import Foundation

public struct TVGuideChannel: Decodable {
    public let id: String
    public let name: String
    public let name_short: String
}

