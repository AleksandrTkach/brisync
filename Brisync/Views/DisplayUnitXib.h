//
//  DisplayUnit.h
//  Brisync
//
//  Created by Krzysztof Czarnota on 11/12/2020.
//  Copyright © 2020 czarny. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DisplayUnitView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DisplayUnitXib : NSObject

@property (nonatomic, readwrite) IBOutlet DisplayUnitView *displayUnitView;

@end

NS_ASSUME_NONNULL_END
