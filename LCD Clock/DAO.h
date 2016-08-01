//
//  DAO.h
//  LCD Clock
//
//  Created by Albert Schweitzer on 7/21/16.
//  Copyright © 2016 Albert Schweitzer. All rights reserved.
//

#import <Foundation/Foundation.h>
@import Firebase;

@interface DAO : NSObject
@property (strong, nonatomic) FIRDatabaseReference *ref;
@property (strong, nonatomic) NSArray *streamsDAO;

+ (id)sharedManager;
-(void)getStreamsFromArray:(NSArray *)streamsArray;

@end
