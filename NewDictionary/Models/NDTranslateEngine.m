//
//  NDTranslateEngine.m
//  NewDictionary
//
//  Created by 王刚 on 14/8/5.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import "NDTranslateEngine.h"
#import "NDWord.h"

@implementation NDTranslateEngine

- (void)translateWord:(NDWord *)word completionHandler:(ResponseBlock)completionBlock
         errorHandler:(MKNKErrorBlock)errorBlock {
    MKNetworkOperation *op = [self operationWithPath:[NSString stringWithFormat:YouDaoTranslateURL,word.fromText]];
    
    NSLog(@"url is -----> %@", op.url);
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        [completedOperation responseJSONWithCompletionHandler:^(NSDictionary *jsonObject) {
//            NDWord *newword = [[NDWord alloc]initWithFromText:word.fromText toText:[NSString stringWithFormat:@"%@",jsonObject]];
            NDResult *result = [[NDResult alloc]initWithDictionary:jsonObject];
//            NSLog(@"---->response json is : %@", jsonObject);
            completionBlock(result);
        }];
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
        
        errorBlock(error);
    }];
    
    [self enqueueOperation:op];
    
    
}
@end
