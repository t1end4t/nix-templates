#include "bead_sort.h" // Assuming bead_sort.h is in the include path
#include <gtest/gtest.h>
#include <vector>
#include <algorithm> // For std::is_sorted

// Test fixture for bead_sort tests
class BeadSortTest : public ::testing::Test {
protected:
    // You can add helper functions or setup/teardown logic here if needed
};

TEST_F(BeadSortTest, HandlesEmptyVector) {
    std::vector<int> arr = {};
    std::vector<int> expected = {};
    EXPECT_EQ(bead_sort(arr), expected);
}

TEST_F(BeadSortTest, HandlesAlreadySortedVector) {
    std::vector<int> arr = {1, 2, 3, 4, 5};
    std::vector<int> expected = {1, 2, 3, 4, 5};
    EXPECT_EQ(bead_sort(arr), expected);
}

TEST_F(BeadSortTest, HandlesReverseSortedVector) {
    std::vector<int> arr = {5, 4, 3, 2, 1};
    std::vector<int> expected = {1, 2, 3, 4, 5};
    EXPECT_EQ(bead_sort(arr), expected);
}

TEST_F(BeadSortTest, HandlesUnsortedVector) {
    std::vector<int> arr = {3, 1, 4, 1, 5, 9, 2, 6};
    std::vector<int> expected = {1, 1, 2, 3, 4, 5, 6, 9};
    EXPECT_EQ(bead_sort(arr), expected);
}

TEST_F(BeadSortTest, HandlesVectorWithDuplicateElements) {
    std::vector<int> arr = {5, 2, 8, 2, 5, 5};
    std::vector<int> expected = {2, 2, 5, 5, 5, 8};
    EXPECT_EQ(bead_sort(arr), expected);
}

TEST_F(BeadSortTest, HandlesVectorWithSingleElement) {
    std::vector<int> arr = {42};
    std::vector<int> expected = {42};
    EXPECT_EQ(bead_sort(arr), expected);
}

TEST_F(BeadSortTest, HandlesVectorWithAllSameElements) {
    std::vector<int> arr = {7, 7, 7, 7};
    std::vector<int> expected = {7, 7, 7, 7};
    EXPECT_EQ(bead_sort(arr), expected);
}

TEST_F(BeadSortTest, HandlesZeroInVector) {
    std::vector<int> arr = {3, 0, 1, 2};
    std::vector<int> expected = {0, 1, 2, 3};
    EXPECT_EQ(bead_sort(arr), expected);
}
