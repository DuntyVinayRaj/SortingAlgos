//
//  SelectionSort.m
//  CustomKeyBoard
//
//  Created by Vinay Raj on 01/08/14.
//  Copyright (c) 2014 Vinay Raj. All rights reserved.
//

#import "SelectionSort.h"

@implementation SelectionSort

/*  Best: n^2, Average: n^2, Worst:n^2
 Inefficient on large lists
 Worse performance from insertion sort
 Steps
 
 Divide the input list into two parts,  the sublist of items already sorted, which is built up from left to right at the front (left) of the list, and the sublist of items remaining to be sorted that occupy the rest of the list.
 Initially, the sorted sublist is empty and the unsorted sublist is the entire input list.
 The algorithm proceeds by finding the smallest (or largest, depending on sorting order) element in the unsorted sublist, exchanging it with the leftmost unsorted element (putting it in sorted order), and moving the sublist boundaries one element to the right. */


-(NSArray *)selectionSort:(NSMutableArray *)unsortedDataArray{
    int pointerMin;
    int i,j;
    long count = unsortedDataArray.count;
    int selectionSortCount = 0;
    
    for (j=0; j<count;j++ )
    {
        //for each element in the array, assume that the first element is the minimum number
        pointerMin =j;
        for (i=j+1;i<count;i++)
        {
            //Iterate through each element in the array starting from the next element and compare with minimum number set from the outer for loop
            if ([unsortedDataArray objectAtIndex:i] < [unsortedDataArray objectAtIndex:pointerMin] )
            {
                pointerMin = i; //Change pointer to minimum number if new min found
                selectionSortCount++;
            }
        }
        if (pointerMin !=j) //if new pointer is not same as the old pointer then swap
        {
            [unsortedDataArray exchangeObjectAtIndex:j withObjectAtIndex:pointerMin];
        }
    }
    return unsortedDataArray;
}

@end
