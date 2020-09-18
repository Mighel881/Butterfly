#import "Butterfly.h"

BOOL enabled;

void setPreset() {

    int presetNumber = [selectedPreset intValue];

    switch(presetNumber) {
        case 1:
            presetHex = @"#147efb";
            break;
        case 2:
            presetHex = @"#34c759";
            break;
        case 3:
            presetHex = @"#5856D6";
            break;
        case 4:
            presetHex = @"#ff9500";
            break;
        case 5:
            presetHex = @"#ff2d55";
            break;
        case 6:
            presetHex = @"#af52de";
            break;
        case 7:
            presetHex = @"#ff3b30";
            break;
        case 8:
            presetHex = @"#5ac8fa";
            break;
        case 9:
            presetHex = @"#ffcc00";
            break;
        case 10:
            presetHex = @"#eeabff";
            break;
        case 11:
            presetHex = @"#abefcb";
            break;
        case 12:
            presetHex = @"#9966ff";
            break;
        default:
            break;
    }

}

void setRandomColor() {

    switch(randomNumber) {
        case 1:
            presetHex2 = @"#147efb";
            break;
        case 2:
            presetHex2 = @"#34c759";
            break;
        case 3:
            presetHex2 = @"#5856D6";
            break;
        case 4:
            presetHex2 = @"#ff9500";
            break;
        case 5:
            presetHex2 = @"#ff2d55";
            break;
        case 6:
            presetHex2 = @"#af52de";
            break;
        case 7:
            presetHex2 = @"#ff3b30";
            break;
        case 8:
            presetHex2 = @"#5ac8fa";
            break;
        case 9:
            presetHex2 = @"#ffcc00";
            break;
        case 10:
            presetHex2 = @"#eeabff";
            break;
        case 11:
            presetHex2 = @"#abefcb";
            break;
        case 12:
            presetHex2 = @"#9966ff";
            break;
        default:
            break;
    }

}

%group Cursor

%hook UITextSelectionView

- (id)caretViewColor {

    if (cursorColorSwitch && useCustomCursorColorSwitch && [selectedPreset intValue] == 0) {
        UIColor* customColor = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"customCursorColor"] withFallback:@"#147efb"];
        return [customColor colorWithAlphaComponent:[cursorAlphaLevel doubleValue]];
    } else if (cursorColorSwitch && useRandomColorSwitch) {
        int min = 1;
        int max = 12;
        randomNumber = arc4random_uniform(max - min) + min;
        setRandomColor();
        UIColor* color = [SparkColourPickerUtils colourWithString:presetHex2 withFallback:@"#147efb"];
        return [color colorWithAlphaComponent:[cursorAlphaLevel doubleValue]];
    } else if (cursorColorSwitch && !useCustomCursorColorSwitch && [selectedPreset intValue] == 0) {
        UIColor* color = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"color"] withFallback:@"#147efb"];
        return [color colorWithAlphaComponent:[cursorAlphaLevel doubleValue]];
    } else if (cursorColorSwitch && [selectedPreset intValue] != 0) {
        setPreset();
        UIColor* color = [SparkColourPickerUtils colourWithString:presetHex withFallback:@"#147efb"];
        return [color colorWithAlphaComponent:[cursorAlphaLevel doubleValue]];
    } else {
        return %orig;
    }

}

- (id)floatingCaretViewColor {

    if (cursorColorSwitch && useCustomCursorColorSwitch && [selectedPreset intValue] == 0) {
        UIColor* customColor = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"customCursorColor"] withFallback: @"#147efb"];
        return [customColor colorWithAlphaComponent:[cursorAlphaLevel doubleValue]];
    } else if (cursorColorSwitch && useRandomColorSwitch) {
        int min = 1;
        int max = 12;
        randomNumber = arc4random_uniform(max - min) + min;
        setRandomColor();
        UIColor* color = [SparkColourPickerUtils colourWithString:presetHex2 withFallback:@"#147efb"];
        return [color colorWithAlphaComponent:[cursorAlphaLevel doubleValue]];
    } else if (cursorColorSwitch && !useCustomCursorColorSwitch && [selectedPreset intValue] == 0) {
        UIColor* color = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"color"] withFallback: @"#147efb"];
        return [color colorWithAlphaComponent:[cursorAlphaLevel doubleValue]];
    } else if (cursorColorSwitch && [selectedPreset intValue] != 0) {
        setPreset();
        UIColor* color = [SparkColourPickerUtils colourWithString:presetHex withFallback:@"#147efb"];
        return [color colorWithAlphaComponent:[cursorAlphaLevel doubleValue]];
    } else {
        return %orig;
    }

}

%end

%end

%group Highlight

%hook UITextInputTraits

