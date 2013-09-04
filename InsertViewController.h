//
//  InsertViewController.h
//  gitTodo
//
//  Created by 古田 貴久 on 2013/09/04.
//  Copyright (c) 2013年 古田 貴久. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@interface InsertViewController : UIViewController<UITextFieldDelegate>
- (IBAction)addButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextView *textField;

@property Todo *todoObject;

@end
