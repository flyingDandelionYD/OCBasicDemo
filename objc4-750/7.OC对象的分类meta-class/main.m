//
//  main.m
//  7.OC对象的分类meta-class
//
//  Created by smile on 2018/12/21.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface Person:NSObject
@end
@implementation Person
@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
       NSObject *object1 = [[NSObject alloc] init];
        Class objectClass1 = [object1 class];
        Class objectClass2 = object_getClass(object1);
        Class objectClass3 = [NSObject class];
        
        // meta-class对象，元类对象
        // 将类对象当做参数传入，获得元类对象
        Class objectMetaClass1 = object_getClass(objectClass1);
        Class objectMetaClass2 = object_getClass(objectClass2);
        Class objectMetaClass3 = object_getClass(objectClass3);
        
        NSLog(@"%p %p %p",
              objectClass1,//0x100b14140
              objectClass2,//0x100b14140
              objectClass3 //0x100b14140
              );
        
        NSLog(@"%p %p %p",
              objectMetaClass1,//0x100b140f0
              objectMetaClass2,//0x100b140f0
              objectMetaClass3 //0x100b140f0
              );
        
    
        //class方法返回的一直是class对象，类对象
        Class objectMetaClass4 = [[[NSObject class] class] class];
        NSLog(@"%p",objectMetaClass4);//0x100b14140
        
        BOOL result1 = class_isMetaClass([object1 class]);
        BOOL result2 = class_isMetaClass([NSObject class]);
        BOOL result3 = class_isMetaClass(object_getClass(([NSObject class])));
        NSLog(@"%d %d %d",
              result1,//0
              result2,//0
              result3 //1
              );
        
        Class strClass  =  object_getClass(@"NSObject");
        NSLog(@"%p",strClass);
        
        
        Person   *p = [[Person alloc]init];//0x102141190
        Class pClass = object_getClass(p);//0x1000011f8
        Class metaPClass = object_getClass(pClass);//0x1000011d0
        BOOL res = class_isMetaClass(metaPClass);//1
        NSLog(@"%p %p %p %d",p,pClass,metaPClass,res);
        NSLog(@"End");
        
    }
    return 0;
}
