//
//  BirthSlectSheet.h
//  jdmobile
//
//  Created by xcodejava on 16/6/1.
//  Copyright © 2016年 SYETC02. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BirthSlectSheet : UIActionSheet

@property (nonatomic,copy) void (^GetSelectDate)(NSString * dataStr);

@property (nonatomic,strong) NSString * selectDate;

@end
