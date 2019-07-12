# coding-challenges-
This is a compilation of coding challenges i solved during my ruby course and javascript. feel free to contribute and share your approach to the challenges.

# 1)  A Tree in an Array
    To store a Binary Tree in an Array, we just need to determine the order  that we store the Nodes in. A good order is "breadth-first" where we  store the items in order top-down and left-to-right of the tree.

    Here's a tree represented as an array:

    And this is the tree 'unfolded':

    Notice that 5 only has one child Node, so the other child is represented as 0 in the above array. This is OK as long as we don't need to store  actual 0 values.

    # Challenge

    The input for this challenge will provide an array of numbers in the above "breadth-first" format, and use 0's for non-nodes. 
    Can you print out the sum of the Leftmost side of the Tree?

    Tip: A number located at position i in an array will have it's left child located at the position 2i+1 in the array.

    # my solution file name "tree_sum_of_the_outermost_left.rb" inside data structure file.

# 2)  Creating a Tree
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

# 3)   Binary Search Tree
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
