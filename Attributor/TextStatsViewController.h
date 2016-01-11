//
//  TextStatsViewController.h
//  Attributor
//
//  Created by Bayteq on 11/1/16.
//  Copyright © 2016 Bayteq CiaLtda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextStatsViewController : UIViewController
@property (nonatomic,strong) NSAttributedString *textToAnalize;
-(void)setTextToAnalize:(NSAttributedString *)textToAnalize;

@end
