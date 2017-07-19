//
//  TVGids.swift
//  TVGids
//
//  Created by Bart den Hollander on 17/07/2017.
//  Copyright © 2017 Bart den Hollander. All rights reserved.
//

import Foundation

public class TVGuide {
    
    public init() { }
    
    static let CHANNELS_API = "http://www.tvgids.nl/json/lists/channels.php"
    static let CHANNEL_URL = URL(string: TVGuide.CHANNELS_API)
    
    public func requestChannel(_ channel: String, completionHandler: @escaping (Result<TVGuideChannel>) -> Void) {
        self.requestChannels { (result) in
            switch result {
            case .success(let response):
                let npo = response.first(where: { $0.name == channel })
                
                completionHandler(Result.success(npo!))
            case .error(let error):
                completionHandler(Result.error(error))
            }
        }
    }
    
    public func requestChannels(completionHandler: @escaping (Result<[TVGuideChannel]>) -> Void) {
        let task = URLSession.shared.dataTask(with: TVGuide.CHANNEL_URL!) { (data, response, error) in
            
            guard error == nil,
                let data = data,
                let json = try? JSONDecoder().decode([TVGuideChannel].self, from: data) else {
                    completionHandler(Result.error(error ?? TVGuideError("data is incorrect")))
                    return
            }
            completionHandler(Result.success(json))
        }
        task.resume()
    }
}
