//
//  ObjC.m
//  MvvmForIOSSwift
//
//  Created by Francois Dabonot on 20/07/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

#import "ObjC.h"

@implementation ObjC

+ (BOOL)catchException:(void(^)(void))tryBlock error:(__autoreleasing NSError **)error {
    @try {
        tryBlock();
        return YES;
    }
    @catch (NSException *exception) {
        *error = [[NSError alloc] initWithDomain:exception.name code:0 userInfo:exception.userInfo];
        return NO;
    }
}

@end
