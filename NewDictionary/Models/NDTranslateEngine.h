//
//  NDTranslateEngine.h
//  NewDictionary
//
//  Created by 王刚 on 14/8/5.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MKNetworkKit/MKNetworkEngine.h>

@class NDResult, NDWord;


//查询
#define YouDaoTranslateURL @"openapi.do?keyfrom=lifoxnet&key=969929259&type=data&doctype=json&version=1.1&q=%@"

typedef void (^ResponseBlock) (NDResult *result);

@interface NDTranslateEngine : MKNetworkEngine

//查询单词
- (void)translateWord:(NDWord *)word completionHandler:(ResponseBlock)completionBlock
         errorHandler:(MKNKErrorBlock)errorBlock;

@end
