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
    static let PROGRAMS_API = "http://www.tvgids.nl/json/lists/programs.php?channels="
    
    public func requestChannel(_ channel: TVGuideChannelName, completionHandler: @escaping (Result<TVGuideChannel>) -> Void) {
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
        let task = URLSession.shared.dataTask(with: URL(string: TVGuide.CHANNELS_API)!) { (data, response, error) in
            
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
    
    public func requestProgram(of channelId: TVGuideId, completionHandler: @escaping (Result<[TVGuideProgramChannel]>) -> Void) {
        let task = URLSession.shared.dataTask(with: URL(string: TVGuide.PROGRAMS_API + channelId)!) { (data, response, error) in
            
            guard error == nil,
                let data = data,
                let rawJson = try? JSONDecoder().decode([String: [String: TVGuideProgramChannel]].self, from: data),
                let json = rawJson[channelId] else {
                    completionHandler(Result.error(error ?? TVGuideError("data is incorrect")))
                    return
            }
            var program: [TVGuideProgramChannel] = []
            for element in json {
                program.append(element.value)
            }
            
            completionHandler(Result.success(program))
        }
        task.resume()
    }
}
