//
//  DetailViewController.h
//  sample
//
//  Created by 梶原大進 on 2015/04/25.
//  Copyright (c) 2015年 梶原大進. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

