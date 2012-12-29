#import <SpringBoard/SBAwayView.h>
#import <UIKit/UIKit.h>
#import <substrate.h>

#define IMG_WIDTH   150.f
#define IMG_HEIGHT  186.f

%hook SBAwayView

-(id)initWithFrame:(CGRect)frame
{
	id result = %orig;
	if (result)
	{
		/*
		CGRect labelRect = [self middleFrame];
		labelRect.origin.y = labelRect.origin.y + 20.f;
		labelRect.size.height = 50.f;
		UILabel *habrLabel = [[[UILabel alloc] initWithFrame:labelRect] autorelease];
		habrLabel.text = @"Hello, Habr!";
		habrLabel.textColor = [UIColor colorWithRed:155.f/255.f green:182.f/255.f blue:206.f/255.f alpha:1.f];
		habrLabel.opaque = NO; 
		habrLabel.textAlignment = UITextAlignmentCenter;
		habrLabel.font = [UIFont boldSystemFontOfSize:36];
		habrLabel.backgroundColor = [UIColor clearColor];*/
		CGRect imageRect = [self middleFrame];
		imageRect.origin.y = imageRect.origin.y + 20.f;
		imageRect.origin.x = (imageRect.size.width - IMG_WIDTH) / 2.f;
		imageRect.size.width = IMG_WIDTH;
		imageRect.size.height = IMG_HEIGHT;
		UIImageView *habrLogoView = [[[UIImageView alloc] initWithFrame:imageRect] autorelease];
		habrLogoView.image = [UIImage imageNamed:@"habr_logo_hat"];
		UIImageView *backgroundView = MSHookIvar<UIImageView *>(self, "_backgroundView");
		[backgroundView addSubview:habrLogoView];
	}
	return result;
}

%end
