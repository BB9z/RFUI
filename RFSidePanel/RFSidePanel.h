/*!
	RFUI SidePanel
	ver 0.1.1
 */

#import <UIKit/UIKit.h>

@interface RFSidePanel : UIViewController {
	IBOutlet UIView * vMaster;
	IBOutlet UIImageView * vBarBg;
	IBOutlet UIButton * vBarButton;
	
	UIView * root_;
	BOOL isShow_;
}
@property (nonatomic, retain) UIView * vMaster;
@property (nonatomic, assign) UIView * root;
@property (nonatomic, assign) BOOL isShow;

- (id)initWithManagedView:(UIView *)root;

- (void)show:(BOOL)animated;
- (void)hide:(BOOL)animated;

// 返回是否显示
- (BOOL)toggle;
- (void)savePreferences;
@end
