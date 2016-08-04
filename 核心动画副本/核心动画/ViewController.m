//
//  ViewController.m
//  核心动画
//
//  Created by 刘超然 on 16/7/22.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  UIView *testView = [[UIView alloc] init];
  testView.frame = CGRectMake(37.5, 150, 300, 300);
  testView.backgroundColor = [UIColor greenColor];
  [self.view addSubview:testView];

  UIView *ra = [[UIView alloc] init];
  
  ra.frame = CGRectMake(0, 0, 30, 30);
    //ra.center = testView.center;

  ra.backgroundColor =
     [UIColor redColor];
  [testView addSubview:ra];
  
//组动画
    CAAnimationGroup * group =[[CAAnimationGroup alloc]init];
   
    //------------------------------------------------------------------------------------------------------
    //自转动画
    CABasicAnimation * bitch =[[CABasicAnimation alloc]init];
    
    bitch.keyPath =@"transform.rotation";
    
//    bitch.duration = 2;
    
    //累加
    bitch.byValue =@(M_PI * 2);
//    group.repeatCount = MAXFLOAT;
    
   //------------------------------------------------------------------------------------------------------
    
    //绕圆动画
  //做什么动画
  CAKeyframeAnimation *anim = [[CAKeyframeAnimation alloc] init];
  //怎么做
  anim.keyPath = @"position";
  //创建路径
  UIBezierPath *path =
      [UIBezierPath bezierPathWithArcCenter:CGPointMake(150,150)
                                     radius:100
                                 startAngle:0
                                   endAngle:2 * M_PI
                                  clockwise:1];
  //让属性沿着路径移动
  anim.path = path.CGPath;

//  anim.duration = 3;
    //循环次数
//    anim.repeatCount =MAXFLOAT;
    
    //------------------------------------------------------------------------------------------------------
    group.animations =@[anim,bitch];
    group.repeatCount = MAXFLOAT;
    group.duration = 5;
    [ra.layer addAnimation:group forKey:nil];
}



@end
