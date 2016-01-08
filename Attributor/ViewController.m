//
//  ViewController.m
//  Attributor
//
//  Created by Bayteq on 8/1/16.
//  Copyright © 2016 Bayteq CiaLtda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextView *bodyText;
@property (strong, nonatomic) IBOutlet UILabel *headLineLabel;

@end

@implementation ViewController
- (IBAction)changeBodySelectedColorToMatchBackgroundOfBotton:(UIButton *)sender {
    [self.bodyText.textStorage addAttribute:NSForegroundColorAttributeName
                                      value:sender.backgroundColor
                                      range:self.bodyText.selectedRange];
}
- (IBAction)outlineBodySelection {
    [self.bodyText.textStorage addAttributes:@{NSStrokeWidthAttributeName: @-3,
                                               NSStrokeColorAttributeName:[UIColor blackColor]}
                                       range:self.bodyText.selectedRange];
}

- (IBAction)unoutlineBodySelection {
    [self.bodyText.textStorage removeAttribute:NSStrokeWidthAttributeName range:self.bodyText.selectedRange];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"hello, world!!");
    // Do any additional setup after loading the view, typically from a nib.
}



@end
