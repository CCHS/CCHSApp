//
//  NSDataEncryption.h
//  RollVikes
//
//  Created by Nick Petro on 9/16/13.
//  Copyright (c) 2013 CCHS. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSData (AES256)

- (NSData *)AES256EncryptWithKey:(NSString *)key;
- (NSData *)AES256DecryptWithKey:(NSString *)key;

@end