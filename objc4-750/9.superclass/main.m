//
//  main.m
//  9.superclass
//
//  Created by smile on 2018/12/23.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface Person:NSObject
-(void)run;
@end

@implementation Person
-(void)run{
    NSLog(@"run...");
}
@end

@interface Student:Person

@end
@implementation Student

@end

struct my_class{
    Class isa;
    Class superclass;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //instance 对象
        Student *stu  = [[Student alloc]init];
        Person *p = [[Person alloc]init];
        
        //class对象
        Class StuClass = object_getClass(stu);
        Class PerClass = object_getClass(p);
        
        //meta-class对象
        Class StuMetaClass = object_getClass(StuClass);
        Class PerMetaClass = object_getClass(PerClass);
        
        
        //转为结构体（类）
        struct my_class *stuC = (__bridge struct my_class *)(StuClass);
        //转为结构体（类）
        struct  my_class *perC = (__bridge struct my_class *)(PerClass);
        
        
        //转为结构体（元类）
        struct my_class *stuMetaC = (__bridge struct my_class *)(StuMetaClass);
        //转为结构体（元类）
        struct  my_class *perMetaC = (__bridge struct my_class *)(PerMetaClass);
        
        NSLog(@"End");
    }
    return 0;
}
