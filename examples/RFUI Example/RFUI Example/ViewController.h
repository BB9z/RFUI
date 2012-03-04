/*!
  ViewController.h
  RFUI Example
*/

#import <UIKit/UIKit.h>
#import "RFImageTimeTunnel.h"
#import "RFPageNavigator.h"

@interface ViewController : UIViewController <RFPageRreviewNavigatorDataSource> {
	
	IBOutlet UIImageView * v1;
	IBOutlet UIImageView * v2;
	IBOutlet UIImageView * v3;
	IBOutlet UIImageView * v4;
	IBOutlet UIImageView * v5;
}
@property (nonatomic, strong) RFPageNavigator *vcPRN;
@property (nonatomic, strong) RFImageTimeTunnel * vcITT;;
@end
