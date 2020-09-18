#import <UIKit/UIKit.h>
#import <Cephei/HBPreferences.h>
#import "SparkColourPickerUtils.h"

HBPreferences *preferences;
NSDictionary* preferencesDictionary;

extern BOOL enabled;

// Cursor
BOOL cursorColorSwitch = NO;
NSString* customCursorString = @"#147efb";
NSString* cursorAlphaLevel = @"1.0";
BOOL smoothCursorMovementSwitch = NO;

// Highlight Color
BOOL highlightColorSwitch = NO;
NSString* customHighlightString = @"#147efb";
NSString* highlightColorAlphaLevel = @"0.1";

// Scroll Indicator
BOOL scrollIndicatorColorSwitch = NO;
NSString* customScrollIndicatorColorString = @"#147efb";
NSString* scrollIndicatorAlphaLevel = @"0.4";

// StatusBar Pill
BOOL pillColorSwitch = NO;
NSString* customPillString = @"#147efb";
NSString* pillAlphaLevel = @"1.0";

@interface UITextSelectionView : UIView
- (UIView *)caretView;
@end