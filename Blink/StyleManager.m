//
//  StyleManager.m
//  Hypershell
//
//  Created by Roman Alifanov on 30/06/2017.
//  Copyright © 2017 Carlos Cabañero Projects SL. All rights reserved.
//

#import "StyleManager.h"

#define RGBCOLOR(r, g, b) [UIColor colorWithRed:r/225.0f green:g/225.0f blue:b/225.0f alpha:1]

@implementation StyleManager

+ (instancetype)sharedManager {
  static StyleManager *sharedManager = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedManager = [[self alloc] init];
  });
  return sharedManager;
}

- (void)applyStyle:(HypershellStyle)style{
  switch (style) {
    case HypershellStyleDevDefault:
      [self applyDevDefaultStyle];
      break;
    default:
      break;
  }
  
  self.activeStyle = style;
}

- (void)applyDevDefaultStyle{
  return;
  UIColor *defaultBarColor = [UIColor blackColor];
  UIColor *globalTintColor = RGBCOLOR(72, 214, 200);
  
  [UIButton appearance].tintColor = globalTintColor;
  [UISwitch appearance].onTintColor = globalTintColor;
  
  [UISlider appearance].minimumTrackTintColor = globalTintColor;
  
  [UITextField appearance].keyboardAppearance = UIKeyboardAppearanceDark;
  
#pragma mark Bars
  
  [UITabBar appearance].barStyle = UIBarStyleBlack;
  [UITabBar appearance].barTintColor = defaultBarColor;
  [UITabBar appearance].tintColor = globalTintColor;
  
  [UINavigationBar appearance].barStyle = UIBarStyleBlack;
  [UINavigationBar appearance].barTintColor = defaultBarColor;
  [UINavigationBar appearance].tintColor = globalTintColor;
  
  [UIToolbar appearance].barStyle = UIBarStyleBlack;
  [UIToolbar appearance].barTintColor = defaultBarColor;
  [UIToolbar appearance].tintColor = globalTintColor;
  
#pragma mark Tables & Cells
  UIColor *defaultBg = [self getDefaultBackgroundForStyle:HypershellStyleDevDefault];
  
  [UITableView appearance].backgroundColor = defaultBg;
  [UITableView appearance].indicatorStyle = UIScrollViewIndicatorStyleWhite;
  [UITableView appearance].separatorColor = RGBCOLOR(23, 23, 25);
  //[UITableViewCell appearance].selectionStyle = UITableViewCellSelectionStyleNone;
  [UITableViewCell appearance].backgroundColor = defaultBg;
  [UITableViewCell appearance].tintColor = globalTintColor;
  [UITableViewCell appearance].textLabel.textColor = [UIColor whiteColor];
  
  [UITableViewHeaderFooterView appearance].contentView.backgroundColor = defaultBg;
}

- (UIColor*)getDefaultBackgroundForStyle:(HypershellStyle)style{
  switch (style) {
    case HypershellStyleDevDefault:
      return RGBCOLOR(47, 47, 51);
      break;
    default:
      return [UIColor whiteColor];
      break;
  }
}

@end
