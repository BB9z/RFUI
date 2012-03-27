#import "ViewController.h"

@implementation ViewController
@synthesize vcPRN = vcPRN_;
@synthesize vcITT = vcITT_;

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	
	
	vcITT_ = [[RFImageTimeTunnel alloc] init];
//	[self.view addSubview:vcITT_.view];
	NSArray * imgs = [NSArray arrayWithObjects:
					  [UIImage resourceName:@"IMG_1184" ofType:@"jpg"],
					  [UIImage resourceName:@"IMG_1231" ofType:@"jpg"],
					  [UIImage resourceName:@"IMG_1242" ofType:@"jpg"],
					  [UIImage resourceName:@"IMG_1244" ofType:@"jpg"],
					  [UIImage resourceName:@"IMG_1175" ofType:@"jpg"],

					  nil];
	[vcITT_ setImagesWithUIImageArray:imgs];
	@autoreleasepool {
		self.vcPRN = [[RFPageNavigator alloc] initWithNibName:@"RFPageNavigator" bundle:nil];
		
//		[[RFPageNavigator alloc] init];
		
		[self performSelector:@selector(tttt) withObject:nil afterDelay:0];
	}
}

- (void)tttt {
	
	self.vcPRN.delegate = self;
	self.vcPRN.view.frame = CGRectMake(10, 10, 1000, 728);
	[self.view addSubview:self.vcPRN.view];
}

- (UIView *)navigator:(RFPageNavigator *)aNavigator viewForRowAtIndexPath:(NSIndexPath *)indexPath {
	dout_float(indexPath.row)
	switch (indexPath.row) {
		case 0:
			return self.vcITT.view;
			break;
		
		case 1:
			return v1;
			break;
			
		case 2:
			return v2;
			break;
		
		case 3:
			return v3;
			break;
			
		case 4:
			return v4;
			break;
			
		case 5:
			return v5;
			break;
			
		default:
			douts(@"viewForRowAtIndexPath bad index")
	}
	return nil;
}

- (NSInteger)navigator:(RFPageNavigator *)aNavigator numberOfViewsInSection:(NSInteger)section {
	return 6;
}

- (NSInteger)numberOfSectionsInNavigator:(RFPageNavigator *)aNavigator {
	return 1;
}

- (void)viewDidUnload {
    [super viewDidUnload];
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
