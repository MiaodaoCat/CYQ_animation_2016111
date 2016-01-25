//
//  ViewController.m
//  CYQ_animation_2016111
//
//  Created by XuYongfeng on 16/1/11.
//  Copyright © 2016年 XuYongfeng. All rights reserved.
//

#import "ViewController.h"

#define WIDTH 50
@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
{
    UITableView       *myTableView;
    CGFloat           oldOffsetY;    /**< 记录上一次的偏移量*/
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.title = @"fun";
#pragma mark -- tableview
        myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        myTableView.delegate = self;
        myTableView.dataSource = self;
        [self.view addSubview:myTableView];

}
-(void)initHeaderView{
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 50)];
    [headerView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:headerView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 
-(void)drawRect{
    CGSize size = [UIScreen mainScreen].bounds.size;
    CALayer * layer = [[CALayer alloc] init];
    layer.backgroundColor = [[UIColor colorWithRed:0.0 green:146.0/255 blue:1.0/255 alpha:1.0] CGColor];
    layer.position = CGPointMake(size.width/2.0, size.height/2.0);
    layer.bounds = CGRectMake(0.0, 0.0, WIDTH, WIDTH);
    layer.cornerRadius = WIDTH/2.0;
    layer.shadowColor = [UIColor grayColor].CGColor;
    layer.shadowOffset = CGSizeMake(2, 2);
    layer.shadowOpacity = .9;
    [self.view.layer addSublayer:layer];
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    CALayer * layer = self.view.layer.sublayers[0];
    CGFloat width = layer.bounds.size.width;
    if(width == WIDTH){
        width = WIDTH*4;
    }else{
        width = WIDTH;
    }
    layer.bounds = CGRectMake(0, 0, width, width);
    layer.position = [touch locationInView:self.view];
    layer.cornerRadius = width/2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = @"哇，好屌";
    return cell;
}
@end
