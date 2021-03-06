//
//  WayPointCellView.m
//  CycleStreets
//
//  Created by Neil Edwards on 05/11/2012.
//  Copyright (c) 2012 CycleStreets Ltd. All rights reserved.
//

#import "WayPointCellView.h"
#import "GlobalUtilities.h"
#import "UIView+Additions.h"

@interface WayPointCellView()

@property (unsafe_unretained, nonatomic) IBOutlet UIImageView		*iconImageView;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel			*nameLabel;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel			*locationLabel;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel			*waypointLabel;


@end



@implementation WayPointCellView


- (void)prepareForMove{
	self.contentView.visible=NO;
}


-(void)initialise{
	
	self.contentView.backgroundColor=UIColorFromRGB(0xe2e0dc);
	
}



-(void)populate{
	
	self.contentView.visible=YES;
	
	_locationLabel.text=_dataProvider.coordinateString;
	
	
	
	switch (_dataProvider.waypointType) {
		case WayPointTypeStart:
		{
			_waypointLabel.text=EMPTYSTRING;
			_nameLabel.text=@"Start";
			_iconImageView.image=[UIImage imageNamed:@"CSIcon_start_wisp.png"];
		}
		break;
		case WayPointTypeFinish:
		{
			_waypointLabel.text=EMPTYSTRING;
			_nameLabel.text=@"Finish";
			_iconImageView.image=[UIImage imageNamed:@"CSIcon_finish_wisp.png"];
		}
		break;
		case WayPointTypeIntermediate:
		{
			_waypointLabel.text=[NSString stringWithFormat:@"%i",_waypointIndex];
			_nameLabel.text=[NSString stringWithFormat:@"Waypoint %i",_waypointIndex];
			_iconImageView.image=[UIImage imageNamed:@"CSIcon_intermediate_wisp.png"];
			
		}
		break;
	}
	
}



+(int)rowHeight{
	return STANDARDCELLHEIGHT;
}


@end
