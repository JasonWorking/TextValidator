//
//  NSString+Validate.m
//
//  Created by Jason Liu on 14/5/11.
//  Copyright (c) 2014年 Jason. All rights reserved.
//

#import "NSString+Validate.h"

@implementation NSString (Validate)
+ (BOOL)validatePhoneNum:(NSString *)phoneNum
{
    //    NSString *isPhoneRegex = @"^((\\+86)|(\\(\\+86\\)))?\\D?((((010|021|022|023|024|025|026|027|028|029|852)|(\\(010\\)|\\(021\\)|\\(022\\)|\\(023\\)|\\(024\\)|\\(025\\)|\\(026\\)|\\(027\\)|\\(028\\)|\\(029\\)|\\(852\\)))\\D?\\d{8}|((0[3-9][1-9]{2})|(\\(0[3-9][1-9]{2}\\)))\\D?\\d{7,8}))(\\D?\\d{1,4})?$";
    
    NSString *isPhoneRegex = @"^((\\+86)|(\\(\\+86\\)))?\\W?((((010|021|022|023|024|025|026|027|028|029|852)|(\\(010\\)|\\(021\\)|\\(022\\)|\\(023\\)|\\(024\\)|\\(025\\)|\\(026\\)|\\(027\\)|\\(028\\)|\\(029\\)|\\(852\\)))\\W\\d{8}|((0[3-9][1-9]{2})|(\\(0[3-9][1-9]{2}\\)))\\W\\d{7,8}))(\\W\\d{1,4})?$";
    
    NSPredicate *phoneRegex = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", isPhoneRegex];
    
    if (([phoneRegex evaluateWithObject:phoneNum] == YES))
    {
        return YES;
    }else{
        return NO;
    }
}


+ (BOOL)validateTelephoneNum:(NSString *)telephoneNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    //    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    
    
    /**
     * 中国移动：China Mobile
     * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     */
    //    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$"; // China Mobile phoneNum
    
    /**
     * 中国联通：China Unicom
     * 130,131,132,152,155,156,185,186
     */
    //    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$"; // China Unicom phoneNum
    
    
    /**
     * 中国电信：China Telecom
     * 133,1349,153,180,189
     */
    //    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$"; // China Telecom phoneNum
    
    /**
     *  The following 4 predicate can tell which carrier the number is from.
     */
    //    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    //    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    //    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    //    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    
    //Only Check if the string is a valid telephone number, ignoring the carrier info.
    NSString *isMobileRegex = @"^((\\+86)|(\\(\\+86\\)))?(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0,5-9]{1}))+\\d{8})$";
    
    
    NSPredicate *mobileRegex = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", isMobileRegex];
    
    return [mobileRegex evaluateWithObject:telephoneNum];
    
}


+ (BOOL)validateEmailAddress:(NSString *)email
{
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    if ([emailTest evaluateWithObject:email] == YES) {
        return YES;
    }else {
        return NO;
    }
}


+ (BOOL)validateUsername:(NSString *)username
{
    
    NSString *usernameRegEx = @"^(?!((^[0-9]+$)|(^[_]+$)))([a-zA-Z0-9_]{1,20})$";
    
    NSPredicate *usernameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", usernameRegEx];
    
    return [usernameTest evaluateWithObject:username];
}

+ (BOOL)validatePassword:(NSString *)pwd identityToAnotherPassword:(NSString *)anotherPwd
{
    return [pwd isEqualToString:anotherPwd];
}

+ (BOOL)validateWxno:(NSString *)wxno
{
    //TODO: empty wxno validator implementation
    return YES;
}

@end
