//
//  Item.h
//  XLNetwork
//
//  Created by Shelin on 15/11/10.
//  Copyright © 2015年 GreatGate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
@interface Item : BaseModel

@property (nonatomic, strong) NSString *headImg;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *ID;

@end
