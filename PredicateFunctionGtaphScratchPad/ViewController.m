//
//  ViewController.m
//  PredicateFunctionGtaphScratchPad
//
//  Created by Xcode Developer on 10/6/22.
//

#import "ViewController.h"

@interface ViewController () {
    
    unsigned long (^ const * function_t)(unsigned long);
    unsigned long (^ const * logic_t)(unsigned long);
}

@end

@implementation ViewController

unsigned long (^(^proposition)(unsigned long))(void) = ^ (unsigned long predicate) {
    return ^{
        return predicate;
    };
};

unsigned long (^quantifier)(void);

unsigned long (^function)(unsigned long) = ^ (unsigned long predicate) {
    return predicate; //(unsigned long)(((unsigned long)nil ^ predicate) && recursive_block(~-predicate));
};

unsigned long (^boolean)(unsigned long) = ^ (unsigned long predicate) {
    return predicate; //(unsigned long)(((unsigned long)nil ^ predicate) && recursive_block(~-predicate));
};

static void (^logic)(unsigned long) = ^ (unsigned long quantifier) {
//    (quantifier & (recursive_block(quantifier) ^ quantifier));
//    boolean_operation(predicate_function(quantifier)) & quantifier));
};

- (void)viewDidLoad {
    [super viewDidLoad];
    
    typedef typeof(unsigned long(^)(unsigned long)) blk;
    typedef typeof(unsigned long(^*)(unsigned long)) blk_t;
    blk blk_a;
    __block blk_t blka_t = &blk_a;
    blk blk_b;
    __block blk_t blkb_t = &blk_b;
    blk blk_c;
    const blk_t blkc_t = &blk_c;

    __block unsigned long count = 8;
    count = ~(1UL << (count >> 1UL));

    blk_a = ^ unsigned long (unsigned long counter) {
        printf("%lu\n", (unsigned long)(floor(log2(counter))));
        return (*blkc_t)(counter >> 1UL);
    };

    blk_b = ^ unsigned long (unsigned long counter) {
        printf("\t\t%lu\n", (unsigned long)(floor(log2(counter))));
        return (*blkc_t)(counter >> 1UL);
    };

    blk_c = ^ unsigned long (unsigned long counter) {
        printf("\t\t\t\t%lu\n", (unsigned long)(floor(log2(counter))));
        return ((unsigned long)nil ^ counter)
                                              && ((counter % (1UL << 1UL) ^ (1UL << 0UL)) & (*blka_t)(counter))
                                                                                                                  | (*blkb_t)(counter);
    };
    
//    (*blkc_t)((unsigned long)(count));

    
    /*
     
     typedef typeof(unsigned long(^)(unsigned long)) predicate_function;
     typedef typeof(unsigned long(^*)(unsigned long)) predicate_function_t;

     predicate_function func_a, func_b, func_c;
     __block predicate_function_t funca_t = &func_a, funcb_t = &func_b, funcc_t = &func_c;
     __block unsigned long a, b, c;
     __block unsigned long * at = &a, * bt = &b, * ct = &c;

     func_c = ^ unsigned long (unsigned long counter) {
         *ct = (unsigned int)counter;
         return (unsigned long)(((((unsigned long)nil ^ counter) && (*funcb_t)(~-counter)))); // how many times to call func_b...
     };

     func_b = ^ unsigned long (unsigned long counter) {
         *bt = (unsigned int)counter;
         return ((*funca_t)(counter)) ^ ((*funcc_t)(1)); // ...after calling func_a so many times
     };
     
     func_a = ^ unsigned long (unsigned long counter) {
         *at = (unsigned int)counter;
         printf("%lu\t\t%lu\t\t%lu\n", *ct, *bt, *at);
         return (unsigned long)(((((unsigned long)nil ^ counter) && (*funca_t)(~-counter))));
     };
     
     
     */
    
#define TRUE_BIT 1UL
    
    typedef typeof(unsigned long(^)(unsigned long)) predicate_function;
    typedef typeof(unsigned long(^*)(unsigned long)) predicate_function_t;

    predicate_function func_a, func_b, func_c;
    __block predicate_function_t funca_t = &func_a, funcb_t = &func_b, funcc_t = &func_c;
    __block void * current = (predicate_function_t)&func_a;
    __block void * swap = (predicate_function_t)&func_b;
    __block uintptr_t new;
    __block unsigned long a, b, c;
    __block unsigned long * at = &a, * bt = &b, * ct = &c;

//    func_c = ^ unsigned long (unsigned long counter) {
//        *ct = (unsigned int)counter;
//        printf("c == %lu\n", *ct);
////        (predicate_function_t)({ (uintptr_t)swap ^ (uintptr_t)current; swap;});
    ////        (uintptr_t)({ (uintptr_t)current ^ (uintptr_t)swap; });
    ////        (uintptr_t)({ (uintptr_t)swap ^ (uintptr_t)current; });
//        (*((predicate_function_t)({ (uintptr_t)swap ^ (uintptr_t)current; swap;})))(3);
//
////        ({ (uintptr_t)current ^ (uintptr_t)swap ^ (uintptr_t)({ swap = current; }); });
//
//        return (unsigned long)(((((unsigned long)nil ^ counter) && (predicate_function_t)(*current)))(~-counter))));
//    };
//
    func_a = ^ unsigned long (unsigned long counter) {
        *at = (unsigned int)counter;
        printf("a == %lu\n", *at);
        return counter; //(unsigned long)(((((unsigned long)nil ^ counter) && (*funca_t)(~-counter)))) & (*funcc_t)(0);
    };
    
    func_b = ^ unsigned long (unsigned long counter) {
        *bt = (unsigned int)counter;
        printf("b == %lu\n", *bt);
        return counter; //(unsigned long)(((((unsigned long)nil ^ counter) && (*funcb_t)(~-counter)))) & (*funcc_t)(0);
    };
    
    //(0 ^ [number of ops]) && ((0 ^ [number of elements]) && ops[~-number of ops]))
    
    // ops[number] &
    
    // elements[number of elements]
    
    printf("swap 1 == %lu\n", (*((predicate_function_t)(swap)))(3));
//    (predicate_function_t)({ swap = (uintptr_t)swap ^ (uintptr_t)current; swap; });
//    (predicate_function_t)({ current = (uintptr_t)current ^ (uintptr_t)swap; current; });
//    (predicate_function_t)({ swap = (uintptr_t)swap ^ (uintptr_t)current; swap; });
    (predicate_function_t)({ swap = (uintptr_t)swap ^ (uintptr_t)current ^ (uintptr_t)(current = (uintptr_t)swap); swap; });
    printf("swap 2 == %lu\n", (*((predicate_function_t)(swap)))(5));
    
    stream_composition_demo();
    
}

