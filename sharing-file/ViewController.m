//
//  ViewController.m
//  sharing-file
//
//  Created by jinren on 4/30/17.
//  Copyright © 2017 jinren. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSURL* filePath;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray* array = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    NSString* pathStr = [NSString stringWithFormat:@"%@%@",(NSString*)array[0], @"app.log"];
    NSURL*url = [NSURL URLWithString:pathStr];
    self.filePath = url;
    NSString* fileStr = @"file test content";
    [fileStr writeToURL:url atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareFile:(id)sender {
    UIActivityViewController* activeVC = [[UIActivityViewController alloc] initWithActivityItems:@[self.filePath] applicationActivities:nil];
    
    [self presentViewController:activeVC animated:YES completion:^{
        NSLog(@"completion");
    }];
}


@end
