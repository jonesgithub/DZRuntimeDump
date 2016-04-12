//
//  DZRuntimeDump.m
//  Pods
//
//  Created by baidu on 16/4/12.
//
//

#import "DZRuntimeDump.h"
#import <objc/runtime.h>


void DZDumpSelectors(Class cla) {
    unsigned int count;
    Method* list = class_copyMethodList(cla, &count);
    for (int i = 0 ; i < count; i++) {
        NSLog(@"Class#{%@}--SEL#{%@}", cla, NSStringFromSelector(method_getName(list[i])));
    }
    free(list);
}

void DZDumpIvars(Class cla) {
    unsigned int count;
    Ivar* list = class_copyIvarList(cla, &count);
    for (int i = 0 ; i < count; i++) {
        NSLog(@"Class#{%@}--Ivar#{%s}--Type:(%s)", cla, ivar_getName(list[i]), ivar_getTypeEncoding(list[i]));
        
    }
    free(list);
}


