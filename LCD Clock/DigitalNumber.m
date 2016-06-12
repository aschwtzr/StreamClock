//
//  DigitalNumber.m
//  LCD Clock
//
//  Created by Albert Schweitzer on 5/17/16.
//  Copyright © 2016 Albert Schweitzer. All rights reserved.
//

#import "DigitalNumber.h"

@implementation DigitalNumber
//@synthesize topLeft;
//@synthesize topRight;
//@synthesize topMiddle;
//@synthesize middle;
//@synthesize bottomLeft;
//@synthesize bottomRight;
//@synthesize bottomMiddle;

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"DigitalNumberObject" owner:self options:nil]objectAtIndex:0];
        view.frame = self.bounds;
        view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        view.backgroundColor = [UIColor clearColor];
        view.alpha = 1;
        
        [self addSubview:view];
    
    }
    return self;
    
    
}



//from Stackoverflow, converts a hex string to RGB
-(UIColor*)colorWithHexString:(NSString*)hex and:(float)alpha
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
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

-(void) setNumber:(NSInteger)time { //sets the number on the digital clock
    
    if (time == 1){
        [self displayNumberOne];
    }
    else if (time == 2){
        [self displayNumberTwo];
    }
    else if (time == 3){
        [self displayNumberThree];
    }
    else if (time == 4){
        [self displayNumberFour];
    }
    else if (time == 5){
        [self displayNumberFive];
    }
    else if (time == 6){
        [self displayNumberSix];
    }
    else if (time == 7){
        [self displayNumberSeven];
    }
    else if (time == 8){
        [self displayNumberEight];
    }
    else if (time == 9){
        [self displayNumberNine];
    }
    else if (time == 0){
        [self displayNumberZero];
    }
    else {
        self.backgroundColor = [UIColor redColor];
    }
    

    
    
}

//code below for each correspoding number

-(void) displayNumberOne {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [self.topLeft setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"] and:.15]];
    [self.topMiddle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:.15]];
    [self.topRight setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"] and:1]];
    [self.bottomRight setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    [self.bottomMiddle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:.15]];
    [self.bottomLeft setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:.15]];
    [self.middle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:.15]];

}

-(void) displayNumberTwo {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [self.topLeft setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"] and:.15]];
    [self.topMiddle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    [self.topRight setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"] and:1]];
    [self.bottomRight setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:.15]];
    [self.bottomMiddle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    [self.bottomLeft setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    [self.middle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    
}

-(void) displayNumberThree {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [self.topLeft setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"] and:.15]];
    [self.topMiddle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    [self.topRight setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"] and:1]];
    [self.bottomRight setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    [self.bottomMiddle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    [self.bottomLeft setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:.15]];
    [self.middle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    
}

-(void) displayNumberFour {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [self.topLeft setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"] and:1]];
    [self.topMiddle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:.15]];
    [self.topRight setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"] and:1]];
    [self.bottomRight setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    [self.bottomMiddle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:.15]];
    [self.bottomLeft setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:.15]];
    [self.middle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    
}

-(void) displayNumberFive {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [self.topLeft setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"] and:1]];
    [self.topMiddle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    [self.topRight setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"] and:.15]];
    [self.bottomRight setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    [self.bottomMiddle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    [self.bottomLeft setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:.15]];
    [self.middle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    
}

-(void) displayNumberSix {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [self.topLeft setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"] and:1]];
    [self.topMiddle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    [self.topRight setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"] and:.15]];
    [self.bottomRight setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    [self.bottomMiddle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    [self.bottomLeft setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    [self.middle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    
}

-(void) displayNumberSeven {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [self.topLeft setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"] and:.15]];
    [self.topMiddle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    [self.topRight setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"] and:1]];
    [self.bottomRight setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    [self.bottomMiddle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:.15]];
    [self.bottomLeft setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:.15]];
    [self.middle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:.15]];

    
}

-(void) displayNumberEight {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [self.topLeft setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"] and:1]];
    [self.topMiddle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    [self.topRight setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"] and:1]];
    [self.bottomRight setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    [self.bottomMiddle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    [self.bottomLeft setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    [self.middle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];

}

-(void) displayNumberNine {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [self.topLeft setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"] and:1]];
    [self.topMiddle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    [self.topRight setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"] and:1]];
    [self.bottomRight setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    [self.bottomMiddle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:.15]];
    [self.bottomLeft setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:.15]];
    [self.middle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    
}

-(void) displayNumberZero {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [self.topLeft setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"] and:1]];
    [self.topMiddle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    [self.topRight setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"] and:1]];
    [self.bottomRight setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    [self.bottomMiddle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    [self.bottomLeft setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:1]];
    [self.middle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]and:.15]];
    
}

// originally a separate function, has been incorporated into the display of each digit
//-(void) setNumberColor {
////    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
////    [defaults synchronize];
////    [self.topLeft setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]]];
////    [self.topRight setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]]];
////    [self.topMiddle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]]];
////    [self.middle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]]];
////    [self.bottomLeft setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]]];
////    [self.bottomRight setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]]];
////    [self.bottomMiddle setBackgroundColor: [self colorWithHexString:[defaults objectForKey:@"numberColor"]]];
//
//}
 
@end
