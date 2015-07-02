//
//  DYTableViewController.m
//  DevelopmentDemoTest
//
//  Created by i-HygeiaiMac on 15/5/22.
//  Copyright (c) 2015年 亚辉. All rights reserved.
//

#import "DYTableViewController.h"
#import "DYTableViewCell.h"

@interface DYTableViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DYTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UINib *NIB=[UINib nibWithNibName:@"DYTableViewCell" bundle:nil];
    [self.tableView registerNib:NIB forCellReuseIdentifier:@"DYTableViewCell"];
    self.tableView.backgroundColor=[UIColor clearColor];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellSting=@"DYTableViewCell";
    DYTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellSting forIndexPath:indexPath];
    cell.backgroundColor=[UIColor clearColor];
   
    return cell;
}
@end
