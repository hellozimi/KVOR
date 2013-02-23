//
//  KVOR.m
//  kvor-example
//
//  Created by Simon Andersson on 2/23/13.
//  Copyright (c) 2013 hiddencode.me. All rights reserved.
//

#import "KVOR.h"
#import "KVORTaskObserver.h"

@interface KVOR ()
@property (nonatomic, strong) NSMutableArray *observers;

- (void)addObserver:(KVORTaskObserver *)observer;

@end

@implementation KVOR

uint KVORHashPointerForObserver(id object, NSArray *keyPaths) {
    return [[NSString stringWithFormat:@"%p.%@.%@", object, NSStringFromClass([object class]), [keyPaths componentsJoinedByString:@"."]] hash];
}

#pragma mark -

+ (void)target:(id)target keyPath:(NSString *)keyPath task:(KVORObserverTaskBlock)block {
    [self target:target keyPaths:@[keyPath] task:block];
}

+ (void)target:(id)target keyPaths:(NSArray *)keyPaths task:(KVORObserverTaskBlock)block {
    
    void *context = (void *)KVORHashPointerForObserver(target, keyPaths);
    
    for (NSString *keyPath in keyPaths) {
        KVORTaskObserver *observer = [KVORTaskObserver observer];
        observer.object = target;
        observer.context = context;
        observer.keyPath = keyPath;
        observer.block = block;
        
        [[KVOR sharedInstance] addObserver:observer];
    }
}

+ (void)removeAllObservers {
    NSMutableArray *observers = [KVOR sharedInstance].observers;
    [observers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        KVORTaskObserver *observer = obj;
        [observer.object removeObserver:[KVOR sharedInstance]];
    }];
    
    [observers removeAllObjects];
}

+ (void)removeObserverWithTarget:(id)target andKeyPath:(NSString *)keyPath {
    [self removeObserverWithTarget:target andKeyPaths:@[keyPath]];
}

+ (void)removeObserverWithTarget:(id)target andKeyPaths:(NSArray *)keyPaths {
    
    void *context = (void *)KVORHashPointerForObserver(target, keyPaths);
    
    for (NSString *keyPath in keyPaths) {
        [target removeObserver:[KVOR sharedInstance] forKeyPath:keyPath context:context];
        KVORTaskObserver *observer = [[KVOR sharedInstance] observerForContext:context];
        [[[KVOR sharedInstance] observers] removeObject:observer];
    }
}

#pragma mark -

+ (KVOR *)sharedInstance {
    static KVOR *KVOR_INSTANCE = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        KVOR_INSTANCE = [[KVOR alloc] init];
    });
    
    return KVOR_INSTANCE;
}

#pragma mark -

- (KVORTaskObserver *)observerForContext:(void *)context {
    for (KVORTaskObserver *observer in self.observers) {
        if (observer.context == context) {
            return observer;
        }
    }
    
    return nil;
}

- (void)addObserver:(KVORTaskObserver *)observer {
    
    if (!self.observers) {
        self.observers = [[NSMutableArray alloc] init];
    }
    
    [observer.object addObserver:self forKeyPath:observer.keyPath options:observer.options context:observer.context];
    
    [self.observers addObject:observer];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    for (KVORTaskObserver *observer in self.observers) {
        if (observer.context == context) {
            observer.block(keyPath, change);
        }
    }
}

@end
