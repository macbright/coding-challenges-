# coding-challenges-

This is a compilation of coding challenges i solved during my ruby course and javascript. feel free to contribute and share your approach to the challenges.

# 1) A Tree in an Array

    To store a Binary Tree in an Array, we just need to determine the order  that we store the Nodes in. A good order is "breadth-first" where we  store the items in order top-down and left-to-right of the tree.

    Here's a tree represented as an array:

    And this is the tree 'unfolded':

    Notice that 5 only has one child Node, so the other child is represented as 0 in the above array. This is OK as long as we don't need to store  actual 0 values.

    # Challenge

    The input for this challenge will provide an array of numbers in the above "breadth-first" format, and use 0's for non-nodes.
    Can you print out the sum of the Leftmost side of the Tree?

    Tip: A number located at position i in an array will have it's left child located at the position 2i+1 in the array.

    # my solution file name "tree_sum_of_the_outermost_left.rb" inside data structure file.

# 2) Creating a Tree

    Creating a Tree

    The previous challenge showed how to store a Tree in an Array. But how do you convert a Tree from an Array to the more-standard Node form?

    Implementing a Tree

    To implement a Tree, we'll create a Node class. It will store an integer of Data, and point to 2 child Nodes.

    class Node
    attr_reader :data
    attr_accessor :left, :right

    def initialize(data)
        @data = data
    end

    end


    Create a Node node from a given cell i in the array: Node node = new Node(array[i]);
    Create the children Nodes from their positions in the array. (See step #1).
    Assign the children Nodes to node.left and node.right.

    You first create a Node, and then you create children Nodes in the  same manner. This sounds like a recursive function will be needed!

    As  mentioned, since trees are recursive structures, recursive functions are  used to navigate them.

    Here's the above algorithm:

    def array_to_tree(array, i)
    return nil if i >= array.length || array[i] == 0

    node = Node.new(array[i])
    node.left = array_to_tree(array, 2*i+1)
    node.right = array_to_tree(array, 2*i+2)

    node
    end

    Traversing a Tree in Pre-order

    Pre-order traversal means you process a Node and then process its sub-trees.

    Here is the pre-order algorithm:

    def pre_order(node)
    if node == nil
        return ''
    end

    "#{node.data} #{pre_order(node.left)} #{pre_order(node.right)}"
    end

    Challenge

    You will be given an array as input, which represents a Tree. Process the array into a Tree of Nodes, as shown above. Then go through the tree and print it in post-order.
    Print each number space-separated.

    Example test case

    tree = array_to_tree([10, 1, 2, 3, 4, 5, 6])

    puts post_order(tree)
    #=> 3 4 1 5 6 2
    # my solution file name "creating_tree.rb" in the data structure file.

# 3) Binary Search Tree

    The Binary Search Tree is a a Binary Tree which stores keys in a sorted manner. Every node's key is smaller than all the key's in the node's left subtree and greater than all the key's in the nodes right subtree. Here's an example:


    Inserting Elements in the Tree
    Insertion and Search can usually be done very quickly in a binary Tree. The smallest and largest elements in the tree are easy to find. It's simple to go from one element to the next in the tree and to through the entire Tree in order.


    Challenge
    You will be given an array of numbers as input. Insert the numbers (in order) one-at-a-time into a binary search tree. Then return a string with the tree in pre-order (You can use the pre-order function that you wrote in the previous lesson).

    binary_search_tree([8, 3, 10, 1, 6, 14, 4, 7, 13])
    # => "8 3 1 6 4 7 10 14 13"
    MY SOLUTION IN FILE "binary_search_tree.rb" in the data structure folder

# Graphs

    There are many ways to represent a graph in a computer. A good structure should balance using space efficiently and performing operations quickly. As seen with Trees, you could represent the data with individual Nodes. However, this wouldn't let you quickly access any Node in the graph. A good alternative is to create an array or list to represent all the nodes. Each cell in the list can then store a list of all the Nodes that are connected to that Node.

    For example, the following graph can be represented as shown below:

    index|list of connected nodes
    -----------------------------
    0    |2
    1    |4
    2    |5 0 3
    3    |2
    4    |1 5
    5    |4 2

    This shows the connections between nodes 0 and 2, nodes 1 and 4, etc.

    Challenge

    You will be given lists of numbers as input based on the above format. Then start from Node 0 and repeatedly visit the next connected node until you reach Node 4. You need to return an array with all the nodes visited.

    While Nodes don't necessarily have a set order for their connections, in this challenge you should go to the first Node in the list of input. For example, in the above graph, go from 0 to 2 to 5 to 4 and then stop.

    hash = {
    0 => [2],
    1 => [4],
    2 => [5, 0, 3],
    3 => [2],
    4 => [1, 5],
    5 => [4, 2]
    }

    p graph(hash)
    # => [0, 2, 5, 4]
    MY SOLUTION FILE "graphs.rb" INSIDE THE DATA STRUCTURE FOLDER

# Breadth-First Search

    BFS begins at one node in a graph and visits all the neighboring nodes. It then goes to each of those neighbors to explore their unvisited neighbors in order. So it goes through the entire graph one level at a time, until the whole graph has been visited.


    BFS goes through the Nodes one level at a time, so you need a structure to keep track of the next nodes to be processed.

    Q: What structure can be used to access items in the order they were put in?
    A: A Queue

    Challenge
    Return an array with the given graph in BFS order.

    Sample Input
    graph = {
    0 => [2],
    1 => [4],
    2 => [5, 0, 3],
    3 => [2],
    4 => [1, 5],
    5 => [4, 2]
    }

    bfs(graph)
    # => [0, 2, 5, 3, 4, 1]
    MY SOLUTION FILE "data_structures/bfs.rb" inside the data structure folder

# DFS Algorithm

    DFS goes through a graph as far as possible in one direction before backtracking to other nodes. DFS is similar to the pre-order tree traversal, but you need to make sure you don't get stuck in a loop. To do this, you'll need to keep track of which Nodes have been visited.

    Challenge

    Create a graph from the given input and Run through it with a Depth-first-search. Return an Array with the nodes in the order you first visit them. Visit the first adjacent Node in the input before going on to the other nodes.

    Example
    graph = {
    0 => [2],
    1 => [4],
    2 => [5, 0, 3],
    3 => [2],
    4 => [1, 5],
    5 => [4, 2]
    }

    depth_first_search(graph)
    # => [0, 2, 5, 4, 1, 3]

    Explanation
    For this challenge, visit equivalent nodes in the same order as their input. For example, 5 comes before 3 in the output since it was before 3 in the input.
    MY SOLUTION FILE "data_structures/dfs.rb" in DATA STRUCTURE FOLDER

# How Tall is the Tree?

    Can you find the height of a Binary Tree? The height is the number of Nodes from the Root to the lowest Leaf. The Tree does not need to be balanced.

    For example, in the tree below, the height is 4:


    Challenge
    Return the height of the Tree.

    Example

    array_tree = [2, 7, 5, 2, 6, 0, 9]

    puts binary_tree_height(array_tree)
    => 3
    MY SOLUTION FILE "data_structures/tree_height.rb" in the data structure folder

# Is it a Search Tree?

    Given a binary tree, can you determine if it is a proper Binary Search Tree?

    In a binary search tree, every descendant to the right of node P must be greater than P, and every descendant to the left of P must be less than P.

    The input will be given as a list, as in the previous exercises.

    Here's a good Binary Search Tree:

    ...and here's a bad one:


    This tree is not a proper BST for 2 reasons:
    - The 8 is smaller than the 9, even though it is in a right subtree of 9.
    - The 6 is smaller than the 7, even though it is in a right subtree of 7.

    Challenge
    Return true if the given tree is a proper binary search tree, and false otherwise.

    Example
    tree = [10, 4, 12]

    search_tree?(tree)
    # => true
    MY SOLUTION FILE "search_tree.rb" inside the data structure folder.

# Is it balanced?

    Can you check if a tree is a height-balanced?

    In this challenge, a tree is height-balanced if the maximum and minimum path from any node to a terminal (null node) descendant differs by at most 1.

    For example, this tree is not height-balanced, since the minimum path going down from 5 (to the left) is 2 less than the maximum path from 5 (to 9 and 4).


    Challenge
    Return true if a given tree is height-balanced and false otherwise.

    Example
    tree = [1, 2, 0, 3, 4, 0, 0]

    balanced_tree?(tree)
    # => false

    MY SOLUTION FILE "is_it_balanced.rb" inside the data structure folder.

# Connected Components (Graph)

    Are all the components connected on the given Graph?

    A graph is considered one connected component if every node is connected along a path with every other node.

    The following graph is not one connected component, since the 1 and 4 cannot be reached from the 0,2,3 and 5.

    Challenge
    Given a graph, return true if the graph is one connected component, and false otherwise.

    Example
    graph = {
    0 => [2],
    1 => [4],
    2 => [0, 5, 3],
    3 => [5, 2],
    4 => [5, 1],
    5 => [4, 2, 3]
    }

    puts connected_graph?(graph)
    # => true
    MY SOLUTION FILE "connect_component.rb" inside the data structure folder.

# Find the Cycles

    Both Trees and Graphs consist of Nodes pointing to each other. In fact, a tree is just a type of graph that contains no cycles. A cycle means you can leave a node along one path and return to it on a different path. Can you determine if there are any cycles in a graph?

    No Cycles in this Graph:

    But there are multiple Cycles in this Graph:

    Challenge
    Return true if the graph has a cycle and false otherwise.

    Example
    graph = {
    0=>[2],
    1=>[4],
    2=>[0, 5, 3],
    3=>[5, 2],
    4=>[5, 1],
    5=>[4, 2, 3]
    }

    puts graph_cycle?(graph)
    # => true

# Sets

    These are the important methods a Set supports:
    add(item) - Adds an item to the Set.
    delete(item) - Removes an item from the Set.
    include?(item) - Returns true if the item is in the Set, and false otherwise.

    Purpose of Sets
    The Set is useful when you want to check if items are in a collection but there's no specific order that you care about. For example, let's say you're given a raw list of numbers and need to find the numbers that appear more than once. What Algorithm could you use to find them?

    Solution

    Create a Set for holding the items. For each item, check if it's already in the Set. If it is, you've found a duplicate. Otherwise add the item to the Set.

    Standard Sets
    Ruby standard library has a class Set.
    Documentation: http://ruby-doc.org/stdlib/libdoc/set/rdoc/Set.html

    Challenge
    A duplicate is a number whose value appeared earlier in the list. Given a list of numbers, return an array with all the duplicates in the order that they appear. (Duplicates that appear multiple times should be printed multiple times).
    Use Ruby's Set class to solve the challenge.

    Example
    arr = [1, 2, 3, 1, 5, 6, 7, 8, 5, 2]

    p find_duplicates(arr)
    # => [1, 5, 2]

# Maps

    A Map is also known as a Dictionary, since it can be used to store items in a similar manner as a dictionary, where each word maps to a specific definition. These are the basic methods of a Map:
    [key] = value - Adds the key and value to the map, so they are now associated with each other. If this key was already in the Map, it will now point to the new value only.
    [key] - Returns the value that the key maps to.
    delete(key) - Removes the key-value mapping of this key from the map.
    has_key?(key) - This returns true if the key is in the map and false otherwise (like the contains method of Set).

    Map in Ruby
    Ruby standard library has the class Hash.
    https://ruby-doc.org/core/Hash.html

    Challenge
    Return the number in each list that appears the most times.

    Example
    array = [1, 2, 3, 1, 5]

    appears_most_times(array)
    # => 1

# HashTables

    Maps and Sets provide a clean interface for accessing or looking up the elements within them. There are a number of different ways in which they can be implemented, but the most common one uses a technique known as hashing.

    Q: What is Hashing and what makes it so special?
    A: A program usually needs to check through multiple elements in a collection to find a single element, but hashing lets it find items immediately, regardless of the size of the collection!

    Q: How does hashing do that?
    A: Let's see by implementing a basic HashTable.

    Implementing a HashTable
    Let's say you have a set of integer keys which map to values and you want to create a structure that can find and modify the values in constant time.
    If your set of keys was just a small range of integers, a HashMap would not be necessary since you could use a simple array to store the values, with the index values of the array as 'keys':

    In the above array, 0 'maps' to 4 and 4 'maps' to 7. You can create a new 'mapping' for any key k (where k is less than the array's length) by simply updating kth cell in the array with the value you want.

    However, if the range of keys is large, an array would need to use up a lot of memory in order to store everything. For example, it would be very inefficient to create an Array of length 200M (200 Million) just to store the following 7 items:

    2, 341, 73, 8265, 234004, 7.4M, 200M

    Mini-challenge: Can you think of a simple way to convert the above data so it can be stored in a small array, say of size 10?

    Solution
    We can use the mod operator % on a number to get a remainder r and store the element in index r of the array. For example, if we did mod 10 on each number, we would get the following remainders:

    2, 1, 3, 5, 4, 0, 0

    We can then store the values in an array of size 10:

    Note that 200M didn't make it to the array, since the 0 cell was already occupied. When two keys end up at the same index, there's a collision. The simplest way to resolve collisions is to create a List at each location in the array, so multiple items can be stored. As long as collisions are rare, we'll still be able to find every item quickly.

    In the above case, for every number n, we did n % 10 to find the location of the element. This function is known as the Hash Function. Real-world hash functions are more complicated, but the purpose is to convert a number of any size to a number contained within a small range of values while avoiding too many collisions.

    Q: What if the data we're using as keys is not a number?
    A: All data is represented as numbers in some manner in a computer, so the computer can use those numbers in the hash function. The key idea of the hash function is to use the actual value of an item to find the item in an array.

    Challenge
    Create your own list-based hash table with n mod 11 as the hash function for each number n. Always use the absolute value of n.
    Given a list of numbers, hash them all into the hash table.
    Return an array with the numbers in the order that they appear in the hash table.

    Sample Input

    [12, 24, 125, 5, 91, 1106, 2, 1021, 29, 3536, 10]

    Sample Output

    [12, 24, 2, 91, 125, 5, 3536, 1106, 29, 1021, 10]

    The hash table will look like this at the end:

    0  1  2  3  4  5  6   7   8   9   10  //index
    . 12 24 91 125 5 1106 29  . 1021  10  //values
        2       3536

    Example
    hash_table([12, 24, 125, 5, 91, 1106, 2, 1021, 29, 3536, 10])
    # => [12, 24, 2, 91, 125, 5, 3536, 1106, 29, 1021, 10]

# Set

    The Set is able to add, find and remove items in constant time, so it can solve many problems in an optimal manner.

    A Set is a good choice whenever you have a large set of items and need to quickly check if a given item is in the set or not. We already saw that this can be used to detect duplicate data as you go through a list of numbers. It is often used to check live user data against established data for matches. For example, a Spell Checker that checks words as a user types them needs to extremely fast, so it uses a Set of real words to check if a given word is real or not. Here's a list of different cases where a Set could be used:

    When not to use a Set

    While a Set is great for quickly looking up items, sometimes other data structures are a better choice. For example, let's say you were implementing an autocomplete feature to suggest searches as a user types. To do this with a Set, you would need to store every prefix of a search as a separate entry, which would waste a lot of memory. For such cases, the Trie is a better choice of data structure.

    More information about the Trie: https://en.wikipedia.org/wiki/Trie

    Challenge
    Given a list of numbers, return how many are prime numbers are in the list. (A prime number is a number with no factors besides 1 and itself.)

    Sample Input

    2 3 5 6 9

    Sample Output

    3

    There are 3 prime numbers in the input: 2 3 5.

    Constraints

    All the numbers will be from 2 to 10,000.

    Guideline

    Create a Set of prime numbers less than 10,000. There are 2 ways you can do this:
    Use the Sieve of Eratosthenes, then create a set of the prime numbers from your sieve.
    Google it to find the values, hard-code an array with those numbers, and then copy the array values to a Set.
    Once you have this Set, the next part is easy.

    More about the Sieve of Eratosthenes: http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes

    Example
    puts number_of_primes([2, 3, 5, 6, 9])
    # => 3

# Hash Data Structure

    The Hash's basic operations (adding, removing and finding keys) can be done in constant time. The Hash's performance is useful for finding optimal solutions to many different problems.

    Dictionary Data Structure
    Many projects involve matching keys and values so the Map data type is often a natural fit for implementing them:

    When Not to use Hash
    Q: If the Hash can do everything so quickly, why would I ever use another data structure for quickly looking up items?

    A: It's great for quickly looking up keys and values, but it doesn't store the items in order. Sometimes an application needs to get the next elements in order on a list, or display all the elements in order at once. For example, you could use a Hash for a simple PhoneBook-lookup app, but it wouldn't be able to display the Phonebook contacts in alphabetical order. For such an app, you would want to use a sorted data structure instead, such as the TreeMap (a type of Search Tree).

    Challenge
    The "Prime Prime" is a prime number that is the factor of the most numbers in a given list. Can you find the Prime prime in each list?
    For example, for the list {2, 3, 5, 6, 9}, the answer is 3, since 3 is a factor of 3, 6, and 9, which is more than any other number in the list.
    Note: Unlike the prime challenge, here each number N in a list will be in the range 2 to 10,000.

    Guideline

    Get all the prime numbers that you need like in the previous challenge. Then use a Hash to keep track of the number of times each prime number is factor of a number in the list.

    Example
    puts prime_prime([2, 3, 5, 6, 9])
    # => 3

    MY SOLUTION FILE "prime_prime.rb" inside the sets folder.

# More Practice

    Hash and Sets are useful in a wide variety of challenges. Below is another practice challenge.

    Challenge
    Given a list of numbers, can you find all the pairs of numbers whose sum equals k?

    Input

    The provided function takes 2 parameters: an array array, and the special number k.

    Output

    Return an Array with the pairs of numbers. Print each pair with the first number followed by the second, and print all the pairs in the order that the second number appears in the list.

    Sample Input/Output
    Example
    p find_pairs([1, 9, 11, 13, 2, 3, 7], 12)
    # => [[1, 11], [9, 3]]

    12 is the special number. There are 2 pairs with that sum: 1 & 11 and 9 & 3. 11 appears before 3 in the input, so that pair is printed first.

    Full Credit
    Solve the problem with only one iteration through the numbers.

    MY SOLUTION FILE "more_practice.rb" inside the sets folder.

# Insertion Sort Itself

    In Insertion Sort Part 1, you sorted one element in the array. Using the same approach repeatedly, can you sort an entire unsorted array?

    Output
    In this challenge print the array every time an element is “inserted” into the array in (what is currently) its correct place (even if it doesn't move). Begin printing from the second element and on.

    Challenge
    Can you print the steps of Insertion Sort?

    Example
    sort_itself([1, 4, 3, 6, 9, 2])
    # => 1 4 3 6 9 2
    #    1 3 4 6 9 2
    #    1 3 4 6 9 2
    #    1 3 4 6 9 2
    #    1 2 3 4 6 9

    MY SOLUTION FILE "insertion.rb" inside the sorting folder.

# Running Time

    The running time of an algorithm for a specific input is the number of operations executed. We usually want to know how many operations an algorithm will take in proportion to the size of its input, N. We will look at how many shifts Insertion Sort takes.

    For each element V in an array of N numbers, InsertionSort shifts everything to the right until it can insert V into the array. If the array is already sorted, it will take 0 shifts to verify that.

    The worst case for Insertion Sort is if the array is in reverse order. To insert each number, the algorithm will need to shift over that number to the beginning of the array. Sorting the entire array of N numbers will therefore take 1+2+...+(N-1) operations, or N2 / 2.

    Can you modify your previous Insertion Sort code to keep track of the number of shifts it makes when sorting? The only thing you should print is the number of shifts your insertion sort makes to completely sort each test case. A shift is whenever an element is moved over in the array.

    Challenge
    How many shifts does Insertion Sort take?

    Example
    puts running_time([2, 1, 3, 1, 2])
    # => 4

    MY SOLUTION FILE "running_time.rb" inside the sorting folder.

# Counting Sort 1

    We will start with an easy task - counting.

    Given a list of integers, can you count and return the number of times each value appears?
    There is no need to sort the data, you just need to count it.

    Input

    The Input will be an array of numbers.

    Output:

    Output the number of times every number from 0 to 99 (inclusive) appears in the list.

    Example
    p counting_sort([63, 25, 73, 1, 98, 73, 56, 84, 86, 57, 16, 83, 8, 25, 81, 56, 9, 53, 98, 67, 99, 12, 83, 89, 80, 91, 39, 86, 76, 85, 74, 39, 25, 90, 59, 10, 94, 32, 44, 3, 89, 30, 27, 79, 46, 96, 27, 32, 18, 21, 92, 69, 81, 40, 40, 34, 68, 78, 24, 87, 42, 69, 23, 41, 78, 22, 6, 90, 99, 89, 50, 30, 20, 1, 43, 3, 70, 95, 33, 46, 44, 9, 69, 48, 33, 60, 65, 16, 82, 67, 61, 32, 21, 79, 75, 75, 13, 87, 70, 33])
    # => [0, 2, 0, 2, 0, 0, 1, 0, 1, 2, 1, 0, 1, 1, 0, 0, 2, 0, 1, 0, 1, 2, 1, 1, 1, 3, 0, 2, 0, 0, 2, 0, 3, 3, 1, 0, 0, 0, 0, 2, 2, 1, 1, 1, 2, 0, 2, 0, 1, 0, 1, 0, 0, 1, 0, 0, 2, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 2, 1, 3, 2, 0, 0, 2, 1, 2, 1, 0, 2, 2, 1, 2, 1, 2, 1, 1, 2, 2, 0, 3, 2, 1, 1, 0, 1, 1, 1, 0, 2, 2]

    Input/Output Explanation

    There were zero 0's in the input, so the zeroth number of output is "0". There were two 1's, so the next number is 2. Etc...

    Challenge
    Return an Array with the number of times each value appears.

    MY SOLUTION FILE "counting_sort_1.rb" inside the sorting folder.

# Simple Counting Sort

    In a simple sort, the only values that matter are the ones you are sorting. They are not keys to any other values. This makes counting sort very simple. If you already counted the values in the list, you don’t need to access the original list again. This challenge involves a simple counting sort where the elements being sorted are all that matter.

    Given an unsorted list of integers, output all the integers in ascending order.
    You should use your previous code that counted the items to print out the actual values in-order.

    Challenge
    Using your previous counting code, return an Array with the list of integers in order.

    Example
    p simple_counting_sort([63, 25, 73, 1, 98, 73, 56, 84, 86, 57, 16, 83, 8, 25, 81, 56, 9, 53, 98, 67, 99, 12, 83, 89, 80, 91, 39, 86, 76, 85, 74, 39, 25, 90, 59, 10, 94, 32, 44, 3, 89, 30, 27, 79, 46, 96, 27, 32, 18, 21, 92, 69, 81, 40, 40, 34, 68, 78, 24, 87, 42, 69, 23, 41, 78, 22, 6, 90, 99, 89, 50, 30, 20, 1, 43, 3, 70, 95, 33, 46, 44, 9, 69, 48, 33, 60, 65, 16, 82, 67, 61, 32, 21, 79, 75, 75, 13, 87, 70, 33])
    # => [1, 1, 3, 3, 6, 8, 9, 9, 10, 12, 13, 16, 16, 18, 20, 21, 21, 22, 23, 24, 25, 25, 25, 27, 27, 30, 30, 32, 32, 32, 33, 33, 33, 34, 39, 39, 40, 40, 41, 42, 43, 44, 44, 46, 46, 48, 50, 53, 56, 56, 57, 59, 60, 61, 63, 65, 67, 67, 68, 69, 69, 69, 70, 70, 73, 73, 74, 75, 75, 76, 78, 78, 79, 79, 80, 81, 81, 82, 83, 83, 84, 85, 86, 86, 87, 87, 89, 89, 89, 90, 90, 91, 92, 94, 95, 96, 98, 98, 99, 99]

     MY SOLUTION FILE "simple.counting_sort.rb" inside the sorting folder.
