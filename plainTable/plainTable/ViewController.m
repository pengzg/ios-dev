//
//  ViewController.m
//  plainTable
//
//  Created by 彭宗阁 on 2018/8/15.
//  Copyright © 2018 pengzg. All rights reserved.
//

#import "ViewController.h"
#import "Product.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
{
//    NSArray *_productList;
    NSMutableArray *_productList;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    
    _tableView.dataSource = self;
    _tableView.scrollEnabled = YES;
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Product *product1 = [Product  productWithIcon:@"01.jpg" title:@"商品1" desc:@"描述1"];
    Product *product2 = [Product  productWithIcon:@"02.jpg" title:@"商品2" desc:@"描述2"];
    Product *product3 = [Product  productWithIcon:@"01.jpg" title:@"商品3" desc:@"描述3"];
    Product *product4 = [Product  productWithIcon:@"01.jpg" title:@"商品4" desc:@"描述3"];
    Product *product5 = [Product  productWithIcon:@"01.jpg" title:@"商品5" desc:@"描述3"];
    Product *product6 = [Product  productWithIcon:@"01.jpg" title:@"商品6" desc:@"描述3"];
    Product *product7 = [Product  productWithIcon:@"01.jpg" title:@"商品7" desc:@"描述3"];
    Product *product8 = [Product  productWithIcon:@"01.jpg" title:@"商品8" desc:@"描述3"];
    Product *product9 = [Product  productWithIcon:@"01.jpg" title:@"商品9" desc:@"描述3"];
    Product *product10 = [Product  productWithIcon:@"01.jpg" title:@"商品10" desc:@"描述3"];
    Product *product11 = [Product  productWithIcon:@"01.jpg" title:@"商品11" desc:@"描述3"];
    Product *product12 = [Product  productWithIcon:@"01.jpg" title:@"商品12" desc:@"描述3"];
    Product *product13 = [Product  productWithIcon:@"01.jpg" title:@"商品13" desc:@"描述3"];
    Product *product14 = [Product  productWithIcon:@"01.jpg" title:@"商品14" desc:@"描述3"];
//    _productList = @[product1,product2,product3];
   
    
    _productList = [NSMutableArray array];
    
   // [_productList addObject:product1];
    [_productList addObjectsFromArray:@[product1,product2, product3, product4, product5, product6, product7, product8, product9, product10, product11, product12, product13, product14]];
    
}

#pragma mark 1组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _productList.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];

//    cell.textLabel.text = @"产品";
//    cell.detailTextLabel.text = @"产品详情";
//
//    NSString *imgName = [NSString stringWithFormat:@"01.jpg"];
    
    Product *product = _productList[indexPath.row];
    cell.textLabel.text = product.title;
    cell.detailTextLabel.text = product.desc;
    cell.imageView.image  = [UIImage imageNamed:product.icon];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}
#pragma mark 代理方法
#pragma mark 代表选中的每一行调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"选中了第%d行", indexPath.row);
    Product *product = _productList[indexPath.row];
    // 创建弹窗
    UIAlertController *alert  = [UIAlertController alertControllerWithTitle:@"修改商品名称" message:product.title preferredStyle:UIAlertControllerStyleAlert];
    // 文本框
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder =@"请输入新的商品名";
        textField.accessibilityValue = product.title;
        textField.text = product.title;
    }];
    // 添加按钮
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *sub = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        product.title = alert.textFields[0].text;
        NSLog(@"%@",product.title);
        [_tableView reloadData];
    }];
    // 加入按钮
    [alert addAction:cancel];
    [alert addAction:sub];
    // 显示弹窗
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
