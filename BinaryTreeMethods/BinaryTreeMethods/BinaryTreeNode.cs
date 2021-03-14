using System;
using System.Collections.Generic;
using System.Text;

namespace BinaryTreeMethods
{
    public class BinaryTreeNode<T> where T : IEquatable<T>
    {
        /// <summary>
        /// Returns true if the operation is valid, throws an exception if nodes are from different trees
        /// </summary>
        /// <param name="a"></param>
        /// <param name="b"></param>
        /// <returns></returns>
        internal static bool Validate(BinaryTreeNode<T> a, BinaryTreeNode<T> b)
             => a != null && b != null
                && ReferenceEquals(a, b)
                && (!ReferenceEquals(a.ParentTree, b.ParentTree)
                ? throw new InvalidOperationException("Cannot swap two nodes from different trees")
                : true);
        /// <summary>
        /// The child on the left side 
        /// </summary>
        public BinaryTreeNode<T> ChildLeft
        {
            get => ChildLeft__field;
            set
            {
                if (!Validate(this, value)) return;

                if (ChildLeft__field != null)
                    ChildLeft__field.Parent = null;
                ChildLeft__field = value;
                UpdateState();
            }
        }
        BinaryTreeNode<T> ChildLeft__field;
        /// <summary>
        /// The child on the right side
        /// </summary>
        public BinaryTreeNode<T> ChildRight
        {
            get => ChildRight__field;
            set
            {
                if (!Validate(this, value)) return;
                if (ChildRight__field != null)
                    ChildRight__field.Parent = null;
                ChildRight__field = value;
                UpdateState();
            }
        }
        BinaryTreeNode<T> ChildRight__field;
        /// <summary>
        /// The node's parent, null if it's the root node
        /// </summary>
        public BinaryTreeNode<T> Parent { get; internal set; }
        /// <summary>
        /// The parent Tree
        /// </summary>
        public BinaryTree<T> ParentTree { get; private set; }
        /// <summary>
        /// The instance's value
        /// </summary>
        public T Value { get; internal set; }
        
        internal NodeState State { get; private set; }
        internal enum NodeState : byte { Empty, Half, Full }
        private void UpdateState()
        {
            byte i = 0;
            if (ChildLeft__field != null)
                i++;
            if (ChildRight__field != null)
                i++;
            State = (NodeState)i;
        }

        public bool Either(BinaryTreeNode<T> node) => ReferenceEquals(node, ChildLeft) || ReferenceEquals(node, ChildRight);
        public bool Either(T value) => value.Equals(ChildLeft.Value) || value.Equals(ChildRight.Value);
        /// <summary>
        /// True for Left, False for Right, null for neither
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public bool? Which(T value) => value.Equals(ChildLeft.Value) ? true : value.Equals(ChildRight.Value) ? false : (bool?)null;
        /// <summary>
        /// True for Left, False for Right, null for neither
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public bool? Which(BinaryTreeNode<T> node) => ReferenceEquals(node, ChildLeft) ? true : ReferenceEquals(node, ChildRight) ? false : (bool?)null;

        internal BinaryTreeNode
            (T value, BinaryTree<T> parentTree, BinaryTreeNode<T> parent, BinaryTreeNode<T> childLeft = null, BinaryTreeNode<T> childRight = null)
        {
            ParentTree = parentTree;
            Value = value;
            Parent = parent;
            ChildLeft = childLeft;
            ChildRight = childRight;
        }

        internal BinaryTreeNode(BinaryTreeNode<T> other)//Copy constructor
        {
            ChildLeft = other.ChildLeft__field;
            ChildRight = other.ChildRight__field;
            Parent = other.Parent;
            ParentTree = other.ParentTree;
            Value = other.Value;
        }
    }
}
