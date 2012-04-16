/*!
    RFUI
    RFSlideNavigationController
 
    ver -.-.-
 */

#import "RFKit.h"

@protocol RFSlideNavigationControllerDelegate;

@interface RFSlideNavigationController : UIViewController<UIScrollViewDelegate> {
    CGFloat stackViewsWidthSum;
}
@property (readonly, nonatomic) IBOutlet UIScrollView * scrollContainer;
@property (readonly, nonatomic) NSMutableArray *stack;
@property (readonly, nonatomic) NSUInteger currentFocusedViewIndex;

- (void)pushView:(UIView *)view animated:(BOOL)animated;
- (UIView *)popViewAnimated:(BOOL)animated;
- (void)popAllViewAnimated:(BOOL)animated;

@end



@protocol RFSlideNavigationControllerDelegate <NSObject>

- (CGFloat)viewWidthForRFSlideNavigationController:(RFSlideNavigationController *)sender;
@end
