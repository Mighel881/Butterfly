#import "Butterfly.h"

BOOL enabled;

%group Cursor

%hook UITextSelectionView

- (id)caretViewColor {

    if (cursorColorSwitch) {
        UIColor* customColor = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"customCursorColor"] withFallback:@"#147efb"];
        return [customColor colorWithAlphaComponent:[cursorAlphaLevel doubleValue]];
    } else {
        return %orig;
    }

}

- (id)floatingCaretViewColor {

    if (cursorColorSwitch) {
        UIColor* customColor = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"customCursorColor"] withFallback:@"#147efb"];
        return [customColor colorWithAlphaComponent:[cursorAlphaLevel doubleValue]];
    } else {
        return %orig;
    }

}

%end

%end

%group Highlight

%hook UITextInputTraits

- (void)setSelectionBarColor:(id)arg1 {

    if (highlightColorSwitch) {
         UIColor* customColor = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"customCursorColor"] withFallback:@"#147efb"];
        %orig([customColor colorWithAlphaComponent:[cursorAlphaLevel doubleValue]]);
    } else {
        %orig;
    }

}

- (UIColor *)selectionHighlightColor {

    if (highlightColorSwitch) {
        UIColor* customColor = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"customHighlightColor"] withFallback:@"#147efb"];
        return [customColor colorWithAlphaComponent:[highlightColorAlphaLevel doubleValue]];
    } else {
        return %orig;
    }

}

%end

%end

%group ScrollIndicator

%hook _UIScrollViewScrollIndicator

- (id)_colorForStyle:(long long)arg1 {

    if (scrollIndicatorColorSwitch) {
        UIColor* customColor = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"customScrollIndicatorColor"] withFallback:@"#147efb"];
        return [customColor colorWithAlphaComponent:[scrollIndicatorAlphaLevel doubleValue]];
    } else {
        return %orig;
    }

}

%end

%end

%group StatusBarPill

%hook _UIStatusBarPillView

- (void)setPillColor:(UIColor *)arg1 {
    
    if (pillColorSwitch) {
        UIColor* customColor = [SparkColourPickerUtils colourWithString:[preferencesDictionary objectForKey:@"customPillColor"] withFallback:@"#147efb"];
        %orig([customColor colorWithAlphaComponent:[pillAlphaLevel doubleValue]]);
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
    [preferences registerObject:&customCursorString default:@"#147efb" forKey:@"customCursorColor"];
    [preferences registerObject:&cursorAlphaLevel default:@"1.0" forKey:@"cursorAlpha"];

    // Highlight Color
    [preferences registerBool:&highlightColorSwitch default:NO forKey:@"highlightColor"];
    [preferences registerObject:&customHighlightString default:@"#147efb" forKey:@"customHighlightColor"];
	[preferences registerObject:&highlightColorAlphaLevel default:@"0.1" forKey:@"highlightColorAlpha"];

    // Scroll Indicator Color
    [preferences registerBool:&scrollIndicatorColorSwitch default:NO forKey:@"scrollIndicatorColor"];
    [preferences registerObject:&customScrollIndicatorColorString default:@"#147efb" forKey:@"customScrollIndicatorColor"];
	[preferences registerObject:&scrollIndicatorAlphaLevel default:@"0.4" forKey:@"scrollIndicatorAlpha"];

    // StatusBar Pill
    [preferences registerBool:&pillColorSwitch default:NO forKey:@"pillColor"];
    [preferences registerObject:&customPillString default:@"#147efb" forKey:@"customPillColor"];
    [preferences registerObject:&pillAlphaLevel default:@"1.0" forKey:@"pillAlpha"];

    if (enabled) {
        if (cursorColorSwitch) %init(Cursor);
        if (highlightColorSwitch) %init(Highlight);
        if (scrollIndicatorColorSwitch) %init(ScrollIndicator);
        if (pillColorSwitch) %init(StatusBarPill);
    }

}