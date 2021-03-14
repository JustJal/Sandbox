using System;
using System.Collections.Generic;


namespace BinaryTreeMethods
{
    public class Node
    {
        public int Key;
        public Node Left, Right;
        static Node Root; // If we have a tree, then we have a Root
        //This is the constructor
        public Node (int Key)
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
            while(ToCheck.Count != 0)
            {
                temp = ToCheck.Peek(); // This returns the last element that has been added to the Queue
                ToCheck.Dequeue(); // So now we drop the Node that we are checking from the queue

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
        /*static void Delete_Node(Node Root, Node DeleteNode)
        {
            if (Root is null)return;
            
            if (Root.Key == DeleteNode.Key)
            {
                //No child nodes
                if (Root.Left == null && Root.Right == null)
                {
                    Root = null;
                }
                else if (Root.Left == null) //No left child root
                {
                    Swap(ref Root, ref Root.Right); // We swap the root we are looking to delete to a child 
                    Root.Right = null;                   //and then we delete it

                }
                else if (Root.Right == null)//No right child root
                {
                    Swap(ref Root, ref Root.Left);
                    Root.Left = null;
                }

                else // It is a complete node
                {
                    Node Min = FindMin(Root.Left);
                    Root.Key = Min.Key;
                    Delete_Node(Root.Left, Min);

                }
            }
            if (DeleteNode.Key > Root.Key)
            {
                Delete_Node(Root.Left, DeleteNode); //We check the left one
            }
            else
            {
                Delete_Node(Root.Right, DeleteNode); // We check the right one
            }

        }*/ //This method isnt working.

        //Swap Generic method
        static void Swap<T>(ref T A, ref T B)
        {
            // I made a tuple swap because im lazy to create a Temporal variable xd
            (A, B) = (B, A);
        }

        /*static Node FindMin(Node Temp) // This Method search for the nearest left node 
        {
            Node ThisOne = Temp;

            while(ThisOne.Left != null)
            {
                ThisOne = ThisOne.Left;
            }
            return ThisOne;
        }*/ // Since this method is part of Delete_Node it is unreferenced

        //Invert Recursive Method
        static void InvertTree(Node Temp)
        {
            if (Temp is null) return;

            Swap(ref Temp.Left, ref Temp.Right); // We swap each child node of each node

            //We take the node as parent and pass through swap
            InvertTree(Temp.Left); 
            InvertTree(Temp.Right);
        }

        static void Main(string[] args) //first we have to create our BinaryTree where Root.Left.Left = Null
        {
            //Im not creating a new object because im in the same class and are static
            Root = new Node(1);//--------------------------1
            Root.Left = new Node(2);//------------------/-----\
            Root.Left.Left = new Node(4);//------------2-------3
            Root.Right = new Node(3);//---------------/--\---/--\
            Root.Right.Right = new Node(7);//--------4---N--6---7
            Root.Right.Left = new Node(6);// Where N = null
            
            // So now we print it
            Console.WriteLine("\n PreOrder transversal before inserting:");
            PreOrder(Root);
            InsertNode(Root, 5);
            Console.WriteLine("\n PreOrder transversal after inserting:");
            PreOrder(Root);
            Console.WriteLine("\n PreOrder transversal after inverting:");
            InvertTree(Root);
            PreOrder(Root);

            /*Console.WriteLine("\n PreOrder Transversal after Deleting:");
            Delete_Node(Root, Root.Right.Left);
            PreOrder(Root);*/ //This Method isnt Working.

            Console.ReadKey();
        }
    }
}
