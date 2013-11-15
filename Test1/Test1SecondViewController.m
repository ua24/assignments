//
//  Test1SecondViewController.m
//  Test1
//
//  Created by Ivan Vasilevich on 11/14/13.
//  Copyright (c) 2013 Ivan Vasilevich. All rights reserved.
//

#import "Test1SecondViewController.h"
#import "FMDatabase.h"
#import "Profile.h"

@interface Test1SecondViewController ()

{
    NSMutableArray *_items;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation Test1SecondViewController

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"opop %i", indexPath.row);
    [MySingleton sharedMySingleton].prof = _items[indexPath.row];
    return indexPath;
}

- (void)showSelectedProfile
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Objects";
    _items = [[NSMutableArray alloc]init];
    [self loadItems];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadItems
{
    //определяем путь к файлу с базой
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Base.db"];
    //создаем подключение к базе
    FMDatabase *database;
    database = [FMDatabase databaseWithPath:path];
    database.traceExecution = true; //выводит подробный лог запросов в консоль
    [database open];
    
    //выполняем выборку из таблицы animals
    FMResultSet *results = [database executeQuery:@"select * from profiles"];
    while([results next]) {
        
        Profile *p = [[Profile alloc]init];
        p.name = [results stringForColumn:@"name"];
        p.surname = [results stringForColumn:@"surname"];
        p.tel = [results stringForColumn:@"tel"];
        p.pic = [results stringForColumn:@"pic"];
        p.mail = [results stringForColumn:@"mail"];
        p.bio = [results stringForColumn:@"bio"];
        p.dateOfBirth = [results stringForColumn:@"dateofbirth"];
        
        //atIndex - текущее кол-во элементов, чтобы новый элемент добавлялся в конец списка
        [_items insertObject:p atIndex:[_items count]];
    }
    
    //удаляем подключение к базе
    [database close];
    NSLog(@"data is %@", _items);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //для возврата ячейки мы используем один ее экземпляр, если он не создан, создадим
    //здесь "Cell" это придуманный нами для повторного использования идентификатор ячейки
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        //здесь можно не просто создать ячейку, можно добавить в нее даже картинки
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    //в indexPath.row нам передают номер строчки для отображения
    NSString *item = [_items objectAtIndex:indexPath.row];
    //мы же в label выведем название животного
    cell.textLabel.text = [(Profile *)item name];
    
    return cell;
}

@end
