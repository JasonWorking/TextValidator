//
//  JKTextValidator.m
//  JKTextValidator
//
//  Created by Jason on 15-8-12.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "JKTextValidator.h"

@interface JKAmountTextValidator : JKTextValidator
@end

@interface JKBankCardValidator : JKTextValidator
@end

@interface JKCreditCardValidator : JKTextValidator
@end

@interface JKIDNumberValidator : JKTextValidator
@end

@interface JKMobileNumberValidator : JKTextValidator
@end

@interface JKAlipayAccountValidator : JKTextValidator
@end

@implementation JKTextValidator

+ (JKTextValidator *)amountValidator
{
    return [[JKAmountTextValidator alloc] init];
}

+ (JKTextValidator *)mobileNumberValidator
{
    return [[JKMobileNumberValidator alloc] init];
}

+ (JKTextValidator *)bankCardValidator
{
    return [[JKBankCardValidator alloc] init];
}

+ (JKTextValidator *)creditCardValidator
{
    return [[JKCreditCardValidator alloc] init];
}

+ (JKTextValidator *)IDCardValidator
{
    return [[JKIDNumberValidator alloc] init];
}

+ (JKTextValidator *)alipayAccountValidator
{
    return [[JKAlipayAccountValidator alloc] init];
}

- (BOOL)checkText:(NSString *)text
{
    NSAssert(NO, @"The method %s MUST implemented by a subclass.", __FUNCTION__);
    return NO;
}

@end


#pragma mark - Amount validator

@implementation JKAmountTextValidator

- (BOOL)checkText:(NSString *)text
{
    BOOL ret = NO;
    
    do {
        
        if ([text floatValue] < 0.01) {
            break;
        }
        
        float f;
        NSScanner *scanner = [NSScanner scannerWithString:text];
        if (![scanner scanFloat:&f] || ![scanner isAtEnd]) {
            break;
        }
        
        ret = YES;
        
    } while (0);
    
    return ret;
}

@end

@implementation JKBankCardValidator

- (BOOL)checkText:(NSString *)text
{
    NSCharacterSet *dontWantChar = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    text = [[text componentsSeparatedByCharactersInSet:dontWantChar] componentsJoinedByString:@""];
    return text.length >= 15;
    
}

@end

@implementation JKCreditCardValidator

- (BOOL)checkText:(NSString *)text
{
    NSCharacterSet *dontWantChar = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    text = [[text componentsSeparatedByCharactersInSet:dontWantChar] componentsJoinedByString:@""];
    return text.length >= 15;
}

@end

@implementation JKIDNumberValidator

- (BOOL)checkText:(NSString *)text
{
    return (text.length == 18 ||  text.length == 15);
}

@end

@implementation JKMobileNumberValidator

- (BOOL)checkText:(NSString *)text
{
    if (([text length] >= 11)) {
		NSMutableString *mobileNumber = [NSMutableString stringWithString:text];
		NSRange range = { 0, [text length] };
		[mobileNumber replaceOccurrencesOfString:@"-" withString:@"" options:NSCaseInsensitiveSearch range:range];
		range.length = [mobileNumber length];
		[mobileNumber replaceOccurrencesOfString:@"(" withString:@"" options:NSCaseInsensitiveSearch range:range];
		range.length = [mobileNumber length];
		[mobileNumber replaceOccurrencesOfString:@")" withString:@"" options:NSCaseInsensitiveSearch range:range];
		range.length = [mobileNumber length];
		[mobileNumber replaceOccurrencesOfString:@" " withString:@"" options:NSCaseInsensitiveSearch range:range];
        
		if ([mobileNumber length] >= 11) {
			range.location = [mobileNumber length] - 11;
			range.length = 11;
			text = [mobileNumber substringWithRange:range];
		}
        else {
			return NO;
		}
	}
    
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc]
                                              initWithPattern:@"[1][1|2|3|4|5|6|7|8|9|0]\\d{9}"
                                              options:NSRegularExpressionCaseInsensitive
                                              error:nil];
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:text
                                                                  options:NSMatchingReportProgress
                                                                    range:NSMakeRange(0, text.length)];
    if(numberofMatch > 0) {
        return YES;
    }
    
    return NO;
}

@end

@implementation JKAlipayAccountValidator

- (BOOL)checkText:(NSString *)text
{
    return [self isValidAlipayAccount:text];
}

- (BOOL)isValidAlipayAccount:(NSString *)account
{
    return [self checkEmailFormatWithAccount:account] || [self checkMobileNoFormatWithAccount:account];
}

- (BOOL)checkEmailFormatWithAccount:(NSString *)account
{
    NSString *emailRex = @"\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
    NSPredicate *preEmail  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRex];
    return [preEmail evaluateWithObject:account];
}

- (BOOL)checkMobileNoFormatWithAccount:(NSString *)account
{
    NSString *mobileRex = @"^((\\+86)|(86))?(1)\\d{10}$";
    NSPredicate *preMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobileRex];
    return [preMobile evaluateWithObject:account];
}

@end