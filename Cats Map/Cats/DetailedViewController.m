//
//  DetailedViewController.m
//  Cats
//
//  Created by Paul on 2017-09-26.
//  Copyright © 2017 Paul. All rights reserved.
//

#import "DetailedViewController.h"

@interface DetailedViewController ()

@property (weak, nonatomic) IBOutlet UILabel *mapTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation DetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mapTitle.text = self.flickrPhoto.title;
    
    self.imageView.image = self.flickrPhoto.image;
    
    
}




@end
