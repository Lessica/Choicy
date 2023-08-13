#import "CHPDaemonCell.h"
#import "PSTableCell+Choicy.h"

@implementation CHPDaemonCell

- (void)refreshCellContentsWithSpecifier:(PSSpecifier*)specifier
{
	[super refreshCellContentsWithSpecifier:specifier];
	[self choicy_addSearchHighlights];
}

@end