
#import "EXTableViewController.h"
#import "UIDateTimePickerSheet.h"

@interface EXTableViewController ()

@end

@implementation EXTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0: //Date & Time
        {
            switch (indexPath.row)
            {
                case 0: //Select
                {
                    [UIDateTimePickerSheet showDateTimeActionSheetWithMode:UIDatePickerModeDateAndTime
                                                                     title:@"Select date & time"
                                                                initalDate:nil
                                                            initalInterval:0
                                                         cancelButtonTitle:nil
                                                           doneButtonTitle:nil
                                                 finishSelectIntervalBlock:NULL
                                                     finishSelectDateBlock:^(BOOL success, NSDate *value)
                                                     {
                                                         [tableView cellForRowAtIndexPath:indexPath].detailTextLabel.text = success ? [NSString stringWithFormat:@"Selected date: %@", value] : @"Canceled";
                                                     }
                                                                    inView:nil];                    
                    
                    break;
                }
                    
                case 1: //Select with minimum date
                {
                    UIDateTimePickerSheet *dateTimePickerSheet = [UIDateTimePickerSheet showDateTimeActionSheetWithMode:UIDatePickerModeDateAndTime
                                                                                                                  title:@"Select date & time"
                                                                                                             initalDate:nil
                                                                                                         initalInterval:0
                                                                                                      cancelButtonTitle:nil
                                                                                                        doneButtonTitle:nil
                                                                                              finishSelectIntervalBlock:NULL
                                                                                                  finishSelectDateBlock:^(BOOL success, NSDate *value)
                                                                                                  {
                                                                                                      [tableView cellForRowAtIndexPath:indexPath].detailTextLabel.text = success ? [NSString stringWithFormat:@"Selected date: %@", value] : @"Canceled";
                                                                                                  }
                                                                                                                 inView:nil];
                    dateTimePickerSheet.datePicker.minimumDate = [NSDate date];
                    
                    break;
                }
            }

            break;
        }
            
        case 1: //Interval
        {
            switch (indexPath.row)
            {
                case 0: //Select
                {
                    [UIDateTimePickerSheet showDateTimeActionSheetWithMode:UIDatePickerModeCountDownTimer
                                                                     title:@"Select interval"
                                                                initalDate:nil
                                                            initalInterval:(60 * 15)
                                                         cancelButtonTitle:nil
                                                           doneButtonTitle:nil
                                                 finishSelectIntervalBlock:^(BOOL success, NSTimeInterval value)
                                                 {
                                                     [tableView cellForRowAtIndexPath:indexPath].detailTextLabel.text = success ? [NSString stringWithFormat:@"%i seconds selected", (int)value] : @"Canceled";
                                                 }
                                                     finishSelectDateBlock:NULL
                                                                    inView:nil];
                    
                    break;
                }
                    
                case 1: //Select with custom step
                {
                    UIDateTimePickerSheet *dateTimePickerSheet = [UIDateTimePickerSheet showDateTimeActionSheetWithMode:UIDatePickerModeCountDownTimer
                                                                                                                  title:@"Select interval"
                                                                                                             initalDate:nil
                                                                                                         initalInterval:(60 * 15)
                                                                                                      cancelButtonTitle:nil
                                                                                                        doneButtonTitle:nil
                                                                                              finishSelectIntervalBlock:^(BOOL success, NSTimeInterval value)
                                                                                              {
                                                                                                  [tableView cellForRowAtIndexPath:indexPath].detailTextLabel.text = success ? [NSString stringWithFormat:@"%i seconds selected", (int)value] : @"Canceled";
                                                                                              }
                                                                                                  finishSelectDateBlock:NULL
                                                                                                                 inView:nil];
                    
                    dateTimePickerSheet.datePicker.minuteInterval = 5;
                    
                    break;
                }
            }
            
            break;
        }
    }
}

@end
