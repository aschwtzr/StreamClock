//
//  ViewController.m
//  LCD Clock
//
//  Created by Albert Schweitzer on 5/17/16.
//  Copyright © 2016 Albert Schweitzer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize firstDigitFromLeft;
@synthesize secondDigitFromLeft;
@synthesize thirdDigitFromLeft;
@synthesize fourthDigitFromLeft;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    //creates default user object, do we need to declare this again if it's in the header file?
    self.backgroundImage.image = [UIImage imageNamed:[defaults objectForKey:@"backgroundImageString"]];
    self.backgroundImage.contentMode = UIViewContentModeScaleAspectFill;
    self.backgroundImage.contentMode = UIViewContentModeCenter;


    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeStyle = NSDateFormatterLongStyle; // date object
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    NSRunLoop *runner = [NSRunLoop currentRunLoop];
    [runner addTimer:timer forMode: NSDefaultRunLoopMode]; //timer for the clock
    
    NSTimer *blinkColonTimer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(blinkColon) userInfo:nil repeats:YES];
    NSRunLoop *blinkRunner = [NSRunLoop currentRunLoop];
    [blinkRunner addTimer:blinkColonTimer forMode: NSDefaultRunLoopMode]; //timer to blink the colon, currently not working

    
    [self loadUserDefaults];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)loadUserDefaults{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    
    self.dateLabel.textColor = [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1];

}

-(void) updateTime{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    
    //calendar and time block
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
//    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
//    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:[defaults objectForKey:@"setTimeZone"]]];
    NSDate *currentDate = [NSDate date];
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] dictionaryRepresentation]);

//    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    
    NSCalendar *calendar = [[NSCalendar currentCalendar] initWithCalendarIdentifier:NSGregorianCalendar];
    [calendar setTimeZone:[NSTimeZone timeZoneWithAbbreviation:[defaults objectForKey:@"setTimeZone"]]];
    NSDateComponents *components = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:currentDate];

    NSInteger hourInt = [components hour];
    NSInteger minuteInt = [components minute];
//    NSInteger secondsInt = [components second];
//    NSLocale *posix = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
//    [dateFormatter setLocale:posix];
//    we're setting the correct time zone above'
    [dateFormatter setDateFormat:@"EEEE MMMM d"];
    NSString *dateStringForLabel = [dateFormatter stringFromDate:currentDate];
    
    self.dateLabel.text = [NSString stringWithFormat:@"%@", dateStringForLabel];
    //keeping the colon color function withing the updateTime method allows it to blink in conjunction with the timer turning it off
    self.colonBetweenMainClock.textColor = [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1];

    //calculating the 12 hour format number
    if ([defaults boolForKey:@"24HourFormat"] != YES){
        if (hourInt < 12){
            self.pmLabel.textColor = [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:.15];
            self.amLabel.textColor = [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1];
        }
        
        else {
            self.pmLabel.textColor = [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1];
            self.amLabel.textColor = [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:.15];
            // if the time is before noon, subtract 12 and switch on the PM label
            
        }
        
        if (hourInt > 12){
        hourInt = (hourInt - 12);
        [firstDigitFromLeft setNumber:(hourInt/10)];
        [secondDigitFromLeft setNumber:(hourInt%10)];
        [thirdDigitFromLeft setNumber:(minuteInt/10)];
        [fourthDigitFromLeft setNumber:(minuteInt%10)];
        }
        else {
        [firstDigitFromLeft setNumber:(hourInt/10)];
        [secondDigitFromLeft setNumber:(hourInt%10)];
        [thirdDigitFromLeft setNumber:(minuteInt/10)];
        [fourthDigitFromLeft setNumber:(minuteInt%10)];

        }
        
    }
    
    //processing the 24 hour format number
    else {
        self.pmLabel.textColor = [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:.15];
        self.amLabel.textColor = [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:.15];
        [firstDigitFromLeft setNumber:(hourInt/10)];
        [secondDigitFromLeft setNumber:(hourInt%10)];
        [thirdDigitFromLeft setNumber:(minuteInt/10)];
        [fourthDigitFromLeft setNumber:(minuteInt%10)];
    }
    

    
}
- (IBAction)showMenuButton:(id)sender {
    self.menuButton.hidden = NO;
}

-(void)blinkColon;
{
    self.colonBetweenMainClock.textColor = [UIColor clearColor];
    self.colonBetweenMainClock.textColor = [UIColor clearColor];
}

-(UIColor*)colorWithHexString:(NSString*)hex and:(float)alpha
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor whiteColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor whiteColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
}

-(void)displayLiveStreamVideo {
    
    NSDictionary *liveStreamURLDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                             @"http://www.earthcam.com/usa/illinois/chicago/field/?cam=fieldmuseum",@"Chicago",
                                             @"",@"Denver",
                                             @"",@"Dubai",
                                             @"",@"Hawaii",
                                             @"",@"Hong Kong",
                                             @"",@"Istanbul",
                                             @"",@"London",
                                             @"",@"Los Angeles",
                                             @"",@"New York City",
                                             @"", @"Paris",
                                             @"", @"Santiago",
                                             @"", @"Sao Paulo",
                                             nil];

    
}

@end
