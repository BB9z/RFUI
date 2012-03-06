#import "RFGridView.h"

@implementation RFGridView
@synthesize subviewSize;
@synthesize marginTop = marginTop_, marginRight = marginRight_, marginBottom = marginBottom_, marginLeft = marginLeft_;
@synthesize orientation;
@synthesize container;

- (id)initWithFrame:(CGRect)aRect {
	self = [super initWithFrame:aRect];
	if (self) {
		[self performSelector:@selector(doAfterLoad) withObject:self afterDelay:0];
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if (self) {
		[self performSelector:@selector(doAfterLoad) withObject:self afterDelay:0];
	}
	return self;
}

- (void)doAfterLoad {
	douts(@"RFGridView doAfterLoad");
	[self viewDidLoad];
	
	inExceptCount = self.subviews.count;
	
	self.scrollEnabled = YES;
	self.userInteractionEnabled = YES;
	self.clipsToBounds = YES;
	self.contentSize = CGSizeMake(0, 1000);
	
	container = [[UIView alloc] initWithFrame:self.bounds];
	container.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
	[self addSubview:container];
	container.backgroundColor = [UIColor clearColor];
	 _isAfterSelfScrollLoaded = YES;
}

- (void)viewDidLoad {
	// Do nothing here
	// Just leave this for subclasses
}

- (void)addSubview:(UIView *)view {
	if (_isAfterSelfScrollLoaded) {
		dout(@"Add to ct: %@",view)
		[container addSubview:view];
	}
	else {
		[super addSubview:view];
	}
}

- (void)didAddSubview:(UIView *)subview {
	doutwork()
	[super didAddSubview:subview];
}

- (void)willRemoveSubview:(UIView *)subview {
}

- (void)layoutSubviews {
	bool flag = false;
	
	
	if (self.orientation == RFUIOrientationHorizontal && self.bounds.size.width != lastViewWidth) flag = true;
	lastViewWidth = self.bounds.size.width;
	if (self.orientation == RFUIOrientationVertical && self.bounds.size.height != lastViewHeight) flag = true;
	lastViewHeight = self.bounds.size.height;
	
	if (!isSizeSet) flag = false;
	if (flag) {
		
		
//		CGFloat mmarginHorizontal = MAX(marginLeft_, marginRight_);
		CGFloat mmarginVertical = MAX(marginBottom_, marginTop_);
		CGFloat swSubview = subviewSize_.width;
		CGFloat shSubview = subviewSize_.height;
		
		NSUInteger nCount = container.subviews.count;
		UIView * tmp_view;
		
		if (self.orientation == RFUIOrientationHorizontal) {
			CGFloat vWidth = lastViewWidth;
			NSUInteger nWidth = (vWidth-marginLeft_-marginRight_+mmarginVertical) / (subviewSize_.width+mmarginVertical);
			
			NSUInteger ixCol;
			NSUInteger ixRow;
			for (int i=0; i<nCount; i++) {
				tmp_view = [container.subviews objectAtIndex:i];
				ixCol = i%nWidth;
				ixRow = i/nWidth;
				CGRect tmp_frame = CGRectMake(marginLeft_ + ixCol*(swSubview+mmarginVertical), marginTop_ +  ixRow*(shSubview+mmarginVertical), swSubview, shSubview);
				dout_rect(tmp_frame);
				tmp_view.frame = tmp_frame;
			}
			[container resizeWidth:lastViewWidth height:(ixRow+1)*(subviewSize_.height+mmarginVertical)-mmarginVertical+marginTop_+marginBottom_];
			self.contentSize = container.bounds.size;
		}
		else {
//			CGFloat vHeight = lastViewHeight;
//			NSUInteger nHeight = (vHeight-marginTop_-marginBottom_+mmarginVertical) / (subviewSize_.height+mmarginVertical);
		}
	}


	[super layoutSubviews];
}


#pragma mark -

- (void)setSubviewSize:(CGSize)aSubviewSize {
	if (aSubviewSize.width > 0 && aSubviewSize.height > 0) {
		isSizeSet = YES;
	}
	subviewSize_ = aSubviewSize;
	[self setNeedsLayout];
}

- (void)setMargin:(CGFloat)margin {
	marginBottom_ = margin;
	marginLeft_ = margin;
	marginRight_ = margin;
	marginTop_ = margin;
	[self setNeedsLayout];
}

- (void)setMarginTop:(CGFloat)marginTop {
	marginTop_ = marginTop;
	[self setNeedsLayout];
}

- (void)setMarginRight:(CGFloat)marginRight {
	marginRight_ = marginRight;
	[self setNeedsLayout];
}

- (void)setMarginBottom:(CGFloat)marginBottom {
	marginBottom_ = marginBottom;
	[self setNeedsLayout];
}

- (void)setMarginLeft:(CGFloat)marginLeft {
	marginLeft_ = marginLeft;
	[self setNeedsLayout];
}



@end
