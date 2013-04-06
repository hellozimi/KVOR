//
//  KVOR.h
//  kvor-example
//
//  Created by Simon Andersson on 2/23/13.
//  Copyright (c) 2013 hiddencode.me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KVORConstants.h"

@interface KVOR : NSObject

/**
 * Adds a key-value observation with a single key path
 * 
 * @param target - The object which is changing values
 * @param keyPath - The key path you want changes for
 * @param block - The change block which is triggered on change
 *
 * @returns void
 */
+ (void)target:(id)target keyPath:(NSString *)keyPath task:(KVORObserverTaskBlock)block;

/**
 * Adds a key-value observation with a single key path
 *
 * @param target - The object which is changing values
 * @param keyPatha - An array with the key paths you want changes for
 * @param block - The change block which is triggered on change
 *
 * @returns void
 */
+ (void)target:(id)target keyPaths:(NSArray *)keyPaths task:(KVORObserverTaskBlock)block;

/**
 * Removes an already existing observer
 *
 * @param target - The object which is changing values
 * @param keyPath - The key path which you've been listening for changes
 *
 * @returns void
 */
+ (void)removeObserverWithTarget:(id)target andKeyPath:(NSString *)keyPath;

/**
 * Removes an already existing observer
 *
 * @param target - The object which is changing values
 * @param keyPaths - The key paths which you've been listening for changes
 *
 * @returns void
 */
+ (void)removeObserverWithTarget:(id)target andKeyPaths:(NSArray *)keyPaths;

/**
 * Removes all existing KVOR observers
 *
 * @returns void
 */
+ (void)removeAllObservers;

@end
