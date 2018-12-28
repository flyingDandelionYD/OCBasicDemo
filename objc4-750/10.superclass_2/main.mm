//
//  main.m
//  10.superclass_2
//
//  Created by smile on 2018/12/23.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "myClassInfo.h"

@interface Person:NSObject
-(void)run;
+(void)walk;
@end

@implementation Person
-(void)run{
    NSLog(@"run...");
}
+(void)walk{
    NSLog(@"walk...");
}
@end

@interface Student:Person

@end

@implementation Student

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //instance 对象
        Student *stu  = [[Student alloc]init];
        Person *p = [[Person alloc]init];
        [p run];
        [Student walk];
        
        //class对象
        Class StuClass = object_getClass(stu);
        Class PerClass = object_getClass(p);
        
        //meta-class对象
        Class StuMetaClass = object_getClass(StuClass);
        Class PerMetaClass = object_getClass(PerClass);
        
        
        //转为结构体（类）
        struct my_objc_class *stuC = (__bridge struct my_objc_class *)(StuClass);
        class_rw_t  *stuCData = stuC->data();
        
        //转为结构体（类）
        struct  my_objc_class *perC = (__bridge struct my_objc_class *)(PerClass);
        class_rw_t  *perCData = perC->data();
        
        
        //转为结构体（元类）
        struct my_objc_class *stuMetaC = (__bridge struct my_objc_class *)(StuMetaClass);
        class_rw_t  *stuMetaCData = stuMetaC->data();
        
        //转为结构体（元类）
        struct  my_objc_class *perMetaC = (__bridge struct my_objc_class *)(PerMetaClass);
        class_rw_t  *perMetaCData = perMetaC->data();
        
        NSLog(@"End");
    }
    return 0;
}

