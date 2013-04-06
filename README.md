#KVOR

KVOR is a block based wrapper around [KVO](https://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/KeyValueObserving/KeyValueObserving.html). It's really easy to use and it supports multiple key paths per block. Check the examples below to get started.

### Methods
Add observer

```
+ (void)target:(id)target keyPath:(NSString *)keyPath task:(KVORObserverTaskBlock)block;
+ (void)target:(id)target keyPaths:(NSArray *)keyPaths task:(KVORObserverTaskBlock)block;
```

Remove observer

```
+ (void)removeObserverWithTarget:(id)target andKeyPath:(NSString *)keyPath;
+ (void)removeObserverWithTarget:(id)target andKeyPaths:(NSArray *)keyPaths;
+ (void)removeAllObservers;
```
---


### Example

Basic value listening

```objc

// Start listening
__block typeof(self) weakSelf = self;
[KVOR target:self.scrollView
     keyPath:@"contentOffset"
        task:^(NSString *keyPath, NSDictionary *change) {
            if ([keyPath isEqualToString:@"contentOffset"]) {
                NSLog(@"Offset: %@", NSStringFromCGPoint([weakSelf.scrollView contentOffset]));
            }
            
        }];

```

You're also able to listen on multiple keyPaths in the same block.

```objc

// Start listening
__block typeof(self) weakSelf = self;
[KVOR target:self.scrollView
    keyPaths:@[@"contentOffset", @"contentSize"]
        task:^(NSString *keyPath, NSDictionary *change) {
            if ([keyPath isEqualToString:@"contentOffset"]) {
                NSLog(@"Offset: %@", NSStringFromCGPoint([weakSelf.scrollView contentOffset]));
            }
            else if ([keyPath isEqualToString:@"contentSize"]) {
                NSLog(@"Size: %@", NSStringFromCGSize([weakSelf.scrollView contentSize]));
            }
        }];

```