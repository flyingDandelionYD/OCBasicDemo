//
//  main.m
//  3.OC对象的本质3
//
//  Created by smile on 2018/12/20.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>


@interface Person : NSObject{
    @public
    int age;
}
@end
@implementation Person
@end


@interface Student : Person{
    @public
    double score;
}
@end
@implementation Student
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student *stu = [[Student alloc]init];
        stu->age = 1;
        stu->score = 2;
        NSLog(@"%p,%p",&(stu->age),&(stu->score));//0x101a3abf8,0x101a3ac00
        NSLog(@"%zd", malloc_size((__bridge const void *)stu));//32
        NSLog(@"End");
    }
    return 0;
}
