//
//  CLLocation+Util.h
//  Insurance
//
//  Created by June on 16/3/11.
//  Copyright © 2016年 June. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface CLLocation (Util)
-(double) bearingToLocation:(CLLocation *) destinationLocation;
-(NSString *)getDirection:(CLLocation *)destinationLocation;
//-(CLLocation *)locationForBearing:(double)bearing
//                     withDistance:(CLLocationDistance)distance;
@end
