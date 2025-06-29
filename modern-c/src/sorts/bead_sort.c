#include "bead_sort.h"
#include <stdlib.h>
#include <string.h>

void bead_sort(int* arr, size_t size)
{
    if (arr == NULL || size == 0)
    {
        return;
    }

    // Find the maximum value in the array
    int max = arr[0];
    for (size_t i = 1; i < size; i++)
    {
        if (arr[i] > max)
        {
            max = arr[i];
        }
    }

    // Allocate a 2D array to represent beads (0s and 1s)
    unsigned char* beads =
        (unsigned char*) calloc(size * max, sizeof(unsigned char));
    if (beads == NULL)
    {
        return; // Handle memory allocation failure
    }

    // Place beads: set beads[i * max + j] to 1 for each unit in arr[i]
    for (size_t i = 0; i < size; i++)
    {
        for (int j = 0; j < arr[i]; j++)
        {
            beads[i * max + j] = 1;
        }
    }

    // Let beads fall (count beads in each column)
    for (int j = 0; j < max; j++)
    {
        int sum = 0;
        for (size_t i = 0; i < size; i++)
        {
            sum += beads[i * max + j];
            beads[i * max + j] = 0;
        }
        // Place beads at the bottom of the column
        for (size_t i = size; i > size - sum; i--)
        {
            beads[(i - 1) * max + j] = 1;
        }
    }

    // Convert beads back to array
    for (size_t i = 0; i < size; i++)
    {
        int count = 0;
        for (int j = 0; j < max; j++)
        {
            count += beads[i * max + j];
        }
        arr[i] = count;
    }

    free(beads);
}
