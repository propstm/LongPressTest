//
//  ViewController.h
//  LongPressTest
//
//  Created by Matt Propst on 2/27/17.
//  Copyright © 2017 Matt Propst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SWTableViewCell.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate, SWTableViewCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableview;



@end

