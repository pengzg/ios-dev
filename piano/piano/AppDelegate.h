//
//  AppDelegate.h
//  piano
//
//  Created by 彭宗阁 on 2020/3/1.
//  Copyright © 2020 pengzg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

