//
//  NSString+Validate.h
//
//  Created by Jason Liu on 14/5/11.
//  Copyright (c) 2014年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validate)

/**
 *  国内固定电话校验,支持 (+86)-(3至4位区号)-7至8位直播号-1至4位分机号.其中区号与直播号是必须，国家码可选、分机号可选、国家码与区号中的括号可选，分隔符限定为非字母数字符号.
 *
 *  @param phoneNum 待校验字符串
 *
 *  @return return YES if the `phoneNum` is a valid phone number, otherwise NO.
 */
+ (BOOL)validatePhoneNum:(NSString *)phoneNum;



/**
 *  国内手机号码校验,支持1{3,5,7,8}号段
 *
 *  @param telephoneNum 待校验字符串
 *
 *  @return return YES if the `telephoneNum` is a valid telephone number, otherwise NO.
 */
+ (BOOL)validateTelephoneNum:(NSString *)telephoneNum;



/**
 *  Email Validate.
 *
 *  @param email The string to be validated.
 *
 *  @return return YES if the `email` is a valid email address, otherwise NO.
 */
+ (BOOL)validateEmailAddress:(NSString *)email;


/**
 *  用户名合法性校验,允许输入1-20位字母、数字、下划线,不能为纯数字或纯下划线
 *
 *  @param username 待校验字符串
 *
 *  @return return YES if the `username` is a valid username, otherwise NO.
 */
+ (BOOL)validateUsername:(NSString *)username;


/**
 *  Password validate.(TODO: needs more useful function)
 *
 *  @param pwd        A password string
 *  @param anotherPwd Another password string.
 *
 *  @return return YES if `pwd` == `anotherPwd`,otherwise NO.
 */
+ (BOOL)validatePassword:(NSString *)pwd identityToAnotherPassword:(NSString *)anotherPwd;

/**
 *  微信号合法性校验(FIXME:Empty implementation)
 *
 *  @param wxno 待校验字符串
 *
 *  @return return YES if the `wxno` is a valid WeChat account, otherwise NO.
 */
+ (BOOL)validateWxno:(NSString *)wxno;

@end
