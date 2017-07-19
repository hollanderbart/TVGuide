//
//  Result.swift
//  INGCommunication
//
//  Created by Tjeerd on 01/07/16.
//  Copyright © 2016 ING. All rights reserved.
//

import Foundation

public enum Result<Element> {
    case success(Element)
    case error(Error)
    
    // Allow optional transforms (chaining).
    public func map<TransformedElement>(_ transform: (Element) throws -> TransformedElement) rethrows -> Result<TransformedElement> {
        switch self {
        case .success(let val):
            return Result<TransformedElement>.success(try transform(val))
        case .error(let error):
            return Result<TransformedElement>.error(error)
        }
    }
}


