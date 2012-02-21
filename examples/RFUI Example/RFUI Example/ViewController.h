/*!
  ViewController.h
  RFUI Example
*/

#import <UIKit/UIKit.h>
#import "RFImageTimeTunnel.h"

@interface ViewController : UIViewController {
	RFImageTimeTunnel * vcITT;
}
@property (nonatomic, strong) RFImageTimeTunnel * vcITT;

@end
