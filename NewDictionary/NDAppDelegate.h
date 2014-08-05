//
//  NDAppDelegate.h
//  NewDictionary
//
//  Created by 王刚 on 14/8/4.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NDTranslateEngine.h"


#define NDApplicationDelegate ((NDAppDelegate *)[UIApplication sharedApplication].delegate)

@interface NDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) NDTranslateEngine *translateEngine;

@end
