using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;

namespace BinaryTreeMethods
{
    public class BinaryTree<T> : IEnumerable<BinaryTreeNode<T>> where T : IEquatable<T>
    {
        /* Problems List:
         * If, at any point, there's a circular reference in any one of the nodes, this thing's entering an infinite loop
         */
        public BinaryTreeNode<T> Root { get; private set; }
        private void Swap(BinaryTreeNode<T> nodeA, BinaryTreeNode<T> nodeB)
        {
            if (!BinaryTreeNode<T>.Validate(nodeA, nodeB)) return;

            (nodeA.Value, nodeB.Value) = (nodeB.Value, nodeA.Value);
        }

        public void Remove(T key)
        {
            foreach (var i in this)
                if (i.Value.Equals(key))
                {
                    Remove(i);
                    break;
                }
        }

        public void RemoveAll(T key)
        {
            foreach (var i in this)
                if (i.Value.Equals(key))
                    Remove(i);
        }

        private bool RemoveNode(BinaryTreeNode<T> node)
        {
            switch (node.State)
            {
                case BinaryTreeNode<T>.NodeState.Empty:
                    return false;
                case BinaryTreeNode<T>.NodeState.Half:
                    if (node.ChildLeft != null)
                    {
                        Swap(node, node.ChildLeft);
                        node.ChildLeft = null;
                    }
                    else
                    {
                        Swap(node, node.ChildRight);
                        node.ChildRight = null;
                    }
                    break;
                case BinaryTreeNode<T>.NodeState.Full:
                    Swap(node, node.ChildRight);
                    node.ChildRight = null;
                    break;
            }
            return true;
        }
        public void Remove(BinaryTreeNode<T> node)
        {
            if (!RemoveNode(node))
                if ((bool)node.Parent.Which(node)) //We already know one of them is it, so it'll never be null
                    node.Parent.ChildLeft = null;
                else
                    node.Parent.ChildRight = null;
        }

        public void Add(T value)
        {
            foreach(var i in this)
                if (i.Either(null))
                {
                    if ((bool)i.Which(null))
                        i.ChildLeft = new BinaryTreeNode<T>(value, this, i);
                    else
                        i.ChildRight = new BinaryTreeNode<T>(value, this, i);
                    break;
                }
        }

        public bool Add(BinaryTreeNode<T> parent, T value)
        {
            if (parent.Either(null))
            {
                if ((bool)parent.Which(null))
                    parent.ChildLeft = new BinaryTreeNode<T>(value, this, parent);
                else
                    parent.ChildRight = new BinaryTreeNode<T>(value, this, parent);
                return true;
            }
            return false;
        }

        public IEnumerator<BinaryTreeNode<T>> GetEnumerator()
        {
            var queue = new Queue<BinaryTreeNode<T>>();
            queue.Enqueue(Root);
            BinaryTreeNode<T> root = null;
            while(queue.Count > 0) //If we use a foreach, we won't be able to change the collection
            {
                root = queue.Dequeue();
                if(root.ChildLeft != null)
                    queue.Enqueue(root.ChildLeft);
                if(root.ChildRight != null)
                    queue.Enqueue(root.ChildRight);
                yield return root;
            }
        }
        IEnumerator IEnumerable.GetEnumerator() => GetEnumerator();
    }
}
