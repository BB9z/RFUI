#import "ViewController.h"

@implementation ViewController
@synthesize vcITT;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	vcITT = [[RFImageTimeTunnel alloc] init];
	[self.view addSubview:vcITT.view];
	NSArray * imgs = [NSArray arrayWithObjects:
					  [UIImage resourceName:@"IMG_1184" ofType:@"jpg"],
					  [UIImage resourceName:@"IMG_1231" ofType:@"jpg"],
					  [UIImage resourceName:@"IMG_1242" ofType:@"jpg"],
					  [UIImage resourceName:@"IMG_1244" ofType:@"jpg"],
					  [UIImage resourceName:@"IMG_1175" ofType:@"jpg"],
					  nil];
	[vcITT setImagesWithUIImageArray:imgs];
}

- (void)viewDidUnload {
    [super viewDidUnload];
	
	self.vcITT = nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}



@end
