//
//  NSArray+BFKit.m
//  BFKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2014 Fabrizio Brancati. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "NSArray+BFKit.h"

/* circle index by maxSize, caculate from 0 to maxSize(not include)
 * eg: index = 0,  maxSize = 78, result 0
 * eg: index = -1, maxSize = 78, result 77
 */
NSInteger BFSuperCircle(NSInteger index, NSInteger maxSize) {
    if (index < 0) {
        index = index % maxSize;
        index += maxSize;
    }
    
    if (index >= maxSize) {
        index = index % maxSize;
    }
    
    return index;
}

@implementation NSArray (BFKit)

- (id)safeObjectAtIndex:(NSUInteger)index
{
    // modified by antwork
    if([self count] > index) return [self objectAtIndex:index];
    else return nil;
}

- (NSArray *)reversedArray
{
    // modified by antwork
    return [NSArray reversedArray:self];
}

- (NSString *)arrayToJson
{
    // modified by antwork
    return [NSArray arrayToJson:self];
}

+ (NSString *)arrayToJson:(NSArray*)array
{
    NSString *json = nil;
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:array options:0 error:&error];
    if(!error)
    {
        json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        return json;
    }
    else
        return nil;
}

+ (NSArray *)reversedArray:(NSArray*)array
{
    NSMutableArray *arrayTemp = [NSMutableArray arrayWithCapacity:[array count]];
    NSEnumerator *enumerator = [array reverseObjectEnumerator];
    
    for(id element in enumerator) [arrayTemp addObject:element];
    
    return array;
}

/*
 * when index is out of range, will from begin or end, like a circle
 */
- (id)objectAtCircleIndex:(NSInteger)index
{
    NSInteger realIndex = BFSuperCircle(index, self.count);
    
    return [self objectAtIndex:realIndex];
}

- (NSArray *)arrayWithOffset:(NSUInteger)offset reverse:(BOOL)reverse
{
    if (self.count <= 1) {
        return [self copy];
    }
    
    NSInteger realOffset = offset % self.count;
    
    NSMutableArray *resultArray = [NSMutableArray arrayWithCapacity:self.count];
    
    for (int i = 0; i < self.count; i++) {
        NSInteger realIndex = !reverse?(i - realOffset):(i + realOffset);
        id object = [self objectAtCircleIndex:realIndex];
        [resultArray addObject:object];
    }
    
    NSArray *backArray = [resultArray copy];
    
    return backArray;
}

@end
