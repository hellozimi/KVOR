//
//  KVOR.h
//  kvor-example
//
//  Created by Simon Andersson on 2/23/13.
//  Copyright (c) 2013 hiddencode.me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KVORTaskBlock.h"

@interface KVOR : NSObject

+ (void)target:(id)target keyPath:(NSString *)keyPath task:(KVORObserverTaskBlock)block;
+ (void)target:(id)target keyPaths:(NSArray *)keyPaths task:(KVORObserverTaskBlock)block;

+ (void)removeAllObservers;
+ (void)removeObserverWithTarget:(id)target andKeyPath:(NSString *)keyPath;
+ (void)removeObserverWithTarget:(id)target andKeyPaths:(NSArray *)keyPaths;

@end
