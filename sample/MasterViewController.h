//
//  MasterViewController.h
//  sample
//
//  Created by 梶原大進 on 2015/04/25.
//  Copyright (c) 2015年 梶原大進. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end

