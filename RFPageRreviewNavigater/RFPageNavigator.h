/*!
  RFUI PageRreviewNavigater
  ver 0.0.0
*/


@class TouchImage;
@class RFPageNavigator, RFPageNavigatorHolderView;

@protocol RFPageRreviewNavigatorDataSource<NSObject>

  @required
	- (UIView *)navigator:(RFPageNavigator *)aNavigator viewForRowAtIndexPath:(NSIndexPath *)indexPath;
	- (NSInteger)navigator:(RFPageNavigator *)aNavigator numberOfViewsInSection:(NSInteger)section;


	- (NSInteger)numberOfSectionsInNavigator:(RFPageNavigator *)aNavigator;

@optional
@end

@interface RFPageNavigator : UIViewController<UIScrollViewDelegate> {
	
	
  @protected
	IBOutlet RFPageNavigatorHolderView * vHolder0;
	IBOutlet RFPageNavigatorHolderView * vHolder1;
	IBOutlet RFPageNavigatorHolderView * vHolder2;
	
	UIView * vSource0;
	UIView * vSource1;
	UIView * vSource2;
	
	NSMutableArray *viewArray;
	
	IBOutlet UIView * vContent;
	IBOutlet UIView * vController;
	IBOutlet UIButton *toggleButton;
	IBOutlet UIScrollView *navigatePanel;
	
	NSUInteger ixCurrent;
	NSUInteger cnPage;
	
	IBOutlet TouchImage * ttt00;
	IBOutlet TouchImage * ttt0;
	IBOutlet TouchImage * ttt1;
	IBOutlet TouchImage * ttt2;
	IBOutlet TouchImage * ttt3;
	IBOutlet TouchImage * ttt4;
	
}
@property (strong, nonatomic) IBOutlet UIScrollView *pageScroller;
@property (readonly, nonatomic) UIView * vContent;
@property (readonly, nonatomic) UIView * vController;
@property (readonly, nonatomic) NSUInteger index;
@property (readonly, nonatomic) BOOL isPanelShow;
@property (nonatomic, assign) id<RFPageRreviewNavigatorDataSource> delegate;


- (id)init;
- (void)showPanel:(BOOL)animated;
- (void)hidePanel:(BOOL)animated;

- (void)onPageSelected:(NSUInteger)index;
@end






@interface RFPageNavigatorHolderView : UIView
@property (readwrite, nonatomic) int ixPage;
@property (nonatomic, assign) RFPageNavigator *master;

- (void)loadViewAtIndex:(NSUInteger)index;
@end






@interface RFPageNavigatorPreviewView : UIImageView
@property (assign, nonatomic) NSUInteger index;
@property (assign, nonatomic) RFPageNavigator *master;
@end