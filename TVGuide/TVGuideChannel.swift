//
//  Channel.swift
//  TVGids
//
//  Created by Bart den Hollander on 17/07/2017.
//  Copyright © 2017 Bart den Hollander. All rights reserved.
//

import Foundation

public typealias TVGuideChannelName = String
public typealias TVGuideId = String

public struct TVGuideChannel: Decodable {
    public let id: TVGuideId
    public let name: TVGuideChannelName
    public let name_short: String
}

