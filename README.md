UIDateTimePickerSheet
==========================

Simple component to pick date/time/time interval

Installation
==========================

Copy UIDateTimePickerSheet.h, UIDateTimePickerSheet.m, UIDateTimePickerSheet.xib to your project

Usage
==========================

Use class method showDateTimeActionSheetWithMode

+ (UIDateTimePickerSheet *)showDateTimeActionSheetWithMode:(UIDatePickerMode)pickerMode
                                                     title:(NSString *)title
                                                initalDate:(NSDate *)initalDate
                                            initalInterval:(NSTimeInterval)initalInterval
                                         cancelButtonTitle:(NSString *)cancelButtonTitle
                                           doneButtonTitle:(NSString *)doneButtonTitle
                                 finishSelectIntervalBlock:(void (^)(BOOL success, NSTimeInterval value))finishSelectIntervalBlock
                                     finishSelectDateBlock:(void (^)(BOOL success, NSDate *value))finishSelectDateBlock
                                                    inView:(UIView *)view;

Example
==========================

Pick date and time:

[UIDateTimePickerSheet showDateTimeActionSheetWithMode:UIDatePickerModeDateAndTime
                                                                     title:nil
                                                                initalDate:nil
                                                            initalInterval:0
                                                         cancelButtonTitle:nil
                                                           doneButtonTitle:nil
                                                 finishSelectIntervalBlock:NULL
                                                     finishSelectDateBlock:^(BOOL success, NSDate *value)
                                                     {
                                                         //code
                                                     }
                                                                    inView:nil];
                                                                    
Pick interval:

[UIDateTimePickerSheet showDateTimeActionSheetWithMode:UIDatePickerModeCountDownTimer
                                                                     title:nil
                                                                initalDate:nil
                                                            initalInterval:0
                                                         cancelButtonTitle:nil
                                                           doneButtonTitle:nil
                                                 finishSelectIntervalBlock:^(BOOL success, NSTimeInterval value)
                                                 {
                                                     //code
                                                 }
                                                     finishSelectDateBlock:NULL
                                                                    inView:nil];
