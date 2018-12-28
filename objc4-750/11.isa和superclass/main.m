//
//  main.m
//  11.isa和superclass
//
//  Created by smile on 2018/12/23.
//

#import <Foundation/Foundation.h>
@interface NSObject()
+ (void)test;
@end

@implementation NSObject (Test)
- (void)test
{
   NSLog(@"test被调用啦%p", self);
}
@end


@interface Person : NSObject
+ (void)test;
@end

@implementation Person

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%p", [NSObject class]);//0x100b14140
        NSLog(@"%p", [Person class]);  //0x1000011c0
      
        [NSObject test];//test被调用啦0x100b14140
        [Person test];//test被调用啦0x1000011c0
    }
    return 0;
}
