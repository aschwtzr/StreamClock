//
//  DAO.m
//  LCD Clock
//
//  Created by Albert Schweitzer on 7/21/16.
//  Copyright © 2016 Albert Schweitzer. All rights reserved.
//

#import "DAO.h"
static DAO *sharedMyManager = nil;

@implementation DAO

-(void)getStreamsFromArray:(NSArray *)streamsArray{
    _streamsDAO = streamsArray; 
}

+ (id)sharedManager {
    @synchronized(self) {
        if(sharedMyManager == nil)
            sharedMyManager = [[super allocWithZone:NULL] init];
    }
    return sharedMyManager;
}

+ (id)allocWithZone:(NSZone *)zone {
    return [[self sharedManager] retain];
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}
- (id)retain {
    return self;
}
- (unsigned)retainCount {
    return UINT_MAX; //denotes an object that cannot be released
}
- (oneway void)release {
    // never release
}
- (id)autorelease {
    return self;
}

@end
