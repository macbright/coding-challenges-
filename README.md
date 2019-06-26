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
