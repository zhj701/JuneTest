//
//  CLLocation+Util.m
//  Insurance
//
//  Created by June on 16/3/11.
//  Copyright © 2016年 June. All rights reserved.
//


#import "CLLocation+Util.h"

@implementation CLLocation (Util)
-(double) bearingToLocation:(CLLocation *) destinationLocation {
    
    double lat1 = DegreesToRadians(self.coordinate.latitude);
    double lon1 = DegreesToRadians(self.coordinate.longitude);
    
    double lat2 = DegreesToRadians(destinationLocation.coordinate.latitude);
    double lon2 = DegreesToRadians(destinationLocation.coordinate.longitude);
    
    double dLon = lon2 - lon1;
    
    double y = sin(dLon) * cos(lat2);
    double x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon);
    double radiansBearing = atan2(y, x);
    
    if(radiansBearing < 0.0)
    
    radiansBearing += 2*M_PI;

    return RadiansToDegrees(radiansBearing);
}

//-(CLLocation *)locationForBearing:(double)bearing
//                   withDistance:(CLLocationDistance)distance {
//    double distRadians = distance / (6372797.6); // earth radius in meters
//    
//    double lat1 = self.coordinate.latitude * M_PI / 180;
//    double lon1 = self.coordinate.longitude * M_PI / 180;
//    double angle = DegreesToRadians(bearing);
//    
//    double lat2 = asin(sin(lat1) * cos(distRadians) + cos(lat1) * sin(distRadians) * cos(angle));
//    double lon2 = lon1 + atan2(sin(angle) * sin(distRadians) * cos(lat1), cos(distRadians) - sin(lat1) * sin(lat2));
//    
//    return  [[CLLocation alloc]initWithLatitude:lat2 * 180 / M_PI longitude:lon2 * 180 / M_PI];
//}

- (NSString *)getDirection:(CLLocation *)destinationLocation{
    NSString *string;
    int bearning = (int)[self bearingToLocation:destinationLocation];
    if (bearning == 0) {
        string = @"north";
    }
    else if (bearning < 90){
        string = @"northeast";
    }
    else if (bearning == 90){
        string = @"east";
    }
    else if (bearning < 180){
        string = @"southeast";
    }
    else if (bearning == 180){
        string = @"south";
    }
    else if (bearning < 270){
        string = @"southweat";
    }
    else if (bearning == 270){
        string = @"west";
    }
    else{
        string = @"northweat";
    }
    
    return string;
}

@end
