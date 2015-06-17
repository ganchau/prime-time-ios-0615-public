//
//  FISPrimeTimeTableViewController.m
//  PrimeTime
//
//  Created by Gan Chau on 6/16/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import "FISPrimeTimeTableViewController.h"

@interface FISPrimeTimeTableViewController ()

@property (strong, nonatomic) NSMutableArray *primes;  // stores the prime numbers
@property (nonatomic) NSUInteger potentialPrime;

@end

@implementation FISPrimeTimeTableViewController

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (NSInteger)primeNumber:(NSInteger)prime
{
//    self.potentialPrime = 2;
//    self.primes = [@[] mutableCopy];
    
    if (self.primes.count < prime) {
    
        while (self.primes.count < prime) {
            //        NSUInteger evenlyDivisibleNumber = 0;
            //        for (NSUInteger i = 2; i <= potentialPrime; i++) {
            //            if (potentialPrime % i == 0) {
            //                evenlyDivisibleNumber++;
            //            }
            //            if (evenlyDivisibleNumber > 1) {
            //                break;
            //            }
            //        }
            
            for (NSUInteger i = 2; i <= self.potentialPrime; i++) {
                if (self.potentialPrime % i == 0) {
                    if (i != self.potentialPrime) {
                        break;
                    } else {
                        [self.primes addObject:@(self.potentialPrime)];
                    }
                }
            }
            self.potentialPrime++;
            
            //        NSUInteger evenlyDivisibleNumber = 0;
            //        NSUInteger i = 2;
            //        while (i <= self.potentialPrime && evenlyDivisibleNumber <= 1) {
            //            if (self.potentialPrime % i == 0) {
            //                evenlyDivisibleNumber++;
            //                i++;
            //            }
            //        }
            //        
            //        
            //        
            //        if (evenlyDivisibleNumber == 1) {
            //            [self.primes addObject:@(self.potentialPrime)];
            //        }
            //        self.potentialPrime++;
        }
        NSInteger foundPrime = [[self.primes lastObject] integerValue];
        NSLog(@"%ld", foundPrime);
        
        return foundPrime;
    } else {
        NSInteger foundPrime = [self.primes[prime - 1] integerValue];
        
        return foundPrime;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.primes = [@[] mutableCopy];
    self.potentialPrime = 2;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.accessibilityIdentifier = @"table";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"primeCell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSInteger primeth = indexPath.row + 2001;
    NSInteger primeNumber = [self primeNumber:primeth];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", primeNumber];
    

    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
