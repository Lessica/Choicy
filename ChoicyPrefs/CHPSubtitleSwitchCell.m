#import "CHPSubtitleSwitchCell.h"
#import "PSTableCell+Choicy.h"

#import <Preferences/PSSpecifier.h>

@implementation CHPSubtitleSwitchCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier specifier:(PSSpecifier *)specifier
{
	self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier specifier:specifier];
	if (self) {
		self.detailTextLabel.text = [specifier propertyForKey:@"subtitle"];
	}
	return self;
}

- (void)refreshCellContentsWithSpecifier:(PSSpecifier*)specifier
{
	[super refreshCellContentsWithSpecifier:specifier];
	[self choicy_addSearchHighlights];
}

@end