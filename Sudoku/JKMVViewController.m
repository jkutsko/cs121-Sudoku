//
//  JKMVViewController.m
//  Sudoku
//
//  Created by Guest User on 9/12/14.
//  Copyright (c) 2014 Josh Kutsko Matt Valentine. All rights reserved.
//

#import "JKMVGridView.h"
#import "JKMVViewController.h"

int initialGrid[9][9] = {
    {7,0,0,4,2,0,0,0,9},
    {0,0,9,5,0,0,0,0,4},
    {0,2,0,6,9,0,5,0,0},
    {6,5,0,0,0,0,4,3,0},
    {0,8,0,0,0,6,0,0,7},
    {0,1,0,0,4,5,6,0,0},
    {0,0,0,8,6,0,0,0,2},
    {3,4,0,9,0,0,1,0,0},
    {8,0,0,3,0,2,7,4,0}
};

@interface JKMVViewController ()
{
    JKMVGridView* _gridView;
}
@end

@implementation JKMVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    int width = self.view.bounds.size.width;
    
    CGRect mainFrame = CGRectMake(round(0.1*width), round(0.1*width), round(0.8*width), round(0.8*width));
    
    _gridView = [[JKMVGridView alloc] initWithFrame: mainFrame andIntialGrid:initialGrid];
    [self.view addSubview:_gridView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
