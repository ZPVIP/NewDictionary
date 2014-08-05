//
//  NDViewController.m
//  NewDictionary
//
//  Created by 王刚 on 14/8/4.
//  Copyright (c) 2014年 wwwlife. All rights reserved.
//

#import "NDViewController.h"
#import "NDWord.h"

@interface NDViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *fromTextField;

@property (weak, nonatomic) IBOutlet UILabel *query;
@property (weak, nonatomic) IBOutlet UILabel *translation;
@property (weak, nonatomic) IBOutlet UILabel *explains;
@property (weak, nonatomic) IBOutlet UILabel *phonetic;
@property (weak, nonatomic) IBOutlet UILabel *ukphonetic;
@property (weak, nonatomic) IBOutlet UILabel *usphonetic;
@property (weak, nonatomic) IBOutlet UITextView *webTextView;
@end

@implementation NDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.fromTextField.delegate = self;
}
- (IBAction)translate:(id)sender {
    
    NDWord *word = [[NDWord alloc]initWithFromText:self.fromTextField.text toText:@""];
    [NDApplicationDelegate.translateEngine translateWord:word completionHandler:^(NDResult *result) {
        self.query.text = result.query;
        self.translation.text = [result.translation objectAtIndex:0];
        self.explains.text = [result.basic.explains objectAtIndex:0];
        self.phonetic.text = result.basic.phonetic;
        self.ukphonetic.text = result.basic.ukphonetic;
        self.usphonetic.text = result.basic.usphonetic;
        self.webTextView.text = [result.webs objectAtIndex:0];
        
        
        
        [self.fromTextField resignFirstResponder];

    } errorHandler:^(NSError *error) {
        
    }];
  
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.fromTextField resignFirstResponder];
    return YES;
}

@end
