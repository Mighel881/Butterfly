#import <UIKit/UIKit.h>
#import <Cephei/HBPreferences.h>
#import "SparkColourPickerUtils.h"

HBPreferences *preferences;
NSDictionary* preferencesDictionary;

extern BOOL enabled;

// Cursor
BOOL cursorColorSwitch = NO;
BOOL useCustomCursorColorSwitch = NO;
NSString* customCursorString = @"#147efb";
NSString* cursorAlphaLevel = @"1.0";

// Highlight Color
BOOL highlightColorSwitch = NO;
BOOL useCustomHighlightColorSwitch = NO;
NSString* customHighlightString = @"#147efb";
NSString* highlightColorAlphaLevel = @"0.1";

// Scroll Indicator
BOOL scrollIndicatorColorSwitch = NO;
BOOL useCustomScrollIndicatorColorSwitch = NO;
NSString* customScrollIndicatorColorString = @"#147efb";
NSString* scrollIndicatorAlphaLevel = @"0.4";

// StatusBar Pill
BOOL pillColorSwitch = NO;
BOOL useCustomPillColorSwitch = NO;
NSString* customPillString = @"#147efb";
NSString* pillAlphaLevel = @"1.0";

// Color Options
NSString* colorString = @"#147efb";
NSString* selectedPreset = @"0";
NSString* presetHex;
NSString* presetHex2;
BOOL useRandomColorSwitch = NO;
int randomNumber;