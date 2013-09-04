//
//  ViewController.m
//  gitTodo
//
//  Created by 古田 貴久 on 2013/09/04.
//  Copyright (c) 2013年 古田 貴久. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "InsertViewController.h"

#import "Todo.h"

@interface ViewController ()

@property NSArray* todoObjects;
@property NSInteger selectedRow;

-(void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath*)indexPath;

@end

@implementation ViewController
@synthesize todoTable;

#pragma mark ViewCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	//tableViewを表示
    todoTable.delegate = self;
    todoTable.dataSource = self;
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObjects:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    //配列の初期化
    self.todoObjects = [self fetchTodoObjects];
}
- (void)viewWillAppear:(BOOL)animated{
    self.todoObjects = [self fetchTodoObjects];
    [self.todoTable reloadData];
}

#pragma mark tableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.todoObjects.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //画面遷移
    DetailViewController* detaicVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    [self.navigationController pushViewController:detaicVC animated:YES];
    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    //削除
    if(editingStyle == UITableViewCellEditingStyleDelete){
        //Entityの削除
        Todo* object = [self.todoObjects objectAtIndex:indexPath.row];
        [object MR_deleteEntity];
        NSManagedObjectContext* context = [NSManagedObjectContext MR_defaultContext];
        [context MR_saveOnlySelfWithCompletion:^(BOOL success, NSError *error) {
            if(!success){
                NSLog(@"save error : %@",error);
            }
            
            //配列を更新
            self.todoObjects = [self fetchTodoObjects];
            //セルの削除
            [todoTable deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }];
    }
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath*)indexPath{
    Todo* object = [self.todoObjects objectAtIndex:indexPath.row];
    cell.textLabel.text = object.titile;
}

#pragma mark sort

- (NSArray *)fetchTodoObjects
{
    return [Todo MR_findAllSortedBy:@"timeStamp" ascending:NO];
}

#pragma mark Action
- (void)insertNewObjects:(id)sender{
    //画面遷移
    InsertViewController* insertVC = [self.storyboard instantiateViewControllerWithIdentifier:@"InsertViewController"];
    [self presentViewController:insertVC animated:YES completion:^{
        NSLog(@"comp");
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
