#import "RFGridView.h"

@implementation RFGridView
@synthesize subviewSize, margin = margin_;
@synthesize orientation;
@synthesize container = container_;
@synthesize layoutAnimated;

- (void)doAfterLoad {
	self.scrollEnabled = YES;
	self.userInteractionEnabled = YES;
	self.clipsToBounds = YES;
	self.contentSize = CGSizeMake(0, 1000);
	self.orientation = RFUIOrientationVertical;
	self.layoutAnimated = YES;
	self.container = [[UIView alloc] initWithFrame:self.bounds];
	container_.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
	[self addSubview:container_];
	container_.backgroundColor = [UIColor clearColor];
	
	[self setNeedsLayout];
}

- (id)initWithFrame:(CGRect)aRect {
	self = [super initWithFrame:aRect];
	if (self) {
		[self doAfterLoad];
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if (self) {
		[self doAfterLoad];
	}
	return self;
}

#pragma mark -
- (void)layoutSubviews {
	bool flag = layoutFlag;

	if (self.orientation == RFUIOrientationHorizontal && self.bounds.size.width != lastViewWidth) flag = true;
	lastViewWidth = self.bounds.size.width;
	if (self.orientation == RFUIOrientationVertical && self.bounds.size.height != lastViewHeight) flag = true;
	lastViewHeight = self.bounds.size.height;
	
	if (!isSizeSet) flag = false;
	if (flag) {
		BOOL _layoutAnimated = self.layoutAnimated;
		if (_layoutAnimated) {
			[UIView beginAnimations:@"RFGridViewLayoutAnimation" context:nil];
			[UIView setAnimationDuration:0.5];
		}
		
		CGFloat swSubview = subviewSize_.width;
		CGFloat shSubview = subviewSize_.height;
		
		CGFloat marginLeft = margin_.left;
		CGFloat marginRight = margin_.right;
		CGFloat marginTop = margin_.top;
		CGFloat marginBottom = margin_.bottom;
		
		CGFloat mmarginHorizontal = MAX(marginLeft, marginRight);
		CGFloat mmarginVertical = MAX(marginBottom, marginTop);
		
		NSUInteger nCount = container_.subviews.count;
		NSUInteger ixCol;
		NSUInteger ixRow;
		
		UIView *tmp_view;
		if (self.orientation != RFUIOrientationHorizontal) {
			CGFloat vWidth = lastViewWidth;
			NSUInteger nWidth = (vWidth-marginLeft-marginRight+mmarginVertical) / (subviewSize_.width+mmarginVertical);
			if (nWidth == 0) {
				nWidth = 1;
			}
			for (int i=0; i<nCount; i++) {
				tmp_view = [container_.subviews objectAtIndex:i];
				ixCol = i%nWidth;
				ixRow = i/nWidth;
				tmp_view.frame = CGRectMake(marginLeft + ixCol*(swSubview+mmarginHorizontal), marginTop +  ixRow*(shSubview+mmarginHorizontal), swSubview, shSubview);
				_dout_rect(tmp_view.frame)
			}
			[container_ resizeWidth:lastViewWidth height:(ixRow+1)*(subviewSize_.height+mmarginVertical)-mmarginVertical+marginTop+marginBottom];
			self.contentSize = container_.bounds.size;
		}
		else {
			CGFloat vHeight = lastViewHeight;
			NSUInteger nHeight = (vHeight-marginTop-marginBottom+mmarginVertical) / (subviewSize_.height+mmarginVertical);
			if (nHeight == 0) {
				nHeight = 1;
			}
			for (int i=0; i<nCount; i++) {
				tmp_view = [container_.subviews objectAtIndex:i];
				ixRow = i%nHeight;
				ixCol = i/nHeight;
				tmp_view.frame = CGRectMake(marginLeft + ixCol*(swSubview+mmarginVertical), marginTop +  ixRow*(shSubview+mmarginVertical), swSubview, shSubview);
			}
			[container_ resizeWidth:(ixCol+1)*(swSubview+mmarginHorizontal)-mmarginVertical+marginTop+marginBottom height:lastViewHeight];
			self.contentSize = container_.bounds.size;
		}
		layoutFlag = false;
		if (_layoutAnimated) {
			[UIView commitAnimations];
		}
	}
	[super layoutSubviews];
}

#pragma mark -
- (void)setSubviewSize:(CGSize)aSubviewSize {
	if (aSubviewSize.width > 0 && aSubviewSize.height > 0) {
		isSizeSet = YES;
		subviewSize_ = aSubviewSize;
		layoutFlag = YES;
	}
}

- (void)setMargin:(RFMargin)newMargin {
	if (!RFMarginEqualToMargin(margin_, newMargin)) {
		margin_ = newMargin;
		layoutFlag = YES;
	}
}

- (void)setNeedsLayout {
	if (!layoutFlag) {
		layoutFlag = true;
	}
	[super setNeedsLayout];
}

@end
