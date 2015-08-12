//
//  JKTextValidator.h
//  JKTextValidator
//
//  Created by Jason on 15-8-12.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Class cluster for text validator。
 */
@interface JKTextValidator : NSObject

/**
 *  Creates and returns a new validator that checks the validity of amount.
 *
 *  @return A newly created validator.
 */
+ (JKTextValidator *)amountValidator;
  
/**
 *  Creates and returns a new validator used for checking the validity of mobile number.
 *
 *  @return A newly created validator.
 */
+ (JKTextValidator *)mobileNumberValidator;

/**
 *  Creates and returns a new validator that checks the validity of bank card number.
 *
 *  @return A newly created validator.
 */
+ (JKTextValidator *)bankCardValidator;

/**
 *  Creates and returns a new validator that checks the validity of cridit card number.
 *
 *  @return A newly created validator.
 */
+ (JKTextValidator *)creditCardValidator;

/**
 *  Creates and returns a new validator that checks the validity of ID card.
 *
 *  @return A newly created validator.
 */
+ (JKTextValidator *)IDCardValidator;

/**
 *  Creates and returns a new validator that checks the validity of alipay account.
 *
 *  @return A newly created validator.
 */
+ (JKTextValidator *)alipayAccountValidator;

/**
 *  Checks the validity of specified text.
 *
 *  @param text The text to be check.
 *
 *  @return <code>YES</code if the specified text is valid, otherwise <code>NO</code>.
 */
- (BOOL)checkText:(NSString *)text;

@end