- (void)setSelectionBarColor:(id)arg1 {

    if (cursorColorSwitch && useCustomCursorColorSwitch && [selectedPreset intValue] == 0) {
        UIColor* customColor = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"customCursorColor"] withFallback:@"#147efb"];
        %orig([customColor colorWithAlphaComponent:[cursorAlphaLevel doubleValue]]);
    } else if (cursorColorSwitch && useRandomColorSwitch) {
        int min = 1;
        int max = 12;
        randomNumber = arc4random_uniform(max - min) + min;
        setRandomColor();
        UIColor* color = [SparkColourPickerUtils colourWithString:presetHex2 withFallback: @"#147efb"];
        %orig([color colorWithAlphaComponent:[cursorAlphaLevel doubleValue]]);
    } else if (cursorColorSwitch && !useCustomCursorColorSwitch && [selectedPreset intValue] == 0) {
        UIColor* color = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"color"] withFallback:@"#147efb"];
        %orig([color colorWithAlphaComponent:[cursorAlphaLevel doubleValue]]);
    } else if (cursorColorSwitch && [selectedPreset intValue] != 0) {
        setPreset();
        UIColor* color = [SparkColourPickerUtils colourWithString:presetHex withFallback:@"#147efb"];
        %orig([color colorWithAlphaComponent:[cursorAlphaLevel doubleValue]]);
    } else {
        %orig;
    }

}

- (UIColor *)selectionHighlightColor {

    if (highlightColorSwitch && useCustomHighlightColorSwitch && [selectedPreset intValue] == 0) {
        UIColor* customColor = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"customHighlightColor"] withFallback:@"#147efb"];
        return [customColor colorWithAlphaComponent:[highlightColorAlphaLevel doubleValue]];
    } else if (highlightColorSwitch && useRandomColorSwitch) {
        int min = 1;
        int max = 12;
        randomNumber = arc4random_uniform(max - min) + min;
        setRandomColor();
        UIColor* color = [SparkColourPickerUtils colourWithString:presetHex2 withFallback: @"#147efb"];
        return [color colorWithAlphaComponent:[highlightColorAlphaLevel doubleValue]];
    } else if (highlightColorSwitch && !useCustomHighlightColorSwitch && [selectedPreset intValue] == 0) {
        UIColor* color = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"color"] withFallback:@"#147efb"];
        return [color colorWithAlphaComponent:[highlightColorAlphaLevel doubleValue]];
    } else if (highlightColorSwitch && [selectedPreset intValue] != 0) {
        setPreset();
        UIColor* color = [SparkColourPickerUtils colourWithString:presetHex withFallback:@"#147efb"];
        return [color colorWithAlphaComponent:[highlightColorAlphaLevel doubleValue]];
    } else {
        return %orig;
    }

}

%end

%end

%group ScrollIndicator

%hook _UIScrollViewScrollIndicator

- (id)_colorForStyle:(long long)arg1 {

    if (scrollIndicatorColorSwitch && useCustomScrollIndicatorColorSwitch && [selectedPreset intValue] == 0) {
        UIColor* customColor = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"customScrollIndicatorColor"] withFallback:@"#147efb"];
        return [customColor colorWithAlphaComponent:[scrollIndicatorAlphaLevel doubleValue]];
    } else if (scrollIndicatorColorSwitch && useRandomColorSwitch) {
        int min = 1;
        int max = 12;
        randomNumber = arc4random_uniform(max - min) + min;
        setRandomColor();
        UIColor* color = [SparkColourPickerUtils colourWithString:presetHex2 withFallback: @"#147efb"];
        return [color colorWithAlphaComponent:[scrollIndicatorAlphaLevel doubleValue]];
    } else if (scrollIndicatorColorSwitch && !useCustomScrollIndicatorColorSwitch && [selectedPreset intValue] == 0) {
        UIColor* color = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"color"] withFallback:@"#147efb"];
        return [color colorWithAlphaComponent:[scrollIndicatorAlphaLevel doubleValue]];
    } else if (scrollIndicatorColorSwitch && [selectedPreset intValue] != 0) {
        setPreset();
        UIColor* color = [SparkColourPickerUtils colourWithString:presetHex withFallback:@"#147efb"];
        return [color colorWithAlphaComponent:[scrollIndicatorAlphaLevel doubleValue]];
    } else {
        return %orig;
    }

}

%end

%end

%group StatusBarPill

%hook _UIStatusBarPillView

