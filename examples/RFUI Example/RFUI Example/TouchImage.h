@class RFPageNavigator;
@interface TouchImage : UIImageView <UIGestureRecognizerDelegate>{
	
	CGPoint tStart1;
	CGPoint tStart2;
	
	NSUInteger tOrgSubviewIndex;
	NSTimer * touchTimer;
	
	float	tStartScaled;
	
	
	CGPoint tLastCenter;
	CGAngle tStartAngle;
	CGAngle tLastAngle;
	CGSize	tStartSize;
	
	CGRect	tOrgBondes;
	CGRect	tOrgFrame;
	CGRect	tStartFrameInMaster;
	
	BOOL	tNoPinch;
	BOOL	isTouching;
	int		touchCount;
}
@property (assign, nonatomic) RFPageNavigator *master;
@property (assign, nonatomic) NSUInteger ixPage;

- (void)setupMaster:(RFPageNavigator *)vc index:(NSUInteger)index;
@end

