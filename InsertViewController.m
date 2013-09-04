//
//  InsertViewController.m
//  gitTodo
//
//  Created by 古田 貴久 on 2013/09/04.
//  Copyright (c) 2013年 古田 貴久. All rights reserved.
//

#import "InsertViewController.h"

@interface InsertViewController ()

@end

@implementation InsertViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.titleField.delegate = self;
       
}

#pragma mark Action
- (IBAction)addButton:(id)sender {
    if([self.titleField.text length] == 0){
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"エラー" message:@"titleを入力してください" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    Todo* newTodo = [Todo MR_createEntity];
    newTodo.titile = self.titleField.text;
    newTodo.text = self.textField.text;
    newTodo.timeStamp = [NSDate date];
    
    NSManagedObjectContext* context = [NSManagedObjectContext MR_defaultContext];
    [context MR_saveOnlySelfWithCompletion:^(BOOL success, NSError *error) {
        if(success){
            NSLog(@"----------> saved\n%@",newTodo);
        }else{
            NSLog(@"save error: %@",error);
        }
        
        [self pushBack];
    }];
    
}

#pragma mark segue
- (void)pushBack{
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"comp");
    }];
}

#pragma mark titleFieldDele
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.titleField resignFirstResponder];
    return YES;
}

@end
