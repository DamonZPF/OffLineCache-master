//
//  MainViewController.m
//  OffLineCache
//
//  Created by Duomai on 15/11/23.
//  Copyright © 2015年 GreatGate. All rights reserved.
//

#import "MainViewController.h"
#import "DataService.h"
#import "UIImageView+WebCache.h"
#import "DataModel.h"
@interface MainViewController ()
@property(nonatomic,strong)NSMutableArray * contents;
@end

@implementation MainViewController

-(NSMutableArray*)contents{

    if (_contents == nil) {
        _contents = [NSMutableArray array];
    }
    
    return _contents;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [DataService getWithURL:@"https://api.108tian.com/mobile/v3/EventList?cityId=1&step=10&theme=0&page=1" params:nil reslult:^(NSArray*  result, NSError *error) {
        [self.contents addObjectsFromArray:result];
        
        
        
        [self.tableView reloadData];
    }];
  
    
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.contents.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    
    DataModel * model = self.contents[indexPath.row];
    [cell.imageView  sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://spic-108tian-com.alikunlun.com/pic/%@",model.headImg]]];
    cell.textLabel.text = model.name;
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 80;
}

@end
