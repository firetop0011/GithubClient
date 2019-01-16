//
//  SYDCentralPivotUIAdapter.h
//  ZLGitHubClient
//
//  Created by 朱猛 on 2019/1/13.
//  Copyright © 2019年 ZTE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYDCentralPivotUIAdapter : NSObject

#pragma mark - ZLMainViewController

+ (UIViewController *)getZLMainViewController;
+ (UIViewController *)getZLNewsViewController;
+ (UIViewController *)getZLRepositoriesViewController;
+ (UIViewController *)getZLExploreViewController;
+ (UIViewController *)getZLProfileViewController;

@end
