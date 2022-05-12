//
//  MutatingCreatable.swift
//  
//
//  Created by Oskari Rauta on 12.05.22.
//

import Foundation

public protocol MutatingCreatable {
    init()
}

extension MutatingCreatable {
    
    public static func create(_ creatorFunc: (inout Self) -> Void) -> Self {
        var retVal = self.init()
        creatorFunc(&retVal)
        return retVal
    }
    
    public func properties(_ modifyFunc: (inout Self) -> Void) -> Self {
        var retVal = self
        modifyFunc(&retVal)
        return retVal
    }
    
}
