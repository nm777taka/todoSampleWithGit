//
//  ViewController.h
//  gitTodo
//
//  Created by 古田 貴久 on 2013/09/04.
//  Copyright (c) 2013年 古田 貴久. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,NSFetchedResultsControllerDelegate>{
    UITableView* todoTable;
}

@property (strong,nonatomic) NSFetchedResultsController* fetchResultController;
@property (strong,nonatomic) NSManagedObjectContext* managedContext;

@end
