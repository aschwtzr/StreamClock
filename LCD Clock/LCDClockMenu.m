//
//  LCDClockMenu.m
//  LCD Clock
//
//  Created by Albert Schweitzer on 5/18/16.
//  Copyright © 2016 Albert Schweitzer. All rights reserved.
//

#import "LCDClockMenu.h"

@implementation LCDClockMenu 

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    self.menuBackgroundImage.image = [UIImage imageNamed:[defaults objectForKey:@"backgroundImageString"]];
    self.menuBackgroundImage.contentMode = UIViewContentModeScaleAspectFill;
    self.menuBackgroundImage.contentMode = UIViewContentModeCenter;
    _streamsArray = [[DAO sharedManager] streamsDAO];
    
    //sets the switches at their default state
        
        if ([defaults boolForKey:@"streamToggle"] == YES){
            [self.liveStreamToggle setOn:YES];
        }
        else [self.liveStreamToggle setOn:NO];
    
    
    [self pickerDataSelector];
    
    
    if ([defaults boolForKey:@"24HourFormat"] == YES){
        [self.clockFormatToggle setOn:YES];
    }
    else [self.clockFormatToggle setOn:NO];
    
    [self loadBackgroundImages];
    
    

}

-(void)pickerDataSelector{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    
    if ([defaults boolForKey:@"streamToggle"] == YES){
        
        NSArray *locationsArray = [_streamsArray valueForKey:@"name"];
        self.pickerData = locationsArray;
        NSArray *timeZones = [_streamsArray valueForKey:@"time zone"];
        self.timeOffset = timeZones;
        self.timeZonePicker.dataSource = self;
        self.timeZonePicker.delegate = self;
        [defaults setBool:YES forKey:@"hideBackgroundImage"];
        [defaults synchronize];

        
    }
    
    else {
        self.pickerData = [[NSArray alloc] initWithObjects: @"Chicago", @"Denver", @"Dubai", @"Hawaii", @"Hong Kong", @"Istanbul", @"London", @"Los Angeles", @"New York City", @"Paris", @"Santiago", @"Sao Paulo", @"Reset Time Zone", nil];
        NSString *timeZoneName = [[NSTimeZone localTimeZone] abbreviation];
        self.timeOffset = [[NSArray alloc] initWithObjects:@"CST", @"MDT", @"GST", @"HST", @"HKT", @"EET", @"BST", @"PST", @"EST", @"CET", @"CLT", @"BRT", timeZoneName,  nil];
        self.timeZonePicker.dataSource = self;
        self.timeZonePicker.delegate = self;
        [defaults setBool:NO forKey:@"hideBackgroundImage"];
        [defaults synchronize];

    }
    
}


- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (IBAction)setLiveStream:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ([self.liveStreamToggle isOn]) {
        [defaults setBool:YES forKey:@"streamToggle"];
        [defaults synchronize];
        [self pickerDataSelector];

    }
    else {
        [defaults setBool:NO forKey:@"streamToggle"];
        [defaults synchronize];
        [self pickerDataSelector];

    }

}


- (IBAction)HourFormat:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ([self.clockFormatToggle isOn]) {
    [defaults setBool:YES forKey:@"24HourFormat"];
    [defaults synchronize];
    }
    else {
    [defaults setBool:NO forKey:@"24HourFormat"];
    [defaults synchronize];
    }
}


- (IBAction)selectBackgroundImageSwipeUp:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.backgroundCounter = [defaults integerForKey:@"backgroundImageCounter"];
    self.backgroundCounter++;
    
    if (self.backgroundCounter >= self.backgroundImageArray.count){
        self.backgroundCounter = 0;
    }
    
    self.menuBackgroundImage.image = [UIImage imageNamed:[self.backgroundImageArray objectAtIndex:self.backgroundCounter]];
    self.menuBackgroundImage.contentMode = UIViewContentModeScaleAspectFit;
    [defaults setInteger:self.backgroundCounter forKey:@"backgroundImageCounter"];
    [defaults synchronize];

    
    
}

- (IBAction)selectBackgroundImageSwipeDown:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.backgroundCounter = [defaults integerForKey:@"backgroundImageCounter"];
    self.backgroundCounter--;
    
    if (self.backgroundCounter < 0){
        self.backgroundCounter = self.backgroundImageArray.count - 1;
    }
    
    self.menuBackgroundImage.image = [UIImage imageNamed:[self.backgroundImageArray objectAtIndex:self.backgroundCounter]];
    self.menuBackgroundImage.contentMode = UIViewContentModeScaleAspectFit;
    [defaults setInteger:self.backgroundCounter forKey:@"backgroundImageCounter"];
    [defaults setObject:[self.backgroundImageArray objectAtIndex:self.backgroundCounter] forKey:@"backgroundImageString"];
    [defaults synchronize];
    
    
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *timeZonePicked = [self.timeOffset objectAtIndex:[pickerView selectedRowInComponent:0]];
    
    
    [defaults setObject:timeZonePicked forKey:@"setTimeZone"];
    if ([self.liveStreamToggle isOn]) {
        NSArray *urls = [_streamsArray valueForKey:@"url"];
        NSString *videoStream = [urls objectAtIndex:[pickerView selectedRowInComponent:0]];
        [defaults setObject:videoStream forKey:@"videoStreamLocation"];
    }
        
    [defaults synchronize];
    
}

- (IBAction)setFontToGreenOne:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    [defaults setObject:@"074A73" forKey:@"numberColor"];
    [defaults synchronize];

    
}
- (IBAction)setFontToRed:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    [defaults setObject:@"960000" forKey:@"numberColor"];
    [defaults synchronize];

}
- (IBAction)setFontToBlue:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    [defaults setObject:@"437EF3" forKey:@"numberColor"];
    [defaults synchronize];

}
- (IBAction)setFontToGreenTwo:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    [defaults setObject:@"074A2F" forKey:@"numberColor"];
    [defaults synchronize];

}
- (IBAction)setFontToWhite:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    [defaults setObject:@"FFFFFF" forKey:@"numberColor"];
    [defaults synchronize];

    
}

-(void)loadBackgroundImages {
    
    self.backgroundImageArray = [[NSMutableArray alloc] init];
    [self.backgroundImageArray addObject:@"atlanta2x.png"];
    [self.backgroundImageArray addObject:@"kamogawa2x.png"];
    [self.backgroundImageArray addObject:@"sanfran2x.png"];
    [self.backgroundImageArray addObject:@"boston2x.png"];


}

-(long) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// The number of rows of data
- (long)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.pickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.pickerData[row];
}


@end

