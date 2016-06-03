//
//  SexViewController.m
//  jdmobile
//
//  Created by xcodejava on 16/6/1.
//  Copyright © 2016年 SYETC02. All rights reserved.
//

#import "SexViewController.h"

@interface SexViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView * _tabelView;
}

@property (nonatomic,strong) NSIndexPath * lastIndexPath;

@end

@implementation SexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tabelView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tabelView.delegate = self;
    _tabelView.dataSource = self;
    _tabelView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:_tabelView];
    
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"sexCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"sexCell"];
    }
    
    if (indexPath.section == 0) {
        cell.textLabel.text = @[@"男",@"女"][indexPath.row];
    }
    
    //默认选中男；
    NSIndexPath * defaultIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self tableView:_tabelView didSelectRowAtIndexPath:defaultIndexPath];

    if (indexPath.row == 0) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //当前cell.row
    NSInteger newRow = [indexPath row];
    //记录上次cell.row
    NSInteger oldRow = (self.lastIndexPath != nil) ? [self.lastIndexPath row] : 0;
    
    if (newRow != oldRow) {
        //选中cell
        UITableViewCell * newCell = [tableView cellForRowAtIndexPath:indexPath];
        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        //取消上次选中cell
        UITableViewCell * oldCell = [tableView cellForRowAtIndexPath:self.lastIndexPath];
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        //*
        self.lastIndexPath = [indexPath copy];
    }
    self.lastIndexPath = indexPath;
    
    if (indexPath.row == 1) {
        self.sexBlock(@"女");
    }else if (indexPath.row == 0){
        self.sexBlock(@"男");
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
