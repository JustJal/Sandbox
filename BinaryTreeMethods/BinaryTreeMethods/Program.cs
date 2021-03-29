using System;
using System.Collections.Generic;


namespace BinaryTreeMethods
{
    public class Node
    {
        public int Key;
        public Node Left {get; set;}
        public Node Right { get; set; }
        static Node Root { get; set; } // If we have a tree, then we have a Root
        //This is the constructor
        public Node(int Key)
        {
            this.Key = Key;
            Left = Right = null;
        }

        //This is the returner of each node in PreOrder Transversal form (Each node from left to right) 
        static void PreOrder(Node temp)
        {
            if (temp is null) return;

            // We go from left to right, that's why we start from left
            Console.WriteLine(temp.Key + " ");
            PreOrder(temp.Left);
            PreOrder(temp.Right);
        }
        //This is the Method to insert. 
        static void InsertNode(Node temp, int Key)
        {
            if (temp is null)
            {
                Root = new Node(Key);// Thiis creates a new Root if there isnt any
                return;
            }

            Queue<Node> ToCheck = new Queue<Node>(); // First time I use this, I think is really useful. Thanks Microsoft! 
            ToCheck.Enqueue(temp);

            // The same as PreOrder method applies here
            while (ToCheck.Count != 0)
            {
               temp = ToCheck.Dequeue(); // So now we drop the Node that we are checking from the queue and return it to temp.

                if (temp.Left == null)
                {
                    temp.Left = new Node(Key);
                    break; //We break the while beacuse we just want to add 1 Node per Method
                }
                else
                    ToCheck.Enqueue(temp.Left); // Now we enqueue it as a single node to check each node 
                                                // it contains like temp.Left.Left/Right or temp.Right.Left/Right
                if (temp.Right == null)
                {
                    temp.Right = new Node(Key);
                    break;
                }
                else
                    ToCheck.Enqueue(temp.Right);
            }

        }
        static void Delete_Node(Node TreeNode, Node DeleteNode) //It goes where it has to go but doesnt make anything.
        {
            if (TreeNode is null)return;

            if (DeleteNode.Key < TreeNode.Key)
            {
                Delete_Node(TreeNode.Left, DeleteNode); //We check the left one
            }
            else if (DeleteNode.Key > TreeNode.Key)
            {
                Delete_Node(TreeNode.Right, DeleteNode); // We check the right one
            }

            if (TreeNode.Key.Equals(DeleteNode.Key))
            {
                //No child nodes
                if (TreeNode.Left == null && TreeNode.Right == null)
                {
                    TreeNode = null;
                    return;
                }
                else if (TreeNode.Left == null) //No left child root
                {
                    TreeNode = TreeNode.Right; // We swap the root we are looking to delete to a child 
                    TreeNode.Right = null; //and then we delete it
                    return;
                }
                else if (TreeNode.Right == null)//No right child root
                {
                    TreeNode = TreeNode.Left;
                    TreeNode.Left = null;
                    return;
                }
                else // It is a complete node
                {
                    Node Min = FindMin(TreeNode.Left);
                    TreeNode = Min;
                    Delete_Node(TreeNode.Left, Min);
                }
            }
        }
        static Node FindMyParent(Node TreeNode, Node Child)
        {
            if (TreeNode is null) return TreeNode;

            if (Child.Key < TreeNode.Key)
            {
                return FindMyParent(TreeNode.Left, Child); //We check the left one
            }
            else if (Child.Key > TreeNode.Key)
            {
                return FindMyParent(TreeNode.Right, Child); // We check the right one
            }

            if (TreeNode.Left.Equals(Child) || TreeNode.Right.Equals(Child)) return TreeNode;

            return TreeNode;
        }
        static Node FindMin(Node Temp) // This Method search for the nearest left node 
        {
            Node ThisOne = Temp;

            while(ThisOne.Left != null)
            {
                ThisOne = ThisOne.Left;
            }
            return ThisOne;
        }

        //Invert Recursive Method
        static void InvertTree(Node Temp)
        {
            if (Temp is null) return;

            Node _temp = Temp.Right;
            Temp.Right = Temp.Left;
            Temp.Left = _temp;  // We swap each child node of each node

            //We take the node as parent and pass through swap
            InvertTree(Temp.Left);
            InvertTree(Temp.Right);
        }

        static void Main(string[] args) //first we have to create our BinaryTree where Root.Left.Left = Null
        {
            //Im not creating a new object because im in the same class and are static
            Root = new Node(10);//------------------------10
            Root.Left = new Node(8);//------------------/----\
            Root.Left.Left = new Node(4);//------------8-----21
            Root.Right = new Node(21);//-------------/--\---/--\
            Root.Right.Right = new Node(30);//------4---N--15--30
            Root.Right.Left = new Node(15);// Where N = null

            // So now we print it
            Console.WriteLine("\n PreOrder transversal before inserting:");
            PreOrder(Root);

            InsertNode(TreeNode, 12);
            Console.WriteLine("\n PreOrder transversal after inserting:");
            PreOrder(Root);

            InvertTree(Root);
            Console.WriteLine("\n PreOrder transversal after inverting:");
            PreOrder(Root);

            InvertTree(Root); //I invert it again because its easier to read
            Delete_Node(Root, Root.Left);
            Console.WriteLine("\n PreOrder Transversal after Deleting:");
            PreOrder(Root);

            Console.ReadKey();
        }
    }
}
