//
//  KVORTaskObservee.m
//  kvor-example
//
//  Created by Simon Andersson on 2/23/13.
//  Copyright (c) 2013 hiddencode.me. All rights reserved.
//

#import "KVORTaskObserver.h"
#import "KVORConstants.h"

@implementation KVORTaskObserver

+ (KVORTaskObserver *)observer {
    return [[[self class] alloc] init];
}

- (BOOL)isEqual:(id)object {
    return [object isKindOfClass:[KVORTaskObserver class]] ? self.context == (void *)KVORHashPointerForObserver(object, [object keyPath]) : NO;
}

@end
