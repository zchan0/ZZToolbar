//
//  ZZToolbar.h
//  ZZToolbar
//
//  Created by Zchan on 15/6/15.
//  Copyright (c) 2015年 Zchan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZZToolbarDelegate <NSObject>

- (void)getWeather;
- (void)getLocation;
- (void)pickImages;
- (void)pickDateCreated;
- (void)selectTags;

@end

@interface ZZToolbar : UIView

@property (weak, nonatomic) IBOutlet UIButton *weatherButton;
@property (weak, nonatomic) IBOutlet UIButton *locationButton;
@property (weak, nonatomic) IBOutlet UIButton *cameraButton;
@property (weak, nonatomic) IBOutlet UIButton *timeButton;
@property (weak, nonatomic) IBOutlet UIButton *tagButton;
@property (strong, nonatomic) IBOutlet UIView *ZZToolbar;

@property (nonatomic, strong) NSDate *dateCreated;
@property (nonatomic) id<ZZToolbarDelegate> delegate;

- (void)addBadges:(UIButton *)onButton withNumber:(NSUInteger)number;
- (void)addImagesOnButton:(UIButton *)onButton withImage:(UIImage *)image;
- (void)addNumberOnButton:(UIButton *)onButton withNumber: (NSString *)number;

@end
