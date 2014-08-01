//
//  MergeSort.m
//  CustomKeyBoard
//
//  Created by Vinay Raj on 01/08/14.
//  Copyright (c) 2014 Vinay Raj. All rights reserved.
//

#import "MergeSort.h"

@implementation MergeSort

/* Merge sorting is a good sorting algorithm and has consistent performance
 
 Divide the list into the smallest unit (1 element)
 Compare each element with the adjacent list to sort and merge the two adjacent lists
 Worst case performance O(n log n)
 Best case performance O(n log n)
 Average case performance O(n log n) */

-(NSArray *)mergeSort:(NSArray *)unsortedArray
{
    if ([unsortedArray count] < 2)
    {
        return unsortedArray;
    }
    long middle = ([unsortedArray count]/2);
    NSRange left = NSMakeRange(0, middle);
    NSRange right = NSMakeRange(middle, ([unsortedArray count] - middle));
    NSArray *rightArr = [unsortedArray subarrayWithRange:right];
    NSArray *leftArr = [unsortedArray subarrayWithRange:left];
    //Or iterate through the unsortedArray and create your left and right array
    //for left array iteration starts at index =0 and stops at middle, for right array iteration starts at midde and end at the end of the unsorted array
    NSArray *resultArray =[self merge:[self mergeSort:leftArr] andRight:[self mergeSort:rightArr]];
    return resultArray;
}

-(NSArray *)merge:(NSArray *)leftArr andRight:(NSArray *)rightArr
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    int right = 0;
    int left = 0;
    while (left < [leftArr count] && right < [rightArr count])
    {
        if ([[leftArr objectAtIndex:left] intValue] < [[rightArr objectAtIndex:right] intValue])
        {
            [result addObject:[leftArr objectAtIndex:left++]];
        }
        else
        {
            [result addObject:[rightArr objectAtIndex:right++]];
        }
    }
    NSRange leftRange = NSMakeRange(left, ([leftArr count] - left));
    NSRange rightRange = NSMakeRange(right, ([rightArr count] - right));
    NSArray *newRight = [rightArr subarrayWithRange:rightRange];
    NSArray *newLeft = [leftArr subarrayWithRange:leftRange];
    newLeft = [result arrayByAddingObjectsFromArray:newLeft];
    return [newLeft arrayByAddingObjectsFromArray:newRight];
}

@end
