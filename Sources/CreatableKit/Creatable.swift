//
//  Creatable.swift
//  
//
//  Created by Oskari Rauta on 11.05.22.
//

import Foundation

extension NSObject: Creatable {}

public protocol Creatable {
    init()
}

extension Creatable {
    
    public static func create(_ creatorFunc: (Self) -> Void) -> Self {
        let retval = self.init()
        creatorFunc(retval)
        return retval
    }
    
    public func properties(_ modifyFunc: (Self) -> Void) -> Self {
        let retVal = self
        modifyFunc(retVal)
        return retVal
    }
}

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
