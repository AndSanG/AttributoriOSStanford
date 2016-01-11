//
//  ViewController.m
//  Attributor
//
//  Created by Bayteq on 8/1/16.
//  Copyright © 2016 Bayteq CiaLtda. All rights reserved.
//

#import "ViewController.h"
#import "TextStatsViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextView *bodyText;
@property (strong, nonatomic) IBOutlet UILabel *headLineLabel;
@property (strong, nonatomic) IBOutlet UIButton *outlineButton;

@end

@implementation ViewController
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"AnalizeText"]) {
        if ([segue.destinationViewController isKindOfClass:[TextStatsViewController class]]) {
            TextStatsViewController *tsvc = (TextStatsViewController *)segue.destinationViewController;
            tsvc.textToAnalize= self.bodyText;
        }
    }
}
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


-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self usePreferredFonts];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(PreferredFontsChanged:)
                                                 name:UIContentSizeCategoryDidChangeNotification object:nil];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self
                                                name:UIContentSizeCategoryDidChangeNotification
                                                 object:nil];
}
-(void)PreferredFontsChanged: (NSNotification*)notification{
    
    [self usePreferredFonts];
    
}
-(void)usePreferredFonts{
    self.bodyText.font= [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.headLineLabel.font=[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    

}



@end
