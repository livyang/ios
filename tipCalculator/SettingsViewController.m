//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by  Li Yang on 1/20/17.
//  Copyright © 2017 Li Yang. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onValueChanged:(id)sender {
    NSInteger segmentIndex = [self.tipControl selectedSegmentIndex];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:segmentIndex forKey:@"tipControlIndex"];
    [defaults synchronize];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger tipControlIndex = [defaults integerForKey:@"tipControlIndex"];
    NSLog(@"tipControlIndex is %ld", (long)tipControlIndex);
    [self.tipControl setSelectedSegmentIndex:tipControlIndex];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
