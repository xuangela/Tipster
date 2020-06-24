//
//  ViewController.m
//  Tipster
//
//  Created by Angela Xu on 6/23/20.
//  Copyright © 2020 Angela Xu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;


@end

@implementation ViewController

- (void)viewDidLoad {
    [self.billField becomeFirstResponder];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void) didReeiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onEdit:(id)sender {
    double bill = [self.billField.text doubleValue];
    
    NSArray *percentages = @[@(0.15), @(0.2), @(0.22)];
    
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}

- (IBAction)onEditingBegin:(id)sender {
//    [UIView animateWithDuration:0.2 animations:^{
//        self.billField.frame = CGRectMake(self.billField.frame.origin.x, self.billField.frame.origin.y + 30, self.billField.frame.size.width, self.billField.frame.size.height);
//    }];
//    
//    [UIView animateWithDuration:1 animations:^{
//        self.tipLabel.alpha = 0;
//    }];
}

- (IBAction)onEditingEnd:(id)sender {
//    CGRect newFrame = self.billField.frame;
//    newFrame.origin.y -= 30;
//    
//    [UIView animateWithDuration:0.2 animations:^{
//        self.billField.frame = newFrame;
//    }];
//    
//    [UIView animateWithDuration:1 animations:^{
//        self.tipLabel.alpha = 1;
//    }];
    
}

- (void) viewWillAppear: (BOOL) animated {
    [super viewWillAppear:animated];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.tipControl.selectedSegmentIndex = [defaults doubleForKey:@"default_seg"];
}

@end
