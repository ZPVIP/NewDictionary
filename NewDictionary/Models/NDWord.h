//
//  NDWord.h
//  NewDictionary
//
//  Created by 王刚 on 14/8/5.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import <Foundation/Foundation.h>






@interface NDWord : NSObject


@property (nonatomic, readonly, copy) NSString *fromText;
@property (nonatomic, readonly, copy) NSString *toText;

- (id)initWithFromText:(NSString *)aFromText
                toText:(NSString *)aToText;
/*
{
    basic = {
        explains = (
                    "n. \U8868\U793a\U95ee\U5019\Uff0c \U60ca\U5947\U6216\U5524\U8d77\U6ce8\U610f\U65f6\U7684\U7528\U8bed",
                    "int. \U5582\Uff1b\U54c8\U7f57",
                    "n. (Hello)\U4eba\U540d\Uff1b(\U6cd5)\U57c3\U6d1b"
                    );
        phonetic = "h\U0259'l\U0259\U028a; he-";
        "uk-phonetic" = "h\U0259'l\U0259\U028a; he-";
        "us-phonetic" = "h\U025b\U02c8lo, h\U0259-";
    };
    errorCode = 0;
    query = hello;
    translation = (
                   "\U4f60\U597d"
                   );
    web = (
           {
               key = Hello;
               value =  (
                        "\U4f60\U597d",
                        "\U60a8\U597d",
                        "\U54c8\U5570"
                        );
           },
           {
               key = "Hello Kitty";
               value =  (
                        "\U51ef\U8482\U732b",
                        "\U6635\U79f0",
                        "\U533f\U79f0"
                        );
           },
           {
               key = "Hello Bebe";
               value =  (
                        "\U54c8\U4e50\U54c8\U4e50",
                        "\U4e50\U6263\U4e50\U6263"
                        );
           }
           );
}
*/

@end





@interface NDBasic : NSObject

@property (nonatomic, readonly, copy) NSArray *explains;
@property (nonatomic, readonly, copy) NSString *phonetic;
@property (nonatomic, readonly, copy) NSString *ukphonetic;
@property (nonatomic, readonly, copy) NSString *usphonetic;


- (id)initWithPhonetic:(NSString *)aPhonetic
            ukphonetic:(NSString *)aUkphonetic
            usphonetic:(NSString *)aUsphonetic;
- (id)initWithDictionary:(NSDictionary *)dic;

@end


@interface NDWebExplain : NSObject

@property (nonatomic, readonly, copy) NSString *key;
@property (nonatomic, readonly, copy) NSString *value;

- (id)initWithKey:(NSString *)aKey
            value:(NSString *)aValue;

- (id)initWithDictionary:(NSDictionary *)dic;
@end


@interface NDResult : NSObject

@property (nonatomic, readonly, strong) NDBasic *basic;

@property (nonatomic, readonly, copy) NSString *errorCode;
@property (nonatomic, readonly, copy) NSString *query;

@property (nonatomic, readonly, copy) NSArray *translation;
@property (nonatomic, readonly, copy) NSArray *webs;


- (id)initWithQuery:(NSString *)aQuery
          errorCode:(NSString *)aErrorCode;

- (id)initWithDictionary:(NSDictionary *)dic;


@end

