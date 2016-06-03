//
//  SexViewController.h
//  jdmobile
//
//  Created by xcodejava on 16/6/1.
//  Copyright © 2016年 SYETC02. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SexViewController : UIViewController

@property (nonatomic,copy) void(^sexBlock) (NSString * sex);

@end
