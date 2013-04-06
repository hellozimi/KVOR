//
//  KVORTaskBlock.h
//  kvor-example
//
//  Created by Simon Andersson on 2/23/13.
//  Copyright (c) 2013 hiddencode.me. All rights reserved.
//

#ifndef kvor_example_KVORConstants_h
#define kvor_example_KVORConstants_h

static inline uint KVORHashPointerForObserver(id object, NSString *keyPath) {
    return [[NSString stringWithFormat:@"%p.%@.%@", object, NSStringFromClass([object class]), keyPath] hash];
}

typedef void(^KVORObserverTaskBlock)(NSString *keyPath, NSDictionary *change);

#endif
