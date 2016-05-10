//
//  ACHealthController.m
//  AcciCare
//
//  Created by Avinash Tag on 22/04/16.
//  Copyright © 2016 Avinash Tag. All rights reserved.
//

#import "ACHealthController.h"
#import <HealthKit/HealthKit.h>
#import "User.h"

@interface ACHealthController ()
@property (nonatomic, strong, readonly) HKHealthStore *healthStore;


@end
@implementation ACHealthController


+ (instancetype) sharedHealth{
    
    static ACHealthController *health;
    static dispatch_once_t once = 0;
    dispatch_once(&once, ^{
        health = [[ACHealthController alloc]init];
    });
    return health;
}


- (instancetype) init{
    
    if (self == [super init]) {
        if ([HKHealthStore isHealthDataAvailable]) {
            // healthkit is available good to go further
            
            _healthStore = [[HKHealthStore alloc]init];
        }
    }
    return self;
}



- (User *) user{
    
    if ([HKHealthStore isHealthDataAvailable] == NO) {
        // If our device doesn't support HealthKit -> return.
        return nil;
    }
    
    NSArray *readTypes = @[[HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierDateOfBirth],[HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierBloodType]];
    
    NSArray *writeTypes = @[[HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass]];
    __block User *user = [[User alloc]init];
 
    [self.healthStore requestAuthorizationToShareTypes:[NSSet setWithArray:readTypes] readTypes:[NSSet setWithArray:writeTypes] completion:^(BOOL success, NSError * _Nullable error) {
        
        if (success) {
            user.userName = @"Agnes";
            user.birthDate = [self readBirthDate];
            user.bloodGroup = [self readBloodGroup];
            user.biologicalsex=[self readsex];
        }
    }];

    
    return user;
    
}


- (NSDate *)readBirthDate {
    NSError *error;
    NSDate *dateOfBirth = [self.healthStore dateOfBirthWithError:&error];   // Convenience method of HKHealthStore to get date of birth directly.
    
    if (!dateOfBirth) {
        NSLog(@"Either an error occured fetching the user's age information or none has been stored yet. In your app, try to handle this gracefully.");
    }
    
    return dateOfBirth;
}

- (HKBloodType)readBloodGroup{
    
    NSError *error;
    HKBloodTypeObject *bloodType =  [self.healthStore bloodTypeWithError:&error];
    return bloodType.bloodType;
}


-(HKBiologicalSex)readsex {
    NSError *error;
    HKBiologicalSexObject *biologicalSex = [self.healthStore biologicalSexWithError:&error];
    return biologicalSex.biologicalSex;

}





@end
