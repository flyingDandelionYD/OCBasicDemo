//
//  main.m
//  2.OC对象的本质2
//
//  Created by smile on 2018/12/20.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject{
    @public
    int age;
    int number;
}
@end

@implementation Student
@end


struct Student_IMPL {
    Class isa;
    int age;
    int number;
};


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Start");
        Student *stu = [[Student alloc]init];
        stu->age = 18;
        stu->number = 1;
        
        //我们强转下
        struct Student_IMPL *stu2 = (__bridge struct Student_IMPL *)(stu);
        NSLog(@"%d<--->%d",stu2->age,stu2->number);//18 1
        
        NSLog(@"%@",stu);//0x100e2b7a0
         NSLog(@"%p",&(stu2->isa));//0x100e2b7a0
        NSLog(@"%p",&(stu->age));//0x100e2b7a8
        NSLog(@"%p",&(stu2->age));//0x100e2b7a8
        NSLog(@"End");
    }
    return 0;
}
