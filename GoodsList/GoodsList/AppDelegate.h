//
//  AppDelegate.h
//  GoodsList
//
//  Created by 彭宗阁 on 2018/11/27.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

