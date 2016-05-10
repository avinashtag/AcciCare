//
//  User.h
//  AcciCare
//
//  Created by Avinash Tag on 22/04/16.
//  Copyright © 2016 Avinash Tag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Healthkit/Healthkit.h>


@interface User : NSObject

@property (nonatomic, strong) NSString  *userName;
@property (nonatomic, strong) NSDate    *birthDate;
@property (nonatomic, assign) HKBloodType  bloodGroup;
@property (nonatomic, assign) HKBiologicalSex biologicalsex;
@end
