//
//  AppDelegate.m
//  TryazonApp
//
//  Created by Dustin Flanary on 2/12/15.
//  Copyright (c) 2015 Dustin Flanary. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import "TATitlePageViewController.h"
#import "UIColor+ExtraColorTools.h"

@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // [Optional] Power your app with Local Datastore. For more info, go to
    // https://parse.com/docs/ios_guide#localdatastore/iOS
    [Parse enableLocalDatastore];
    
    // Initialize Parse.
    [Parse setApplicationId:@"R2P2LcVJ3xHBw1DGfB47MfZD96S2Rd03aweSdeLi"
                  clientKey:@"qrX5Ms11LSm3104TeBV7oxOJ6O8EWpaEd9DxskTK"];
    
    // [Optional] Track statistics around application opens.
    //[PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    UITabBar *tabBar = tabBarController.tabBar;
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
    UITabBarItem *tabBarItem4 = [tabBar.items objectAtIndex:3];
   // UITabBarItem *tabBarItem5 = [tabBar.items objectAtIndex:4];
    
    //tabBarItem1.title = @"Select a Party";
    tabBarItem1.title = @"Future Parties";
    tabBarItem2.title = @"Checklist";
    tabBarItem3.title = @"Hosting Info";
    tabBarItem4.title = @"Survey";
    
//    [self.tabBar setTitleTextAttributes: forState: [NSDictionary dictionaryWithObjectsAndKeys:
//                                             [UIFont fontWithName:@"AmericanTypewriter" size:20.0f], UITextAttributeFont,
//                                             [UIColor blackColor], UITextAttributeTextColor,
//                                             [UIColor grayColor], UITextAttributeTextShadowColor,
//                                             [NSValue valueWithUIOffset:UIOffsetMake(0.0f, 1.0f)], UITextAttributeTextShadowOffset,
//                                             nil]];

    
//    [tabBarItem1 setFinishedSelectedImage:[UIImage imageNamed:@"home_selected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"home.png"]];
//    [tabBarItem2 setFinishedSelectedImage:[UIImage imageNamed:@"maps_selected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"maps.png"]];
//    [tabBarItem3 setFinishedSelectedImage:[UIImage imageNamed:@"myplan_selected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"myplan.png"]];
//    [tabBarItem4 setFinishedSelectedImage:[UIImage imageNamed:@"settings_selected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"settings.png"]];
    
    //UIImage* tabBarBackground = [UIImage imageNamed:@"tabbar.png"];
    //[[UITabBar appearance] setBackgroundImage:tabBarBackground];
    //[[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"tabbar_selected.png"]];
    
    UIColor *titleHighlightedColor = [UIColor whiteColor]; //[UIColor colorWithRed:153/255.0 green:192/255.0 blue:48/255.0 alpha:1.0];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor getBrownTryazonColor], NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       titleHighlightedColor, NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateNormal];
    
    //[[UITabBar appearance] setTintColor:[UIColor whiteColor]];
   // [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:normal];
    //[[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:];
    
    //letting os know that am interested in sending push notifications
//    [application registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
    
 //   Note that you've just enabled Push Notification for your app in development mode. Prior to releasing your application on the App Store, you will need to repeat steps 1 through 7 of this section, but select "Production Push SSL Certificate" in step 2 instead, as covered in Section 7.
    
    // Place this elsewhere in the app
//    UIUserNotificationType userNotificationTypes = (UIUserNotificationTypeAlert |
//                                                    UIUserNotificationTypeBadge |
//                                                    UIUserNotificationTypeSound);
//    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes
//                                                                             categories:nil];
//    [application registerUserNotificationSettings:settings];
//    [application registerForRemoteNotifications];
    

    
        // [self performSegueWithIdentifier:@"logInSegue" sender:self];
    
    return YES;
}


//- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
//    // Store the deviceToken in the current installation and save it to Parse.
//    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
//    [currentInstallation setDeviceTokenFromData:deviceToken];
//    currentInstallation.channels = @[ @"global" ];
//    [currentInstallation saveInBackground];
//}

//- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
//    [PFPush handlePush:userInfo];
//}


// This would work if there was one checklist no matter the party but I need unique defaults based on the party.
+ (void)initialize {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *checkedBoxes;
    [defaults registerDefaults:checkedBoxes];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
