//
//  ACHealthController.h
//  AcciCare
//
//  Created by Avinash Tag on 22/04/16.
//  Copyright © 2016 Avinash Tag. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HKHealthStore;
@class User;

@interface ACHealthController : NSObject

@property (nonatomic, strong, readonly) User *user;


+ (instancetype) sharedHealth;

@end
