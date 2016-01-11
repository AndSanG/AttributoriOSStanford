//
//  TextStatsViewController.m
//  Attributor
//
//  Created by Bayteq on 11/1/16.
//  Copyright © 2016 Bayteq CiaLtda. All rights reserved.
//

#import "TextStatsViewController.h"

@interface TextStatsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *colorfullCharactersLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlineCharactersLabel;

@end

@implementation TextStatsViewController

-(void)setTextToAnalize:(NSAttributedString *)textToAnalize{
    _textToAnalize=textToAnalize;
    if (self.view.window) {
        [self updateUI];
    }
}
-(NSAttributedString*) characterWithAtributes:(NSString*)atributeName{
    NSMutableAttributedString * characters = [[NSMutableAttributedString alloc]init];
    NSUInteger index=0;
    while (index< [self.textToAnalize length]) {
        NSRange range;
        id value = [self.textToAnalize attribute:atributeName atIndex:index effectiveRange:&range];
        if (value) {
            [characters appendAttributedString:[self.textToAnalize attributedSubstringFromRange:range]];
            index =range.location+range.length;
        }else{
            index++;
        }
    }
    return characters;
}
-(void)updateUI{
    self.colorfullCharactersLabel.text=[NSString stringWithFormat:@"%lu colorful Characters", (unsigned long)[[self characterWithAtributes:NSForegroundColorAttributeName] length]];
    self.outlineCharactersLabel.text=[NSString stringWithFormat:@"%lu outlined Characters",[[self characterWithAtributes:NSStrokeWidthAttributeName] length]];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
