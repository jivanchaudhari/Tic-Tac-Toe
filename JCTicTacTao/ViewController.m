//
//  ViewController.m
//  JCTicTacTao
//
//  Created by Student P_02 on 21/09/16.
//  Copyright © 2016 Jivan Chaudhari. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self gameAction];
    
}
-(void)gameAction {
    
    numberOfTurns = 0;
    currentPlayer = 1;
    isFinishGame = false;
    
    
    winingCombinaion = @[@[@0,@1,@2],@[@3,@4,@5],@[@6,@7,@8],
                        @[@0,@3,@6],@[@1,@4,@7],@[@2,@5,@8],
                        @[@0,@4,@8],@[@2,@4,@6]];
    state = [[NSMutableArray alloc]initWithObjects:@0,@0,@0,@0,@0,@0,@0,@0,@0, nil];

    
    for(int i=100; i<=108;i++) {
        
        UIButton *button = [self.view viewWithTag:i];
        
        [button setBackgroundImage:[UIImage new] forState:UIControlStateNormal];
        
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonAction:(id)sender {
 
    numberOfTurns = numberOfTurns + 1 ;
    UIButton *tile = sender;
    UIImage *imagePlayer;
    int player = currentPlayer;
    
    
    
    BOOL isButtonNotSelected = [[state objectAtIndex:(tile.tag-100)] isEqual:@0];
    
    if(isButtonNotSelected) {
        if (!isFinishGame) {
            
        
          if (player == 1) {
            
            imagePlayer = [UIImage imageNamed:@"nought"];
            _labelDisplay.text = @"First Palyer";
              
            [state replaceObjectAtIndex:(tile.tag-100) withObject:@1];
            currentPlayer = 2;

        }
        else {
            
            imagePlayer = [UIImage imageNamed:@"cross"];
            
            _labelDisplay.text = @"Second Palyer";

            [state replaceObjectAtIndex:(tile.tag-100) withObject:@2];
            currentPlayer = 1;

        }
        }
        [tile setBackgroundImage:imagePlayer forState:UIControlStateNormal];
        
    }
    
    else {
        [self alertWithAction:@"Repeat" Massage:@"Please Select Another Button"];
        
    }
    
    if(numberOfTurns >=5) {
        
        for(NSArray *combination in winingCombinaion) {
            
        
            int indexOfButtonOne = [[combination objectAtIndex:0]intValue];
            int indexOfButtonTwo = [[combination objectAtIndex:1]intValue];
            int indexOfButtonThree = [[combination objectAtIndex:2]intValue];
            
            NSNumber *stateAtIndexOne = [state objectAtIndex:indexOfButtonOne];
            NSNumber *stateAtIndexTwo = [state objectAtIndex:indexOfButtonTwo];
            NSNumber *stateAtIndexThree = [state objectAtIndex:indexOfButtonThree];
            
            if(![stateAtIndexOne isEqual:@0] && [stateAtIndexOne isEqual:stateAtIndexTwo] && [stateAtIndexTwo isEqual:stateAtIndexThree]) {
                
                isFinishGame = YES;
                NSString *winnerPlayer = [NSString stringWithFormat:@"Congrats! %d Won The Game",player];

                
                [self alertWithEndAction:winnerPlayer Massage:@"Do You Play Again"];
                
                break;
                
                
            }
        }
    }
    if (!isFinishGame) {
        
        BOOL zeroValuePresent = [state containsObject:@0];
        
        if (!zeroValuePresent) {
            [self alertWithEndAction:@"Draw Game" Massage:@"Do You Play Again"];
            
        }
    }
    
}
-(void)alertWithAction:(NSString *)title Massage: (NSString *)massage {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:massage preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }];
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

-(void)alertWithEndAction:(NSString *)title Massage:(NSString *)massage {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:massage preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self gameAction];
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }];
    [alert addAction:ok];
    

    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        exit(0);
    }];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
}
@end
