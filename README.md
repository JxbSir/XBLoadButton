# XBLoadButton
圆形按钮，执行时会有光环圈旋转

# 代码
#import "XBLoadingButton.h"

XBLoadingButton* btn = [[XBLoadingButton alloc] initWithFrame:CGRectMake(100, 200, 80, 80)];

    [btn setTitle:@"点击开始"];
    
    __weak typeof (btn) wBtn = btn;
    
    [btn addAction:^{
    
        [wBtn setTitle:@"正在加载"];
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
            sleep(3);
            
            dispatch_async(dispatch_get_main_queue(), ^{
            
                [wBtn setTitle:@"点击开始"];
                
                [wBtn stop];
                
            });
            
        });
        
    }];
    
    [self.view addSubview:btn];
    
    
## 样式图

![](https://github.com/JxbSir/JinSlideVC/blob/master/Demo/ad/slideview.gif)
