#include "bead_sort.h"
#include <algorithm>
#include <cstddef>
#include <stdexcept>

// The implementation of bead_sort remains here
std::vector<int> bead_sort(std::vector<int> arr)
{

    std::size_t num_elements = arr.size();
    if (num_elements == 0)
    {
        return arr;
    }

    // throw error if negative number
    for (int val : arr)
    {
        if (val < 0)
        {
            throw std::invalid_argument(
                "Bead sort does not support negative number");
        }
    }

    // max value of array
    int max_val = *std::max_element(arr.begin(), arr.end());

    // create grid
    std::vector<std::vector<int>> beads(num_elements,
                                        std::vector<int>(max_val, 0));

    // step 1: drop beads
    for (std::size_t i = 0; i < num_elements; ++i)
    {
        for (std::size_t j = 0; j < arr[i]; ++j)
        {
            beads[i][j] = 1;
        }
    }

    // step 2: let breads fall down
    for (std::size_t j = 0; j < max_val; ++j)
    {
        int sum = 0;
        for (std::size_t i = 0; i < num_elements; ++i)
        {
            sum += beads[i][j];
            beads[i][j] = 0;
        }

        for (std::size_t i = num_elements - sum; i < num_elements; ++i)
        {
            beads[i][j] = 1;
        }
    }

    // step 3: read sorted values
    for (std::size_t i = 0; i < num_elements; ++i)
    {
        int count = 0;

        for (std::size_t j{}; j < max_val; ++j)
        {
            if (beads[i][j] == 1)
            {
                count++;
            }
        }
        arr[i] = count;
    }

    return arr;
}
