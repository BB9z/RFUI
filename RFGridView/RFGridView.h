/*!
	RFUI
	RFGridView
	
	ver 0.2.0
 */
#import "RFUI.h"

@interface RFGridView : UIScrollView {
	BOOL isSizeSet;
	CGSize subviewSize_;
	
	RFMargin margin_;
	
	CGFloat lastViewWidth;
	CGFloat lastViewHeight;
	
	UIView * container_;
	bool layoutFlag;
}
@property (nonatomic) RFUIOrientation orientation;
@property (nonatomic) CGSize subviewSize;
@property (nonatomic) RFMargin margin;
@property (nonatomic) BOOL layoutAnimated;

/**
 
 */
@property (strong, nonatomic) UIView * container;

/**
 Call this after you modify container's subview
 */
- (void)setNeedsLayout;
@end

