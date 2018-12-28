//
//  main.m
//  4.OC对象的本质4
//
//  Created by smile on 2018/12/20.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

@interface Person : NSObject{
    int _age;
    int _height;
    int _no;
}
@end
@implementation Person
@end


struct Person_IMPL{
    Class isa;
    int _age;
    int _height;
    int _no;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc] init];
        NSLog(@"%zd", sizeof(struct Person_IMPL)); // 24
        NSLog(@"%zd", class_getInstanceSize([Person class]));//24
        NSLog(@"%zd", malloc_size((__bridge const void *)(p)));//32
    }
    return 0;
}
