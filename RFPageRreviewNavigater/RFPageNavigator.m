#import "RFPageNavigator.h"
#import "TouchImage.h"

@interface RFPageNavigator ()
- (void)doSetupHolderWithIndex:(NSUInteger)index section:(NSUInteger)section;
- (IBAction)onToggleButtonClicked:(id)sender;
@end

@implementation RFPageNavigator
@synthesize isPanelShow;
@synthesize delegate = delegate_;
@synthesize index = ixCurrent;
@synthesize vController, vContent;
@synthesize pageScroller;

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

//	CGRect bound = vContent.bounds;
	
//	vC1 = [[UIView alloc] initWithFrame:bound];
//	vC1.backgroundColor = [UIColor blueColor];
//	vC2 = [[UIView alloc] initWithFrame:bound];
//	vC3 = [[UIView alloc] initWithFrame:bound];
//	[vContent addSubview:vC1];
//	[vContent addSubview:vC2];
//	[vContent addSubview:vC3];
	isPanelShow = YES;
	vHolder0.master = self;
	vHolder1.master = self;
	vHolder2.master = self;
	
	ttt00.master = self;
	ttt0.master = self;
	ttt1.master = self;
	ttt2.master = self;
	ttt3.master = self;
	ttt4.master = self;
	ttt00.ixPage = 0;
	ttt0.ixPage = 1;
	ttt1.ixPage = 2;
	ttt2.ixPage = 3;
	ttt3.ixPage = 4;
	ttt4.ixPage = 5;
}

// delegate .set 后才能真正开始处理
//- (void)setDelegate:(id<RFPageRreviewNavigatorDataSource>)aDelegate {
//	@autoreleasepool {
//		cnPage = [aDelegate navigator:self numberOfViewsInSection:0];
//		delegate_ = aDelegate;
//		
//		[self performSelector:@selector(delay) withObject:nil afterDelay:0];
//	}
//	doutwork()
//	
//}

- (void)delay {
	ixCurrent = 0;
	if (cnPage > 0) {
		[vHolder0 bringToFront];
		
//		vSource0 = [delegate_ navigator:self viewForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
//		[vSource1 removeFromSuperview];
//		[vHolder0 addSubview:vSource0];
		
		navigatePanel.contentSize = CGSizeMake(cnPage*200, 0.f);
	}
	
	UITapGestureRecognizer * grTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
	grTap.numberOfTapsRequired = 1;
	[self.view addGestureRecognizer:grTap];
}

- (void)onTap:(UITapGestureRecognizer *)sender {
	[self onToggleButtonClicked:nil];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
}

- (void)viewDidUnload {
    [super viewDidUnload];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}                               

- (UIView *)getContentViewByIndex:(NSUInteger)index {
	// 防止负值
	switch ((index+3)%3) {
		case 0:
			return vHolder0;
			break;
			
		case 1:
			return vHolder1;
			break;
			
		case 2:
			return vHolder2;
			break;
	}
	return nil;
}

- (UIView *)getSourceViewByIndex:(NSUInteger)index {
	// 防止负值
	switch ((index+3)%3) {
		case 0:
			return vSource0;
			break;
			
		case 1:
			return vSource1;
			break;
			
		case 2:
			return vSource2;
			break;
	}
	return nil;
}

- (void)goLeft {
}

- (void)goRight {

}

- (void)goTo:(NSUInteger)index {
	if (index == ixCurrent) return;
	if (index == ixCurrent+1) {
		[self goRight];
		return;
	}
	if (index == ixCurrent-1) {
		[self goLeft];
		return;
	}
	[self doSetupHolderWithIndex:index section:0];
}

- (void)doSetupHolderWithIndex:(NSIndexPath *)indexPath {
	NSUInteger ixShould = indexPath.row;
	
	
	if (ixShould == 0) {
		
	}
	else if (ixShould >= cnPage) {
		
	}
	else {
		
	}
}

- (void)doSetupHolderWithIndex:(NSUInteger)index section:(NSUInteger)section {
	if (index == ixCurrent) {
		return;
	}
//	RFPageNavigatorHolderView * tmp;
//	tmp = [self getContentViewByIndex:ixCurrent];
//	[tmp loadViewAtIndex:ixCurrent];
}

- (void)doSetupViewWithIndex:(NSUInteger)index section:(NSUInteger)section {
	if (index) {
	}
	ixCurrent = index;
}

- (void)showPanel:(BOOL)animated {
	float distance = self.pageScroller.bounds.size.height + 22;
	[self.pageScroller bringAboveView:vContent];
	if (animated) {
		[UIView animateWithDuration:0.5f delay:0.f options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState  animations:^{
			[navigatePanel moveX:0 Y:-distance];
		} completion:^(BOOL finished) {
			isPanelShow = YES;
		}];

	}
	else {
		[navigatePanel moveX:0 Y:-distance];
		isPanelShow = YES;
	}
}



- (void)hidePanel:(BOOL)animated {
	
	if (animated) {
		[UIView animateWithDuration:0.5f delay:0.f options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState  animations:^{
			[navigatePanel moveToX:CGFLOAT_MAX Y:navigatePanel.superview.bounds.size.height];
		} completion:^(BOOL finished) {
			isPanelShow = NO;
			[self.pageScroller sentBelowView:vContent];
		}];
	}
	else {
		[navigatePanel moveToX:CGFLOAT_MAX Y:navigatePanel.superview.bounds.size.height];
		isPanelShow = NO;
		[self.pageScroller sentBelowView:vContent];
	}
}

- (IBAction)onToggleButtonClicked:(id)sender {
	if(isPanelShow == YES) {
		[self hidePanel:YES];
	}
	else {
		[self showPanel:YES];
	}
}

- (void)onPageSelected:(NSUInteger)index {
	[vContent removeAllSubviews];
	UIView * tmp = [self.delegate navigator:self viewForRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
	tmp.frame = vContent.frame;
	[vContent addSubview:tmp];
	[self hidePanel:YES];
}

@end

@implementation RFPageNavigatorPreviewView
@synthesize index;
@synthesize master;

- (id)initWithMaster:(RFPageNavigator *)vc {
	doutwork()
	CGFloat height = vc.vController.bounds.size.height;
	self = [super initWithFrame:CGRectMake(0, 0, height/3*4, height)];
    if (self) {
		self.master = vc;
    }
    return self;
}




@end


@implementation RFPageNavigatorHolderView
@synthesize ixPage;
@synthesize master;


- (id)initWithCoder:(NSCoder *)aDecoder {
	
    if (self) {
        // Initialization code
		ixPage = -1;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
	doutwork()
	
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib {
}

- (void)loadViewAtIndex:(NSUInteger)index {
	if (index != self.ixPage) { 
		[self.master.delegate navigator:self.master viewForRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
		self.ixPage = index;
	}
}

@end
