#include "bead_sort.h"
#include <iostream>

int main()
{
    // create new vector first
    std::vector<int> arr = {6, 11, 12, 4, 1, 5};
    std::vector<int> result = bead_sort(arr);

    // print out result
    std::cout << "Sorted vector: ";
    for (int num : result)
    {
        std::cout << num << " ";
    }
    std::cout << std::endl;

    return 0;
}
