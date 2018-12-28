//
//  main.m
//  5.OC对象的分类instance
//
//  Created by smile on 2018/12/21.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject{
@public
    int _age;
    int  _number;
}
@end

@implementation Person
@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //instance对象
        Person *p1 = [[Person alloc]init];
        p1->_age = 10;
        p1->_number = 100;
        
        Person *p2 = [[Person alloc]init];
        p2->_age = 12;
        p2->_number = 90;
        
        NSLog(@"%p",p1);//0x1005222a0
        NSLog(@"%p",p2);//0x1005220b0
        
        NSLog(@"%p",&(p1->_age));    //0x1005222a8
        NSLog(@"%p",&(p1->_number)); //0x1005222ac
        
        NSLog(@"%p",&(p2->_age));    //0x1005220b8
        NSLog(@"%p",&(p2->_number)); //0x1005220bc
        
        NSLog(@"End");
    }
    return 0;
}