static void(^stream_composition_demo)(void) = ^{
    typedef typeof(unsigned long)              predicate;
    typedef typeof(predicate(^)(predicate))    predicate_function;
    typedef typeof(predicate(^(*))(predicate)) predicate_function_t;
    
    typeof(predicate_function)   stream_op;
    typeof(predicate_function_t) stream_op_t = &stream_op;
    
    typeof(predicate_function)   predicate_op;
    typeof(predicate_function_t) predicate_op_t = &predicate_op;
    predicate_op = ^ predicate (predicate p) {
        printf("\t\tpredicate\n");
        return (unsigned long)(((unsigned long)nil ^ p) && (*predicate_op_t)(~-p));
    };
    
    typeof(predicate_function)   function_op;
    typeof(predicate_function_t) function_op_t = &function_op;
    function_op = ^ predicate (predicate p) {
        printf("function\n");
        return (unsigned long)(((unsigned long)nil ^ (*predicate_op_t)(p)));
    };
    
    stream_op = ^ (typeof(predicate_function_t) func, typeof(predicate_function_t) pred) {
        __block predicate_function_t operation = pred;
        return ^ predicate (predicate p) {
            return (*(typeof(predicate_function_t))((operation = (predicate_function_t)(void *)(uintptr_t)((uintptr_t)(pred) ^ (uintptr_t)(func) ^ (uintptr_t)(operation)))))(p);
        };
    }(function_op_t, predicate_op_t);
    
    stream_op(5UL);
};

@end
