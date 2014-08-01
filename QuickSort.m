//
//  QuickSort.m
//  CustomKeyBoard
//
//  Created by Vinay Raj on 01/08/14.
//  Copyright (c) 2014 Vinay Raj. All rights reserved.
//

#import "QuickSort.h"

@implementation QuickSort

/* The quicksort algorithm divides a list/array into two smaller arrays (low elements & high elements)
 Step 1: Pick a pivot point (In this sample we have picked a random pivot point between the range of the list)
 Step 2: Divide/Reorder the list so that all the elements smaller than the pivot is added to the low elements array and all the elements greater than the pivot are added to the high element array.
 Step 3: Repeat Step 1 and Step 2 for the sub arrays/lists
 Recreate the array by joining (the lowelement array), (the pivot) and (the high element array)
 Best: n Log n, Average: n log n, Worst:n^2 */

-(NSArray *)quickSort:(NSMutableArray *)unsortedDataArray
{
    
    NSMutableArray *lessArray = [[NSMutableArray alloc] init];
    NSMutableArray *greaterArray =[[NSMutableArray alloc] init];
    if ([unsortedDataArray count] <1)
    {
        return nil;
    }
    int quickSortCount = 0;
    int randomPivotPoint = arc4random() % [unsortedDataArray count];
    NSNumber *pivotValue = [unsortedDataArray objectAtIndex:randomPivotPoint];
    [unsortedDataArray removeObjectAtIndex:randomPivotPoint];
    for (NSNumber *num in unsortedDataArray)
    {
        quickSortCount++; //This is required to see how many iterations does it take to sort the array using quick sort
        if (num < pivotValue)
        {
            [lessArray addObject:num];
        }
        else
        {
            [greaterArray addObject:num];
        }
    }
    NSMutableArray *sortedArray = [[NSMutableArray alloc] init];
    [sortedArray addObjectsFromArray:[self quickSort:lessArray]];
    [sortedArray addObject:pivotValue];
    [sortedArray addObjectsFromArray:[self quickSort:greaterArray]];
    return sortedArray;
}

@end