- (void)setPillColor:(UIColor *)arg1 {
    
    if (pillColorSwitch && useCustomPillColorSwitch && [selectedPreset intValue] == 0) {
        UIColor* customColor = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"customPillColor"] withFallback:@"#147efb"];
        %orig([customColor colorWithAlphaComponent:[pillAlphaLevel doubleValue]]);
    } else if (pillColorSwitch && useRandomColorSwitch) {
        int min = 1;
        int max = 12;
        randomNumber = arc4random_uniform(max - min) + min;
        setRandomColor();
        UIColor* color = [SparkColourPickerUtils colourWithString:presetHex2 withFallback: @"#147efb"];
        %orig([color colorWithAlphaComponent:[pillAlphaLevel doubleValue]]);
    } else if (pillColorSwitch && !useCustomPillColorSwitch && [selectedPreset intValue] == 0) {
        UIColor* color = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"color"] withFallback:@"#147efb"];
        %orig([color colorWithAlphaComponent:[pillAlphaLevel doubleValue]]);
    } else if (pillColorSwitch && [selectedPreset intValue] != 0) {
        setPreset();
        UIColor* color = [SparkColourPickerUtils colourWithString:presetHex withFallback:@"#147efb"];
        %orig([color colorWithAlphaComponent:[pillAlphaLevel doubleValue]]);
    } else {
        %orig;
    }

}

%end

%end

%ctor {

    if (![NSProcessInfo processInfo]) return;
    NSString *processName = [NSProcessInfo processInfo].processName;
    bool isSpringboard = [@"SpringBoard" isEqualToString:processName];

    bool shouldLoad = NO;
    NSArray *args = [[NSClassFromString(@"NSProcessInfo") processInfo] arguments];
    NSUInteger count = args.count;
    if (count != 0) {
        NSString *executablePath = args[0];
        if (executablePath) {
            NSString *processName = [executablePath lastPathComponent];
            BOOL isApplication = [executablePath rangeOfString:@"/Application/"].location != NSNotFound || [executablePath rangeOfString:@"/Applications/"].location != NSNotFound;
            BOOL isFileProvider = [[processName lowercaseString] rangeOfString:@"fileprovider"].location != NSNotFound;
            BOOL skip = [processName isEqualToString:@"AdSheet"]
                        || [processName isEqualToString:@"CoreAuthUI"]
                        || [processName isEqualToString:@"InCallService"]
                        || [processName isEqualToString:@"MessagesNotificationViewService"]
                        || [executablePath rangeOfString:@".appex/"].location != NSNotFound;
            if ((!isFileProvider && isApplication && !skip) || isSpringboard) {
                shouldLoad = YES;
            }
        }
    }

	if (!shouldLoad) return;

    preferences = [[HBPreferences alloc] initWithIdentifier:@"love.litten.butterflypreferences"];
    preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile: @"/var/mobile/Library/Preferences/love.litten.butterflypreferences.plist"];

    [preferences registerBool:&enabled default:nil forKey:@"Enabled"];

    // Cursor
    [preferences registerBool:&cursorColorSwitch default:NO forKey:@"cursorColor"];
    [preferences registerBool:&useCustomCursorColorSwitch default:NO forKey:@"useCustomCursorColor"];
    [preferences registerObject:&customCursorString default:@"#147efb" forKey:@"customCursorColor"];
    [preferences registerObject:&cursorAlphaLevel default:@"1.0" forKey:@"cursorAlpha"];

    // Highlight Color
    [preferences registerBool:&highlightColorSwitch default:NO forKey:@"highlightColor"];
    [preferences registerBool:&useCustomHighlightColorSwitch default:NO forKey:@"useCustomHighlightColor"];
    [preferences registerObject:&customHighlightString default:@"#147efb" forKey:@"customHighlightColor"];
	[preferences registerObject:&highlightColorAlphaLevel default:@"0.1" forKey:@"highlightColorAlpha"];

    // Scroll Indicator Color
    [preferences registerBool:&scrollIndicatorColorSwitch default:NO forKey:@"scrollIndicatorColor"];
    [preferences registerBool:&useCustomScrollIndicatorColorSwitch default:NO forKey:@"useCustomScrollIndicatorColor"];
    [preferences registerObject:&customScrollIndicatorColorString default:@"#147efb" forKey:@"customScrollIndicatorColor"];
	[preferences registerObject:&scrollIndicatorAlphaLevel default:@"0.4" forKey:@"scrollIndicatorAlpha"];

    // StatusBar Pill
    [preferences registerBool:&pillColorSwitch default:NO forKey:@"pillColor"];
    [preferences registerBool:&useCustomPillColorSwitch default:NO forKey:@"useCustomPillColor"];
    [preferences registerObject:&customPillString default:@"#147efb" forKey:@"customPillColor"];
    [preferences registerObject:&pillAlphaLevel default:@"1.0" forKey:@"pillAlpha"];

    // Overall Color
    [preferences registerObject:&colorString default:@"#147efb" forKey:@"color"];
    [preferences registerObject:&selectedPreset default:@"0" forKey:@"selectedPresetList"];
    [preferences registerBool:&useRandomColorSwitch default:NO forKey:@"useRandomColor"];

    if (enabled) {
        if (cursorColorSwitch) %init(Cursor);
        if (highlightColorSwitch) %init(Highlight);
        if (scrollIndicatorColorSwitch) %init(ScrollIndicator);
        if (pillColorSwitch) %init(StatusBarPill);
    }

}