import 'dart:math';

// Define a class for a tree node
class TreeNode {
  int value;
  List<TreeNode> children;
  TreeNode? parent; // Nullable parent reference

  TreeNode(this.value, [this.children = const [], this.parent]);

  // Function to add a child node
  void addChild(TreeNode child) {
    children.add(child);
    child.parent = this;
  }
}

// Function to compute the maximum delay from a node to any other node in its subtree
int computeMaxDelay(TreeNode node) {
  if (node.children.isEmpty) {
    return 0;
  }

  int maxChildDelay = 0;
  for (var child in node.children) {
    maxChildDelay = max(maxChildDelay, computeMaxDelay(child) + 1); // Assuming unit weight for each edge
  }
  return maxChildDelay;
}

// Function to split nodes based on delay and weight
Set<TreeNode> treeVertexSplitting(TreeNode root, int delta) {
  Set<TreeNode> boosterStations = {};

  void postOrderTraversal(TreeNode node) {
    if (node == null) return;

    for (var child in node.children) {
      postOrderTraversal(child);
    }

    int maxDelay = computeMaxDelay(node);
    if (node.parent != null && maxDelay + weight(node.parent!, node) > delta) {
      TreeNode newInnerNode = TreeNode(node.value);
      TreeNode newOuterNode = TreeNode(node.value);
      newInnerNode.children.addAll(node.children);
      node.children.clear();
      node.addChild(newInnerNode); // Change to addChild instead of add
      node.addChild(newOuterNode); // Change to addChild instead of add
      boosterStations.add(newInnerNode);
      boosterStations.add(newOuterNode);
    }
  }

  postOrderTraversal(root);

  return boosterStations;
}

// Function to return weight of an edge between two nodes (for demonstration, using random weights)
int weight(TreeNode v, TreeNode u) {
  return Random().nextInt(10) + 1; // Random weight between 1 and 10
}

void main() {
  // Create a sample tree
  TreeNode leaf1 = TreeNode(1);
  TreeNode leaf2 = TreeNode(2);
  TreeNode leaf3 = TreeNode(3);
  TreeNode leaf4 = TreeNode(4);
  TreeNode inner1 = TreeNode(5, [leaf1, leaf2]);
  TreeNode inner2 = TreeNode(6, [inner1, leaf3]);
  TreeNode root = TreeNode(7, [inner2, leaf4]);

  int toleranceDelta = 3;
  Set<TreeNode> result = treeVertexSplitting(root, toleranceDelta);

  print("Booster station vertices: ");
  for (var node in result) {
    print(node.value);
  }
}
