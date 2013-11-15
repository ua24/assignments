//
//  Test1FirstViewController.m
//  Test1
//
//  Created by Ivan Vasilevich on 11/14/13.
//  Copyright (c) 2013 Ivan Vasilevich. All rights reserved.
//

#import "Test1FirstViewController.h"
#import "FMDatabase.h"
#import "Profile.h"

@interface Test1FirstViewController ()
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *surname;
@property (strong, nonatomic) IBOutlet UILabel *dateOfBirth;
@property (strong, nonatomic) IBOutlet UILabel *tel;
@property (strong, nonatomic) IBOutlet UILabel *mail;
@property (strong, nonatomic) IBOutlet UITextView *about;
@property (strong, nonatomic) IBOutlet UIImageView *image;

@end

@implementation Test1FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

//    [self loadBase];
}


- (void)viewDidAppear:(BOOL)animated{
    
    Profile *p = [MySingleton sharedMySingleton].prof;
    NSLog(@"%@", p.name);
    _name.text = p.name;
    _surname.text = p.surname;
    _dateOfBirth.text = p.dateOfBirth;
    _tel.text = p.tel;
    _mail.text = p.mail;
    _about.text = p.bio;
    NSLog(@"%@", p.pic);
    //з дропбоксу лінки не працюють
    _image.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://h.a.d-cd.net/2954bd8s-960.jpg"]]];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
