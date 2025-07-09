#include "bead_sort.h"
#include <stdio.h>

int main()
{
    int arr[] = {5, 3, 1, 7, 4, 2};
    size_t size = sizeof(arr) / sizeof(arr[0]);

    printf("Original array: ");
    for (size_t i = 0; i < size; i++)
    {
        printf("%d ", arr[i]);
    }
    printf("\n");

    bead_sort(arr, size);

    printf("Sorted array: ");
    for (size_t i = 0; i < size; i++)
    {
        printf("%d ", arr[i]);
    }
    printf("\n");

    return 0;
}
