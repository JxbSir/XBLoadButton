//
//  XBLoadingButton.m
//  XBLoadingButton
//
//  Created by Peter on 15/4/2.
//  Copyright (c) 2015年 Peter. All rights reserved.
//

#import "XBLoadingButton.h"

#define staticColor     [UIColor colorWithRed:83/255. green:175/255. blue:132/255. alpha:1]
#define loadingColor    [UIColor colorWithRed:111/255. green:127/255. blue:171/255. alpha:1]

@interface XBLoadingButton()
{
    dispatch_block_t    _myblock;
    UIView              *vTap;
    UIImageView*        imgLoad;
    UILabel*            lblTitle;
}
@end

@implementation XBLoadingButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        vTap = [[UIView alloc] initWithFrame:CGRectMake(7, 7, frame.size.width - 14, frame.size.height - 14)];
        [vTap setBackgroundColor:staticColor];
        vTap.layer.cornerRadius = (frame.size.height - 14) / 2;
        vTap.layer.masksToBounds = YES;
        [self addSubview:vTap];
        
        imgLoad = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        imgLoad.hidden = YES;
        imgLoad.image = [UIImage imageNamed:@"loading1"];
        [self addSubview:imgLoad];
        
        lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        lblTitle.font = [UIFont systemFontOfSize:13];
        lblTitle.textColor = [UIColor whiteColor];
        lblTitle.textAlignment = NSTextAlignmentCenter;
        lblTitle.userInteractionEnabled = NO;
        [self addSubview:lblTitle];
        
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doAction)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)setTitle:(NSString*)title
{
    lblTitle.text = title;
}

- (void)setTitleColor:(UIColor*)color
{
    lblTitle.textColor = color;
}

- (void)setTitleFont:(UIFont*)font
{
    lblTitle.font = font;
}

- (void)addAction:(void(^)(void))action
{
    _myblock = action;
}

- (void)doAction
{
    [self start];
    if(_myblock != NULL)
        _myblock();
}

- (void)start
{
    imgLoad.hidden = NO;
    vTap.backgroundColor = loadingColor;
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotateAnimation.repeatCount = INFINITY;
    rotateAnimation.byValue = @(M_PI*2);
    rotateAnimation.duration = 1.5;
    [imgLoad.layer addAnimation:rotateAnimation forKey:@"rotateAnimation"];
}

- (void)stop
{
    vTap.backgroundColor = staticColor;
    [imgLoad.layer removeAllAnimations];
    imgLoad.hidden = YES;
}

@end
