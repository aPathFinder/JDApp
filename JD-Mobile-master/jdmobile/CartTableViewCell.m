//
//  CartTableViewCell.m
//  jdmobile
//
//  Created by SYETC02 on 15/6/25.
//  Copyright (c) 2015年 SYETC02. All rights reserved.
//

#import "CartTableViewCell.h"

@interface CartTableViewCell()<UITextFieldDelegate>{
    UIButton * _btn;
}

@end

@implementation CartTableViewCell


- (void)layoutSubviews{
    _cartActivity.layer.borderWidth=0.5f;
    _cartActivity.layer.borderColor=[UIColor grayColor].CGColor;
    _cartActivity.layer.cornerRadius=5;
    
    _cartNumber.delegate = self;
    int newNum = [_cartNumber.text intValue];
    if (newNum <= 1) {
        _btn.enabled = NO;
    }
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)subClick:(UIButton *)sender {
        sender.tag = 0;
        int newNum = [_cartNumber.text intValue] - 1;
        if (newNum > 0) {
            _cartNumber.text = [NSString stringWithFormat:@"%i", newNum];
           self.callBack([_cartNumber.text intValue]);
            if (newNum == 1) {
                sender.enabled = NO;
            }
        } else {
            sender.enabled = NO;
        }
    _btn = sender;
}

- (IBAction)addClick:(UIButton *)sender {
    
    int newNum = [_cartNumber.text intValue] + 1;
    if (newNum > 1) {
        _btn.enabled = YES;
    }
    _cartNumber.text = [NSString stringWithFormat:@"%i", newNum];
    
     self.callBack([_cartNumber.text intValue]);

}

#pragma makr - TextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    textField.inputAccessoryView = [self addToolbar];
    
    return YES;
}

- (UIToolbar *)addToolbar
{
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), 35)];
    toolbar.tintColor = [UIColor blueColor];
    toolbar.backgroundColor = [UIColor lightGrayColor];
    
    //上一步，下一步都是左侧的按钮，用空格隔开；
    UIBarButtonItem *cancleButton = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(tfResignFirstResponder)];
    //UIBarButtonItem *prevButton = [[UIBarButtonItem alloc] initWithTitle:@"上一步" style:UIBarButtonItemStylePlain target:self action:@selector(prevTextField)];
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *bar = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(tfResignFirstResponder)];
    bar.tintColor = [UIColor redColor];
    toolbar.items = @[cancleButton,space,bar];
    
    return toolbar;
}

- (void)tfResignFirstResponder{
    [_cartNumber endEditing:YES];
}




@end
