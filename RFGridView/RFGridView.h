//
//  RFGridView.h
//  imed3
//
//  Created by 九州 赵 on 12-3-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RFUI.h"


@interface RFGridView : UIScrollView {
	NSUInteger exceptCount;
	CGSize subviewSize_;
	
	CGFloat marginTop_;
	CGFloat marginRight_;
	CGFloat marginBottom_;
	CGFloat marginLeft_;
	
	BOOL _isAfterSelfScrollLoading;
	 
}
@property (nonatomic) RFUIOrientation orientation;
@property (nonatomic) CGSize subviewSize;
@property (nonatomic) CGFloat marginTop;
@property (nonatomic) CGFloat marginRight;
@property (nonatomic) CGFloat marginBottom;
@property (nonatomic) CGFloat marginLeft;

/**
 The default implementation of this method does nothing.
 
 Subclasses can override this method as needed to perform additional initialization on this view were loaded.
 */
- (void)viewDidLoad;

@end

