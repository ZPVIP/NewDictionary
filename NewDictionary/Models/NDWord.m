//
//  NDWord.m
//  NewDictionary
//
//  Created by 王刚 on 14/8/5.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import "NDWord.h"

@interface NDWord()

@property (nonatomic, readwrite, copy) NSString *fromText;
@property (nonatomic, readwrite, copy) NSString *toText;

@end
@implementation NDWord

- (id)initWithFromText:(NSString *)aFromText toText:(NSString *)aToText {
    if (self = [super init]) {
        self.fromText = [aFromText copy];
        self.toText = [aToText copy];
    }
    return self;
}

@end





@interface NDBasic()
{
    NSArray *_innerExplains;
}
@property (nonatomic, readwrite, copy) NSString *phonetic;
@property (nonatomic, readwrite, copy) NSString *ukphonetic;
@property (nonatomic, readwrite, copy) NSString *usphonetic;

@end
@implementation NDBasic

- (id)initWithPhonetic:(NSString *)aPhonetic
            ukphonetic:(NSString *)aUkphonetic
            usphonetic:(NSString *)aUsphonetic {
    
    if (self = [super init]) {
        self.phonetic = [aPhonetic copy];
        self.ukphonetic = [aUkphonetic copy];
        self.usphonetic = [aUsphonetic copy];
    }
    return self;
}
- (id)initWithDictionary:(NSDictionary *)dic {
    
    self = [self initWithPhonetic:[dic objectForKey:@"phonetic"] ukphonetic:[dic objectForKey:@"uk-phonetic"] usphonetic:[dic objectForKey:@"us-phonetic"]];
    
    _innerExplains = [NSArray arrayWithArray:[dic objectForKey:@"explains"]];
    
    return self;
    
}
- (NSArray *)explains {
    return [_innerExplains copy];
}

@end


@interface NDWebExplain()

@property (nonatomic, readwrite, copy) NSString *key;
@property (nonatomic, readwrite, copy) NSString *value;

@end
@implementation NDWebExplain

- (id)initWithKey:(NSString *)aKey value:(NSString *)aValue {
    if (self = [super init]) {
        self.key = [aKey copy];
        self.value = [aValue copy];
    }
    return self;
}

- (id)initWithDictionary:(NSDictionary *)dic {
    self = [self initWithKey:[dic objectForKey:@"key"] value:[dic objectForKey:@"value"]];
    return self;
}

@end

@interface NDResult()
{
    NDBasic *_innerBasic;
    NSArray *_innerTranslation;
    NSMutableArray *_innerWeb;
}
//@property (nonatomic, readonly, strong) NDBasic *basic;

@property (nonatomic, readwrite, copy) NSString *errorCode;
@property (nonatomic, readwrite, copy) NSString *query;

//@property (nonatomic, readonly, copy) NSArray *translation;

//@property (nonatomic, readonly, strong) NSArray *webs;

@end
@implementation NDResult

- (id)initWithQuery:(NSString *)aQuery errorCode:(NSString *)aErrorCode {
    if (self = [super init]) {
        self.errorCode = [aErrorCode copy];
        self.query = [aQuery copy];
    }
    return self;
}


- (id)initWithDictionary:(NSDictionary *)dic {
    
    self = [self initWithQuery:[dic objectForKey:@"query"] errorCode:@"errorCode"];
    
    _innerBasic = [[NDBasic alloc]initWithDictionary:[dic objectForKey:@"basic"]];
    _innerTranslation = [NSArray arrayWithArray:[dic objectForKey:@"translation"]];
    
    NSArray *arrwebs = [dic objectForKey:@"web"];
    for (NSDictionary *d in arrwebs) {
        [self addWeb:[[NDWebExplain alloc]initWithDictionary:d]];
    }
    
    return self;
}


- (NDBasic *)basic {
    return _innerBasic;
}

- (NSArray *)translation {
    return [_innerTranslation copy];
}

- (NSArray *)webs {
    return [_innerWeb copy];
}

- (void)addWeb:(NDWebExplain *)webExplation {
    [_innerWeb addObject:webExplation];
}


@end





