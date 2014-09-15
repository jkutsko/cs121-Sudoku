//
//  JKMVGridView.m
//  Sudoku
//
//  Created by Guest User on 9/12/14.
//  Copyright (c) 2014 Josh Kutsko Matt Valentine. All rights reserved.
//

#import "JKMVGridView.h"

@interface JKMVGridView ()
{
    UIButton *_cells[9][9];
}
@end

@implementation JKMVGridView

- (void)gridCellSelected:(id)sender
{
    UIButton* cell = (UIButton*)sender;
    int row = cell.tag % 10;
    int col = cell.tag / 10;
    
    NSLog(@"Cell Selected: (%d, %d)", row, col);
}

- (id)initWithFrame:(CGRect)frame andIntialGrid:(int[9][9])grid
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor blackColor];
        
        double x, y;
        int w=frame.size.width, h=frame.size.height;
        double rel_margin=0.5, rel_cell_size=1, rel_cell_sep=.2;
        double total=4*rel_margin + 3*(3*rel_cell_size + 2*rel_cell_sep);
        
        y=0;
        for (int i=0; i<9; ++i) {
            if (i%3 == 0) {
                y += rel_margin * h/total;
            } else {
                y += rel_cell_sep * h/total;
            }
            
            x=0;
            for (int j=0; j<9; ++j) {
                if (j%3 == 0) {
                    x += rel_margin * w/total;
                } else {
                    x += rel_cell_sep * w/total;
                }
                
                CGRect cellFrame = CGRectMake(round(x), round(y), rel_cell_size*w/total, rel_cell_size*h/total);
                
                UIButton *cell = [[UIButton alloc] initWithFrame:cellFrame];
                
                cell.backgroundColor = [UIColor whiteColor];
                
                NSString *title;
                if (grid[i][j] != 0) {
                    title = [NSString stringWithFormat:@"%d", grid[i][j]];
                } else {
                    title = @"";
                }
                
                [cell setTitle:title forState:UIControlStateNormal];
                [cell setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                
                cell.tag = 10*i+j;
                
                cell.showsTouchWhenHighlighted = YES;
                
                [cell addTarget:self action:@selector(gridCellSelected:)
                    forControlEvents:UIControlEventTouchDown];
                
                _cells[i][j] = cell;
                [self addSubview:cell];
                
                x += rel_cell_size * w/total;
            }
            
            y += rel_cell_size * h/total;
        }
        
    }
    return self;
}

@end
