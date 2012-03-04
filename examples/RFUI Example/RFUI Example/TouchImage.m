#import "TouchImage.h"
#import "RFPageNavigator.h"
#import <QuartzCore/QuartzCore.h>

@interface TouchImage ()
- (void)touchStart;
- (void)touchEnd;
@end

@implementation TouchImage
@synthesize master, ixPage;


- (id)initWithImage:(UIImage *)image {
	self = [super initWithImage:image];
	if (self) {
		tNoPinch = YES;
		
		[self performSelector:@selector(doAfterLoad) withObject:nil afterDelay:0];
	}
	return self;
}

- (void)didMoveToSuperview {
//	doutwork()
}

- (void)awakeFromNib {
	[self performSelector:@selector(doAfterLoad) withObject:nil afterDelay:0];
	self.userInteractionEnabled = YES;
}

- (void)doAfterLoad {
	doutwork()
	UITapGestureRecognizer * grTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
	grTap.numberOfTapsRequired = 1;
	[self addGestureRecognizer:grTap];
	
	UIRotationGestureRecognizer * grRt = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(onRt:)];
	grRt.delegate = self;
	[self addGestureRecognizer:grRt];
	
	UIPinchGestureRecognizer * grPc = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(onPc:)];
	grPc.delegate = self;
	[self addGestureRecognizer:grPc];
}

- (void)setupMaster:(RFPageNavigator *)vc index:(NSUInteger)index {
	self.master = vc;
	self.ixPage = index;
}

- (void)onTap:(id)sender {
	douto(sender)
	[self.master onPageSelected:ixPage];
}

- (void)onRt:(UIRotationGestureRecognizer *)sender {
	if (sender.state == UIGestureRecognizerStateBegan) {
		[self touchStart];
	}
	else if (sender.state == UIGestureRecognizerStateChanged) {
		self.transform = CGAffineTransformMakeRotation(sender.rotation/1.5);
	}
	else { // END Rotation
		if (tNoPinch) {
			[UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
				self.transform = CGAffineTransformMakeRotation(0);
			} completion:^(BOOL finished) {
			}];
		}
		[self touchEnd];
	}
	
}


- (void)onPc:(UIPinchGestureRecognizer *)sender {
	if (sender.state == UIGestureRecognizerStateBegan) {
		[self touchStart];
		
		[self.master.view addSubview:self];
		self.center = CGPointOfRectCenter(tStartFrameInMaster);
		tNoPinch = NO;
	}
	else if (sender.state == UIGestureRecognizerStateChanged) {
		float scale = sender.scale;
		float ratio;

		self.bounds = CGRectScaled(tOrgBondes, scale*2);
		
		CGPoint should = [sender locationInView:self.master.view];
		self.center = should;
		if (scale < 1.5) {
			self.center = should;
		}
		else {
			
			if (scale > 2.5) {
				ratio = 1;
			}
			else {
				ratio = sender.scale - 1.5;
			}
			self.center = CGPointAtLineRatio(should, self.master.view.center, ratio);
		}
		
	}
	else {	// END Pinch

		tNoPinch = YES;
		if ((sender.scale + sender.velocity*1.5)>3) {
			
			
			[UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
				self.frame = self.master.vContent.bounds;
				self.bounds = self.master.vContent.bounds;
				self.transform = CGAffineTransformMakeRotation(0);
			} completion:^(BOOL finished) {
				[self.master onPageSelected:ixPage];
				[UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
					self.alpha = 0;
				} completion:^(BOOL finished) {
					self.alpha = 1;
					[self.master.pageScroller addSubview:self];
					self.bounds = tOrgBondes;
					self.frame = tOrgFrame;
					
				}];
			}];

		}
		else {
			[UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
				self.frame = tStartFrameInMaster;
				self.bounds = tOrgBondes;
				self.transform = CGAffineTransformMakeRotation(0);
			} completion:^(BOOL finished) {
				[self.master.pageScroller addSubview:self];
				self.frame = tOrgFrame;

			}];
		}
		
		[self touchEnd];
	}
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
	return YES;
}

- (void)touchStart {
	if (touchCount++ == 0) {
		self.layer.shadowOpacity = 0.5f;
		self.master.pageScroller.scrollEnabled = NO;
		
		
		tOrgBondes = self.bounds;
		tOrgFrame = self.frame;
		
		self.layer.shouldRasterize = YES;
		tStartFrameInMaster = [self.master.view	convertRect:self.frame fromView:self.superview];
	}
}

- (void)touchEnd {
	if (--touchCount == 0) {
		self.layer.shadowOpacity = 0.f;
		self.master.pageScroller.scrollEnabled = YES;
		
		tNoPinch = YES;
	}
}

@end
