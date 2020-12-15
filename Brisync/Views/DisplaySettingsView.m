//
//  DisplaySettingsView.m
//  Brisync
//
//  Created by Krzysztof Czarnota on 11/12/2020.
//  Copyright © 2020 czarny. All rights reserved.
//

#import "DisplaySettingsView.h"

@implementation DisplaySettingsView

- (instancetype)initWithContentRect:(NSRect)contentRect styleMask:(NSWindowStyleMask)style backing:(NSBackingStoreType)backingStoreType defer:(BOOL)flag {
    self = [super initWithContentRect:contentRect styleMask:style backing:backingStoreType defer:flag];
    if(self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onBrightnessChange:) name:@"BuildInBrigthnessChange" object:nil];
    }
    return self;
}


- (IBAction)onSliderValueChanged:(NSSlider *)slider {
    NSMutableArray *map = [self.display.brightnessMap mutableCopy];
    map[slider.tag] = @(slider.intValue);
    self.display.brightnessMap = map;

    // Update brightness settings
    NSUInteger procent = [self.display adjustToLevel:self.brightnessLevel.doubleValue];
    self.display.brightness = procent;
    self.parent.brigthness.stringValue = [NSString stringWithFormat:@"%d%%", (int)procent];
}


- (IBAction)onMaxBrightnessValueChange:(NSPopUpButton *)sender {
    NSInteger value = sender.titleOfSelectedItem.intValue;
    self.display.maxBrightnessValue = value;
}

- (void)onBrightnessChange:(NSNotification *)notification {
    NSInteger brightness = [notification.object intValue];
    self.brightnessLevel.doubleValue = brightness;
}

@end
