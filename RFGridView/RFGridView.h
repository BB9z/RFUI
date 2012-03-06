/*!
	RFUI
	RFGridView
	
	ver 0.0.0
 */
#import "RFUI.h"


@interface RFGridView : UIScrollView {
	NSUInteger inExceptCount;
	CGSize subviewSize_;
	
	CGFloat marginTop_;
	CGFloat marginRight_;
	CGFloat marginBottom_;
	CGFloat marginLeft_;
	
	BOOL _isAfterSelfScrollLoaded;
	BOOL isSizeSet;
	
	CGFloat lastViewWidth;
	CGFloat lastViewHeight;
	
	UIView * container;
}
@property (nonatomic) RFUIOrientation orientation;
@property (nonatomic) CGSize subviewSize;
@property (nonatomic) CGFloat marginTop;
@property (nonatomic) CGFloat marginRight;
@property (nonatomic) CGFloat marginBottom;
@property (nonatomic) CGFloat marginLeft;
@property (readonly, nonatomic) UIView * container;

/**
 The default implementation of this method does nothing.
 
 Subclasses can override this method as needed to perform additional initialization on this view were loaded.
 */
- (void)viewDidLoad;

- (void)setSubviewSize:(CGSize)aSubviewSize;
- (void)setMargin:(CGFloat)margin;

@end

