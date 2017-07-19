//
//  TVGuideProgramChannel.swift
//  TVGuide
//
//  Created by Bart den Hollander on 19/07/2017.
//  Copyright © 2017 Bart den Hollander. All rights reserved.
//

import Foundation

public struct TVGuideProgramChannel: Decodable {
    public let db_id: String
    public let titel: String
    public let genre: String
    public let soort: String
    public let kijkwijzer: String?
    public let datum_start: String
    public let datum_end: String
    public let permalink: String
}
