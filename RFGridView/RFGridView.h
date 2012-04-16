/*!
	RFUI
	RFGridView
	
	ver 0.2.1
 */
#import "RFUI.h"

@interface RFGridView : UIScrollView {
	BOOL isSizeSet;
	
	CGFloat lastViewWidth;
	CGFloat lastViewHeight;

	bool layoutFlag;
}
@property (nonatomic) RFUIOrientation orientation;
@property (nonatomic) CGSize subviewSize;
@property (nonatomic) RFMargin margin;
@property (nonatomic) BOOL layoutAnimated;

/**
    Views added to this view will layout as grid
 */
@property (strong, nonatomic) IBOutlet UIView * container;

/**
 Call this after you modify container's subview
 */
- (void)setNeedsLayout;
@end

