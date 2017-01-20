//
//  ViewController.m
//  tipCalculator
//
//  Created by  Li Yang on 1/19/17.
//  Copyright © 2017 Li Yang. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tip Calculator";
    [self updateValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
        [self.view endEditing:YES];
        [self updateValues];
}

- (IBAction)onValueChanged:(id)sender {
    NSInteger segmentIndex = [self.tipControl selectedSegmentIndex];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:segmentIndex forKey:@"tipControlIndex"];
    [defaults synchronize];
    [self updateValues];

}

- (void)updateValues {
    //get bill value
    float billAmount = [self.billTextField.text floatValue];
    
    //compute tip and total
    NSArray *tipvalues = @[@(0.15), @(0.20), @(0.25)];
    float tipAmount = [tipvalues[self.tipControl.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmount = billAmount + tipAmount;
    
    //update UI
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger tipControlIndex = [defaults integerForKey:@"tipControlIndex"];
    NSLog(@"tipControlIndex is %ld", (long)tipControlIndex);
    [self.tipControl setSelectedSegmentIndex:tipControlIndex];
    [self updateValues];
    
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
}
@end
