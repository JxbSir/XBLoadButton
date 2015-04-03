//
//  XBLoadingButton.h
//  XBLoadingButton
//
//  Created by Peter on 15/4/2.
//  Copyright (c) 2015年 Peter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XBLoadingButton : UIView
- (void)setTitle:(NSString*)title;
- (void)setTitleColor:(UIColor*)color;
- (void)setTitleFont:(UIFont*)font;
- (void)addAction:(void(^)(void))action;
- (void)stop;
@end
