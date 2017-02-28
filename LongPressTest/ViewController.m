//
//  ViewController.m
//  LongPressTest
//
//  Created by Matt Propst on 2/27/17.
//  Copyright © 2017 Matt Propst. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegate Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
{
    
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        
        CGPoint p = [gestureRecognizer locationInView:self.myTableview];
        
        NSIndexPath *indexPath = [self.myTableview indexPathForRowAtPoint:p];
        if (indexPath == nil) {
            NSLog(@"long press on table view but not on a row");
        } else {
            UITableViewCell *cell = [self.myTableview cellForRowAtIndexPath:indexPath];
            NSLog(@"LONG PRESS AT %@", indexPath);
        }
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    SWTableViewCell *cell = (SWTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[SWTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
        //cell.leftUtilityButtons = [self leftButtons];
        //cell.rightUtilityButtons = [self rightButtons];
        cell.delegate = self;
    }
    
    cell.textLabel.text = @"TEST LABEL";
    
    
    // setup long press
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = 1.25; //seconds
    lpgr.delegate = self;
    lpgr.cancelsTouchesInView = true;
    [cell addGestureRecognizer:lpgr];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"SELECTED INDEX PATH: %@", indexPath);
}


@end
