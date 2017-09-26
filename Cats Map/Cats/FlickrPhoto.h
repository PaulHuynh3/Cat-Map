//
//  FlickrPhoto.h
//  Cats
//
//  Created by Paul on 2017-09-25.
//  Copyright © 2017 Paul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface FlickrPhoto : NSObject <MKAnnotation>

//create properties relating to the API
@property (nonatomic,strong) NSString* flickrID;
@property (nonatomic,strong) NSString* owner;
@property (nonatomic,strong) NSString* secret;
@property (nonatomic,strong) NSString* server;
@property (nonatomic,strong) NSString* photoTitle;
@property (nonatomic) NSInteger farm;

@property (nonatomic,strong) UIImage* image;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;


/*
 To make our model object work seamlessly with MapKit we will make our Photo object conform to the MKAnnotation protocol.
 
 Create a property on your Photo object for the coordinate. This is required by the protocol. You will need to import MapKit.
 
 @property(nonatomic) CLLocationCoordinate2D coordinate;
 
 Once we fetch our image's coordinates we will use CLLocationCoordinate2DMake() and pass in two double values for the latitude and longitude so that we can set the coordinate property on our Photo object.
 
 The protocol also uses the title property of our Photo object. So the title will work with MapK
 
 
 */




- (instancetype)initWithInfo:(NSDictionary<NSString*,id>*)info;

- (NSURL*) url;

@end
