//
//  main.m
//  1.OC对象的本质
//
//  Created by smile on 2018/12/19.
//

#import <Foundation/Foundation.h>

@interface Person:NSObject
@end

@implementation Person
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject *obj = [[NSObject alloc] init];
        NSLog(@"%@",obj);
        
//         Person *person = [[Person alloc] init];
    }
    return 0;
}


