//
//  ZZToolbar.m
//  ZZToolbar
//
//  Created by Zchan on 15/6/15.
//  Copyright (c) 2015年 Zchan. All rights reserved.
//

#import "ZZToolbar.h"

@implementation ZZToolbar

- (void)setupViews {
    NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"ZZToolbar" owner:self options:nil];
    self.ZZToolbar = [subviewArray objectAtIndex:0];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self setupViews];
    }
    
    return self;
}

- (void)addBadges:(UIButton *)onButton withNumber:(NSUInteger)number {
    CGRect rect = onButton.bounds;
    CGFloat x   = rect.origin.x;
    CGFloat y   = rect.origin.y;
    CGFloat width = rect.size.width;
    CGFloat buttonX = x + width - 10;
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(buttonX, y-10, 20, 20)];
    [button setTitle:[NSString stringWithFormat:@"%d", (int)number] forState:UIControlStateNormal];
    [button setTintColor:[UIColor whiteColor]];
    [button setBackgroundImage:[UIImage imageNamed:@"badges"] forState:UIControlStateNormal];
    [onButton addSubview:button];
}

- (void)addNumberOnButton:(UIButton *)onButton withNumber:(NSString *)number {
    [onButton setBackgroundImage:[UIImage imageNamed:@"blankbg"] forState:UIControlStateNormal];
    [onButton setTintColor:[UIColor grayColor]];
    [onButton setTitle:number forState:UIControlStateNormal];
}

- (void)addImagesOnButton:(UIButton *)onButton withImage:(UIImage *)image {
    [onButton setBackgroundImage:image forState:UIControlStateNormal];
}

- (IBAction)weatherButtonTouched:(id)sender {
    if (!_delegate) {
        NSLog(@"delegate is nil");
    } else {
        [_delegate getWeather];
    }
}

- (IBAction)locationButtonTouched:(id)sender {
    if (!_delegate) {
        NSLog(@"delegate is nil");
    } else {
        [_delegate getLocation];
    }
}

- (IBAction)cameraButtonTouched:(id)sender {
    if (!_delegate) {
        NSLog(@"delegate is nil");
    } else {
        [_delegate pickImages];
    }
}

- (IBAction)dateButtonTouched:(id)sender {
    if (!_delegate) {
        NSLog(@"delegate is nil");
    } else {
        [_delegate pickDateCreated];
    }
}

- (IBAction)tagButtonTouched:(id)sender {
    if (!_delegate) {
        NSLog(@"delegate is nil");
    } else {
        [_delegate selectTags];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
