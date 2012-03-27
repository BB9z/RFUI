#import "RFSidePanel.h"
#import "RFConstants.h"

static CGFloat kToggleAnimateDuration = 0.5f;

@implementation RFSidePanel
@synthesize vMaster;
@synthesize root = root_, isShow = isShow_;

- (id)initWithManagedView:(UIView *)root {
    self = [super initWithNibName:@"SidePanel" bundle:nil];
    if (self) {
        // Custom initialization
		self.root = root;
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)show:(BOOL)animated {
	if(isShow_) return;
	
	if(animated) {
		[vBarButton setImage:[UIImage resourceName:@"SidePanel-off.active"] forState:UIControlStateNormal];
		
		[UIView animateWithDuration:kToggleAnimateDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
			[self.view moveToX:0 Y:CGFLOAT_MAX];
		} completion:^(BOOL finished) {
			[vBarButton setImage:[UIImage resourceName:@"SidePanel-on"] forState:UIControlStateNormal];
			[vBarButton setImage:[UIImage resourceName:@"SidePanel-on.active"] forState:UIControlStateHighlighted];
		}];
	}
	else {
		[self.view moveToX:0 Y:CGFLOAT_MAX];
		[vBarButton setImage:[UIImage resourceName:@"SidePanel-on"] forState:UIControlStateNormal];
		[vBarButton setImage:[UIImage resourceName:@"SidePanel-on.active"] forState:UIControlStateHighlighted];
	}
	isShow_ = YES;
}

- (void)hide:(BOOL)animated {
	if(!isShow_) return;
	
	if(animated) {
		[vBarButton setImage:[UIImage resourceName:@"SidePanel-on.active"] forState:UIControlStateNormal];
		
		[UIView animateWithDuration:kToggleAnimateDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
			[self.view moveToX:-vMaster.bounds.size.width Y:CGFLOAT_MAX];
		} completion:^(BOOL finished) {
			[vBarButton setImage:[UIImage resourceName:@"SidePanel-off"] forState:UIControlStateNormal];
			[vBarButton setImage:[UIImage resourceName:@"SidePanel-off.active"] forState:UIControlStateHighlighted];
		}];
	}
	else {
		[self.view moveToX:-vMaster.bounds.size.width Y:CGFLOAT_MAX];
		[vBarButton setImage:[UIImage resourceName:@"SidePanel-off"] forState:UIControlStateNormal];
		[vBarButton setImage:[UIImage resourceName:@"SidePanel-off.active"] forState:UIControlStateHighlighted];
	}
	isShow_ = NO;
}

- (BOOL)toggle {
	if(isShow_) {
		[self hide:YES];
	}
	else {
		[self show:YES];
	}
	return isShow_;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.vMaster addSubview:self.root];
	
	// 默认认为自己是展开的
	isShow_ = true;
	if (![[NSUserDefaults standardUserDefaults] boolForKey:@"RFSidePanel_isShow"]) {
		[self hide:NO];
	}
	
	[self performSelector:@selector(doAfterViewLoad) withObject:nil afterDelay:0.f];
}

-(void)doAfterViewLoad {
	UISwipeGestureRecognizer * recognizer;
	recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(show:)];
	recognizer.direction = UISwipeGestureRecognizerDirectionRight;
	[self.view addGestureRecognizer:recognizer];
	[recognizer release];
	
	recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hide:)];
	recognizer.direction = UISwipeGestureRecognizerDirectionLeft;
	[self.view addGestureRecognizer:recognizer];
	[recognizer release];
	
	[vBarButton addTarget:self action:@selector(toggle) forControlEvents:UIControlEventTouchUpInside];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(savePreferences) name:@"MSGRFUISavePreferences" object:nil];
}

- (void)savePreferences {
	[[NSUserDefaults standardUserDefaults] setBool:isShow_ forKey:@"RFSidePanel_isShow"];
}

- (void)viewDidUnload {
    [super viewDidUnload];
	self.root = nil;
	self.vMaster = nil;
	[RFKit rls:vBarBg, vBarButton];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

@end
