//
//  ObjC.h
//  MvvmForIOSSwift
//
//  Created by Francois Dabonot on 20/07/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjC : NSObject
+ (BOOL)catchException:(void(^)(void))tryBlock error:(__autoreleasing NSError **)error;
@end
