//
//  KVORTaskObservee.h
//  kvor-example
//
//  Created by Simon Andersson on 2/23/13.
//  Copyright (c) 2013 hiddencode.me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KVORTaskBlock.h"

@interface KVORTaskObserver : NSObject

@property (nonatomic, strong) id object;
@property (nonatomic, strong) NSString *keyPath;
@property (nonatomic, assign) NSKeyValueObservingOptions options;
@property (nonatomic, assign) void *context;
@property (nonatomic, copy) KVORObserverTaskBlock block;

+ (KVORTaskObserver *)observer;

@end
