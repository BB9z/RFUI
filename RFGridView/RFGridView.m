//
//  RFGridView.m
//  imed3
//
//  Created by 九州 赵 on 12-3-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RFGridView.h"

@implementation RFGridView
@synthesize subviewSize;
@synthesize marginTop = marginTop_, marginRight = marginRight_, marginBottom = marginBottom_, marginLeft = marginLeft_;
@synthesize orientation;

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
	_isAfterSelfScrollLoading = YES;
	exceptCount = self.subviews.count;
}

- (void)viewDidLoad {
	doutwork()
	// Do nothing here
	// Just leave this for subclasses
	UIView * tmp = [[UIView alloc] initWithFrame:CGRectMake(5, 5, 20, 20)];
	tmp.backgroundColor = [UIColor redColor];
	[self addSubview:tmp];

}

- (void)addSubview:(UIView *)view {
	if (_isAfterSelfScrollLoading) {
		doutwork()
		douto(view)
	}
	[super addSubview:view];
}

- (void)didAddSubview:(UIView *)subview {
	doutwork()
	[super didAddSubview:subview];
}

- (void)willRemoveSubview:(UIView *)subview {
}

- (void)layoutSubviews {
	[super layoutSubviews];
	self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
}



- (void)setSubviewSize:(CGSize)aSubviewSize {
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
