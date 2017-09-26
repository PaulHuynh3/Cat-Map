//
//  ViewController.m
//  Cats
//
//  Created by Paul on 2017-09-25.
//  Copyright © 2017 Paul. All rights reserved.
//

#import "ViewController.h"
#import "FlickrAPI.h"
#import "CatPhotoCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic,strong) NSArray <FlickrPhoto*> *catPhotoArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // what we want to do is this self.catPhotos = [FlickrAPI searchFor:@"cats"];
    // but the search process happens in the background asynchronously so we can't
    // so one way of dealing with this is moving the return type to a block parameter
    // so we pass in a block that gets the "return value" and does what we would like with the return value
    [FlickrAPI searchFor:@"cats" complete:^(NSArray<FlickrPhoto *> *results) {
        self.catPhotoArray = results;
        
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self.collectionView reloadData];
    }];
        NSLog(@"loaded photo results");
        
    }];
    
    NSLog(@"view did load finish loading");//happens before loaded photo results
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    //catPhotoArray is set to a json-array
    return self.catPhotoArray.count;

}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    CatPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    //we set our array equal to the array of the json even tho it was wrapped around a dictionary therefore we dont need to need access sections then items.
    [cell setFlickrPhoto:self.catPhotoArray[indexPath.item]]; //this line is called everytime user scrolls down to new screem and the cellclass is continuously setting pictures.
    

    return cell;
}





@end
