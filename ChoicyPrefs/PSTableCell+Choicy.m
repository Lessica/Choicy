#import "PSTableCell+Choicy.h"
#import "PSSpecifier+Choicy.h"

@implementation PSTableCell (Choicy)

- (void)choicy_addSearchHighlights:(NSString *)searchText toLabel:(UILabel *)targetLabel
{
    NSString *text = targetLabel.text;
    if (!text.length) {
        return;
    }

    UIFont *font = targetLabel.font;
    UIColor *color = targetLabel.textColor;

    if (!font || !color) {
        return;
    } 

    NSDictionary *textAttrs = @{
        NSFontAttributeName : font,
        NSForegroundColorAttributeName : color,
    };

    NSMutableAttributedString *mText = [[NSMutableAttributedString alloc] initWithString:text attributes:textAttrs];
    if (searchText.length > 0) {
        UIColor *tintColor = [UIColor colorWithRed:250.0 / 255.0
                                             green:229.0 / 255.0
                                              blue:93.0 / 255.0
                                             alpha:1.0];

        NSRange searchRange = [text rangeOfString:searchText options:NSCaseInsensitiveSearch | NSDiacriticInsensitiveSearch
                                            range:NSMakeRange(0, text.length)];
        if (searchRange.location != NSNotFound) {
            [mText addAttributes:@{
                NSBackgroundColorAttributeName : tintColor,
                NSForegroundColorAttributeName : [UIColor blackColor],
            } range:searchRange];
        }
    }

    [targetLabel setAttributedText:mText];
}

- (void)choicy_addSearchHighlights
{
    if (![self.specifier.userInfo isKindOfClass:[NSDictionary class]]) {
        return;
    }

    NSString *searchText = [self.specifier userInfo][@"searchKey"];
    [self choicy_addSearchHighlights:searchText toLabel:self.textLabel];

    BOOL shouldHighlightSubtitle = [[self.specifier userInfo][@"includeIdentifiersInSearch"] boolValue];
    [self choicy_addSearchHighlights:(shouldHighlightSubtitle ? searchText : @"") toLabel:self.detailTextLabel];
}

@end