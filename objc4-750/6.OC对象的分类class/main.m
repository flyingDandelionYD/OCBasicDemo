//
//  main.m
//  6.OC对象的分类class
//
//  Created by smile on 2018/12/21.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject *object1 = [[NSObject alloc] init];
        NSObject *object2 = [[NSObject alloc] init];
        
        Class objectClass1 = [object1 class];
        Class objectClass2 = [object2 class];
        Class objectClass3 = object_getClass(object1);
        Class objectClass4 = object_getClass(object2);
        Class objectClass5 = [NSObject class];
        
        NSLog(@"%p %p",object1,object2);//0x101803170  0x101804f60
    
        NSLog(@"%p %p %p %p %p",
              objectClass1,//0x100b14140
              objectClass2,//0x100b14140
              objectClass3,//0x100b14140
              objectClass4,//0x100b14140
              objectClass5);//0x100b14140
        
        
        NSLog(@"End");
        
    }
    return 0;
}
