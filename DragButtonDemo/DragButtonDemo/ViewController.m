//
//  ViewController.m
//  DragButtonDemo
//
//  Created by zhang zhiyu on 13-8-23.
//  Copyright (c) 2013年 York. All rights reserved.
//

#import "ViewController.h"
#import "DragButton.h"

@interface ViewController ()
- (void)buttonPress:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    DragButton *bt_drag = [[DragButton alloc]initWithFrame:CGRectMake(20, 20, 64, 64)];
    
//Test1 -- set image
    [bt_drag setImage:[UIImage imageNamed:@"Ubuntu.png"] forState:UIControlStateNormal];
    
//Test2 -- set text
//    [bt_drag setBackgroundColor:[UIColor redColor]];
//    [bt_drag setTitle:@"DRAG" forState:UIControlStateNormal];
    
    [bt_drag addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:bt_drag];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonPress:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Get It" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    [alert release];
}
@end
