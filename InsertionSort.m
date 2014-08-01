//
//  InsertionSort.m
//  CustomKeyBoard
//
//  Created by Vinay Raj on 01/08/14.
//  Copyright (c) 2014 Vinay Raj. All rights reserved.
//

#import "InsertionSort.h"

@implementation InsertionSort

/* Simple Implementation
 Efficient on smaller datasets
 more efficient than selection sort and bubble sort
 Best =  n, Average = n^2, Worst = n^2 */

-(NSArray *)insertionSort:(NSMutableArray *)unsortedDataArray
{
    long count = unsortedDataArray.count;
    int i,j;
    int insertionSortCount = 0;
    for (i=1; i<count;i++)
    {
        j=i;
        while(j>0 && [[unsortedDataArray objectAtIndex:(j-1)] intValue] > [[unsortedDataArray objectAtIndex:j] intValue])
        {
            [unsortedDataArray exchangeObjectAtIndex:j withObjectAtIndex:(j-1)];
            j=j-1;
            insertionSortCount++;
        }
    }
    return unsortedDataArray;
}

@end
