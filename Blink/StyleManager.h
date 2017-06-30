//
//  StyleManager.h
//  Hypershell
//
//  Created by Roman Alifanov on 30/06/2017.
//  Copyright © 2017 Carlos Cabañero Projects SL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKIT/UIKIT.h>

@interface StyleManager : NSObject

typedef enum {
  HypershellStyleDevDefault,
} HypershellStyle;

+ (instancetype)sharedManager;

@property (nonatomic) HypershellStyle activeStyle;

- (void)applyStyle:(HypershellStyle) style;
- (UIColor*)getDefaultBackgroundForStyle:(HypershellStyle) style;

@end
