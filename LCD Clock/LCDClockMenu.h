//
//  LCDClockMenu.h
//  LCD Clock
//
//  Created by Albert Schweitzer on 5/18/16.
//  Copyright © 2016 Albert Schweitzer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCDClockMenu : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> 

@property (strong, nonatomic) IBOutlet UISwitch *clockFormatToggle;
@property (strong, nonatomic) IBOutlet UIPickerView *timeZonePicker;
@property NSTimeZone *timeZone;
@property (strong, nonatomic) IBOutlet UIImageView *menuBackgroundImage;
@property (strong, nonatomic) NSMutableArray *backgroundImageArray;
@property long backgroundCounter;
@property NSArray *pickerData;
@property NSArray *timeOffset;
@property NSString *timeZonePicked;

@end
