#include "bead_sort.h"
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

void test_bead_sort()
{
    // Test case 1: Empty array
    int arr1[] = {};
    size_t size1 = 0;
    bead_sort(arr1, size1);
    assert(size1 == 0);

    // Test case 2: Already sorted array
    int arr2[] = {1, 2, 3, 4, 5};
    size_t size2 = 5;
    bead_sort(arr2, size2);
    for (size_t i = 0; i < size2 - 1; i++)
    {
        assert(arr2[i] <= arr2[i + 1]);
    }

    // Test case 3: Reverse sorted array
    int arr3[] = {5, 4, 3, 2, 1};
    size_t size3 = 5;
    bead_sort(arr3, size3);
    for (size_t i = 0; i < size3 - 1; i++)
    {
        assert(arr3[i] <= arr3[i + 1]);
    }

    // Test case 4: Array with duplicate values
    int arr4[] = {3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5};
    size_t size4 = 11;
    bead_sort(arr4, size4);
    for (size_t i = 0; i < size4 - 1; i++)
    {
        assert(arr4[i] <= arr4[i + 1]);
    }

    // Test case 5: Array with negative values (Bead sort doesn't work with
    // negative numbers)
    int arr5[] = {-5, -4, -3, -2, -1};
    size_t size5 = 5;
    bead_sort(arr5, size5);
    // In this case the array should not be sorted because bead_sort is for
    // positive numbers
    // Test case 6: Array with zeros
    int arr6[] = {0, 0, 0, 0, 0};
    size_t size6 = 5;
    bead_sort(arr6, size6);
    for (size_t i = 0; i < size6; i++)
    {
        assert(arr6[i] == 0);
    }

    // Test case 7: Array with mixed positive and zero values
    int arr7[] = {5, 0, 3, 0, 1, 0, 2};
    size_t size7 = 7;
    bead_sort(arr7, size7);
    for (size_t i = 0; i < size7 - 1; i++)
    {
        assert(arr7[i] <= arr7[i + 1]);
    }
}

int main()
{
    test_bead_sort();
    printf("All test cases passed!\n");
    return 0;
}
