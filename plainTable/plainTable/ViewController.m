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
    NSMutableArray *_selectedProducts;
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
    _selectedProducts = [NSMutableArray array];
   // [_productList addObject:product1];
    [_productList addObjectsFromArray:@[product1,product2, product3, product4, product5, product6, product7, product8, product9, product10, product11, product12, product13, product14]];
    
    // 使用文件创建数据
    NSString *path = [[NSBundle mainBundle] pathForResource:@"product.plist" ofType:nil];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    for (NSDictionary *dict in array) {
        Product *product = [Product productWithDict:dict];
        [_productList addObject:product];
    }
    
    
}

#pragma mark 1组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_selectedProducts.count ==0) {
        _delBtn.enabled = NO;
        _titleLabel.text = [NSString stringWithFormat:@"淘宝"];
    } else {
        _delBtn.enabled = YES;
        _titleLabel.text = [NSString stringWithFormat:@"选中%ld行",_selectedProducts.count];
    }
    return _productList.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     // 先从缓存池中取cell
    static NSString *ID = @"product_table";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
//        NSLog(@"创建cell");
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
   
    
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];

//    cell.textLabel.text = @"产品";
//    cell.detailTextLabel.text = @"产品详情";
//
//    NSString *imgName = [NSString stringWithFormat:@"01.jpg"];
    
    Product *product = _productList[indexPath.row];
    cell.textLabel.text = product.title;
    cell.detailTextLabel.text = product.desc;
    cell.imageView.image  = [UIImage imageNamed:product.icon];
    
    if ([_selectedProducts containsObject:product]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
//    NSLog(@"%p==>%ld", cell, indexPath.row);
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return 100;
}
#pragma mark 代理方法
#pragma mark 代表选中的每一行调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"选中了第%ld行", indexPath.row);
//    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
//    selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
    Product *product = _productList[indexPath.row];
    if ([_selectedProducts containsObject:product]) {
        [_selectedProducts removeObject:product];
    } else {
        [_selectedProducts addObject:product];
    }
    
    
    
    NSLog(@"选中的行数-->%ld",_selectedProducts.count);
    
    //[tableView reloadData];
    [_tableView reloadRowsAtIndexPaths:@[indexPath]  withRowAnimation:UITableViewRowAnimationLeft];
    
    if (NO) {
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
            NSLog(@"修改后的标题是==>%@",product.title);
            //全部刷新
           //  [_tableView reloadData];
            // 局部刷新
            [_tableView reloadRowsAtIndexPaths:@[indexPath]  withRowAnimation:UITableViewRowAnimationLeft];
        }];
        // 加入按钮
        [alert addAction:cancel];
        [alert addAction:sub];
        // 显示弹窗
        [self presentViewController:alert animated:YES completion:nil];
    }
}

#pragma mark 取消选中
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"deselect 取消选中行==> %ld", indexPath.row);
}


#pragma mark 删除数据

- (void) delData:(id)sender
{
    NSLog(@"删除数据");
    BOOL result = !self.tableView.editing;
    [self.tableView setEditing:result animated:YES];
    // 删除模型数据  数据源
//    [_productList removeObjectsInArray:_selectedProducts];
    
    
//    [_selectedProducts removeAllObjects];
    // 刷新数据
//    [_tableView reloadData];
 
}
#pragma mark 当用户提交一个编辑操作时自动 调用
- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    Product *product = _productList[indexPath.row];
//    if ([_selectedProducts containsObject:product]) {
//        [_selectedProducts removeObject:product];
//    } else {
//        [_selectedProducts addObject:product];
//    }
    [_productList removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark 排序功能
- (void) tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSLog(@"源行==>%ld,目标行==> %ld", sourceIndexPath.row, destinationIndexPath.row);
    
    
    Product *p = _productList[sourceIndexPath.row];
    
    [_productList removeObject:p];
    
    [_productList insertObject:p atIndex:destinationIndexPath.row];
}


@end
