//
//  ViewController.h
//  JCTicTacTao
//
//  Created by Student P_02 on 21/09/16.
//  Copyright © 2016 Jivan Chaudhari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    
    NSMutableArray *state;
    NSArray *winingCombinaion;
    int currentPlayer;
    int numberOfTurns;
    BOOL isFinishGame;
    
    
}
- (IBAction)buttonAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *labelDisplay;

@end

