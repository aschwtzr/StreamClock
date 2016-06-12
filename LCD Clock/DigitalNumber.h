//
//  DigitalNumber.h
//  LCD Clock
//
//  Created by Albert Schweitzer on 5/17/16.
//  Copyright © 2016 Albert Schweitzer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DigitalNumber : UIView
@property (strong, nonatomic) IBOutlet UIView *bottomMiddle;
@property (strong, nonatomic) IBOutlet UIView *middle;
@property (strong, nonatomic) IBOutlet UIView *topRight;
@property (strong, nonatomic) IBOutlet UIView *bottomLeft;
@property (strong, nonatomic) IBOutlet UIView *bottomRight;
@property (strong, nonatomic) IBOutlet UIView *topLeft;
@property (strong, nonatomic) IBOutlet UIView *topMiddle;
@property (strong, nonatomic) IBOutlet UIView *view;
//@property NSUserDefaults *defaults;
//-(void) setNumberColor; 
-(void) setNumber:(NSInteger)time;



@end
