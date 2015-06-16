//
//  ViewController.m
//  ZZToolbar
//
//  Created by Zchan on 15/6/15.
//  Copyright (c) 2015年 Zchan. All rights reserved.
//

#import "ZZEditViewController.h"
#import "HSDatePickerViewController.h"
#import "CTAssetsPickerController.h"
#import "ZZToolbar.h"

#define kDateFormat @"yyyy年M月d日"
#define kDayFormat  @"d日"

@interface ZZEditViewController ()<UITextViewDelegate, ZZToolbarDelegate, HSDatePickerViewControllerDelegate, CTAssetsPickerControllerDelegate>

@property (nonatomic, strong) NSDateFormatter *formatter;
@property (nonatomic, strong) ZZToolbar  *toolbar;
@property (nonatomic, strong) UITextView *editTextView;
@property (nonatomic, strong) HSDatePickerViewController *hsdpVC;

@property (nonatomic, strong) NSMutableArray *selectedImages;

@end

@implementation ZZEditViewController

- (void)loadView {
    self.view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //  formatter initialization
    _formatter = [[NSDateFormatter alloc]init];
    _formatter.dateFormat = kDateFormat;
    
    //  hsdpVC initialization
    self.hsdpVC = [HSDatePickerViewController new];
    self.hsdpVC.delegate = self;
    
    [self customNaviBar];
    [self customTextView];
}

- (void)viewWillAppear:(BOOL)animated {
    [self registerForKeyboardNotifications];
    [self.editTextView becomeFirstResponder];
    
    if (_selectedImages.count > 0) {
        ALAsset *asset = [self.selectedImages firstObject];
        UIImage *image = [self getfullResolutionImage:asset];
        [self.toolbar addImagesOnButton:self.toolbar.cameraButton withImage:image];
        [self.toolbar addBadges:self.toolbar.cameraButton withNumber:_selectedImages.count];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Views

- (void)customNaviBar {
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(Cancel:)];
    cancelItem.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = cancelItem;
    UIBarButtonItem *saveItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(Save:)];
    saveItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = saveItem;
    self.navigationItem.title = [_formatter stringFromDate:[NSDate date]];    
}

- (void)customTextView {
    CGFloat width = self.view.frame.size.width;
    
    self.editTextView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, width, 170)];
    self.editTextView.delegate = self;
    self.editTextView.scrollEnabled = YES;
    
    //Appearence
    [self.editTextView setFont:[UIFont systemFontOfSize:18.0]];
    
    //Toolbar
    self.toolbar = [[ZZToolbar alloc]init];
    self.toolbar.delegate = self;
    self.editTextView.inputAccessoryView = self.toolbar.ZZToolbar;
    
    [self.view addSubview:self.editTextView];
}

#pragma mark - IBActions

- (IBAction)Save:(id)sender {
    
}

- (IBAction)Cancel:(id)sender {
    
}

#pragma mark - Delegate

- (void)getWeather {
    
}

- (void)getLocation {
    [self.toolbar.locationButton setBackgroundImage:[UIImage imageNamed:@"located"] forState:UIControlStateNormal];
}

- (void)pickImages {
    
    if (!_selectedImages)
        _selectedImages = [[NSMutableArray alloc]init];
    
    CTAssetsPickerController *picker = [[CTAssetsPickerController alloc] init];
    picker.delegate = self;
    picker.selectedAssets       = [NSMutableArray arrayWithArray:_selectedImages];
    // Set navigation bar's tint color
    picker.childNavigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)pickDateCreated {
    self.toolbar.timeButton.tag = 1;
    [self presentViewController:self.hsdpVC animated:YES completion:nil];
}

- (void)selectTags {
    
}

#pragma mark - Camera

- (void)assetsPickerController:(CTAssetsPickerController *)picker didFinishPickingAssets:(NSArray *)assets {
    [picker.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    self.selectedImages = [NSMutableArray arrayWithArray:assets];
}

- (BOOL)assetsPickerController:(CTAssetsPickerController *)picker isDefaultAssetsGroup:(ALAssetsGroup *)group
{
    // Set All Photos as default album and it will be shown initially.
    return ([[group valueForProperty:ALAssetsGroupPropertyType] integerValue] == ALAssetsGroupSavedPhotos);
}

#pragma mark - Keyboard

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardFrameDidChange:)
                                                 name:UIKeyboardWillChangeFrameNotification
                                               object:nil];
    
}

//  Dynamiclly change editTextView height
- (void)keyboardFrameDidChange:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your app might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    self.editTextView.frame = aRect;
    
}

// Scroll UITextView
- (void)textViewDidChange:(UITextView *)textView {
    CGRect line = [textView caretRectForPosition:
                   textView.selectedTextRange.start];
    CGFloat overflow = line.origin.y + line.size.height
    - ( textView.contentOffset.y + textView.bounds.size.height
       - textView.contentInset.bottom - textView.contentInset.top );
    if ( overflow > 0 ) {
        // We are at the bottom of the visible text and introduced a line feed, scroll down (iOS 7 does not do it)
        // Scroll caret to visible area
        CGPoint offset = textView.contentOffset;
        offset.y += overflow + 7; // leave 7 pixels margin
        // Cannot animate with setContentOffset:animated: or caret will not appear
        [UIView animateWithDuration:.2 animations:^{
            [textView setContentOffset:offset];
        }];
    }
}

#pragma mark - Private Methods

- (void)hsDatePickerPickedDate:(NSDate *)date {
    if (self.toolbar.timeButton.tag) {
        self.toolbar.dateCreated = date;
        self.toolbar.timeButton.tag = 0;
        self.navigationItem.title = [_formatter stringFromDate:date];
        _formatter.dateFormat = kDayFormat;
        [self.toolbar addNumberOnButton:self.toolbar.timeButton withNumber:[_formatter stringFromDate:self.toolbar.dateCreated]];
        _formatter.dateFormat = kDateFormat;

    }

}

- (UIImage *)getfullResolutionImage:(ALAsset *)asset {
    ALAssetRepresentation *representation = [asset defaultRepresentation];
    
    UIImage *fullResolutionImage =
    [UIImage imageWithCGImage:representation.fullResolutionImage
                        scale:1.0f
                  orientation:(UIImageOrientation)representation.orientation];
    
    return fullResolutionImage;
}


@end
