//
//  ViewController.h
//  LCD Clock
//
//  Created by Albert Schweitzer on 5/17/16.
//  Copyright © 2016 Albert Schweitzer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DigitalNumber.h"
#import "DAO.h"
@import AVKit;
@import MediaPlayer;
@import Firebase; 


@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet DigitalNumber *firstDigitFromLeft;
@property (strong, nonatomic) IBOutlet DigitalNumber *secondDigitFromLeft;
@property (strong, nonatomic) IBOutlet DigitalNumber *thirdDigitFromLeft;
@property (strong, nonatomic) IBOutlet DigitalNumber *fourthDigitFromLeft;
@property (strong, nonatomic) IBOutlet UILabel *colonBetweenMainClock;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (strong, nonatomic) IBOutlet UIView *StreamViewPlayer;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *amLabel;
@property (strong, nonatomic) IBOutlet UILabel *pmLabel;
@property (strong, nonatomic) IBOutlet UILabel *secondsLabel;
@property (strong, nonatomic) IBOutlet UIButton *menuButton;
@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;
@property (strong, nonatomic) FIRDatabaseReference *ref;
@property (strong, nonatomic) NSDictionary *postDict;
@property (strong, nonatomic) NSArray *streams;
@property (strong, nonatomic) NSArray *timezones;
@property (strong, nonatomic) NSArray *urls;


-(void) loadUserDefaults;


@end

