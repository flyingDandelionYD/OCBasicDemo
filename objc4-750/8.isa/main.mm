//
//  main.m
//  8.isa
//
//  Created by smile on 2018/12/21.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "myClassInfo.h"

@interface Person:NSObject{
@public
    int _age;
}
-(void)run;
+(void)walk;
@property (nonatomic,strong) NSString *name;
@end

@implementation Person
-(void)run{
    NSLog(@"run...");
}
+(void)walk{
    NSLog(@"walk...");
}

@end

struct objc_classA{
    Class isa;
};

//0x00007ffffffffff8ULL (ISA_MASK)
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p =  [[Person alloc]init];
        
        Class pClass = object_getClass(p);
        
        struct  objc_classA *pClassA = (__bridge struct objc_classA *)(pClass);
        

        Class metaPClass = object_getClass(pClass);
        
        p->_age = 10;
        [p run];
        [Person walk];
        
        NSLog(@"p:%p",p);
        NSLog(@"pClass:%p",pClass);
        NSLog(@"metaPClass:%p",metaPClass);
        
        //使用myClassInfo类转化实例对象p
        struct my_objc_class *myP  =(__bridge struct my_objc_class *) p;
        class_rw_t  *myPData = myP->data();
        
        //使用myClassInfo类转化类对象pClass
        struct my_objc_class *myClass  =(__bridge struct my_objc_class *) pClass;
        class_rw_t  *myClassData = myClass->data();
        
        //使用myClassInfo类转化元类对象metaPClass
        struct my_objc_class *myMetaClass  =(__bridge struct my_objc_class *) metaPClass;
        class_rw_t  *myMetaClassData = myMetaClass->data();
        
        NSLog(@"End");
    }
    return 0;
}




