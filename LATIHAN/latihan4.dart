class Node {
  int nodeValue;
  Node? next;

  Node(this.nodeValue) : next = null;
}

class SingleLinkedList {
  Node? head;

  bool isEmpty() => head == null;

  void insertFront(int data) {
    Node newNode = Node(data);
    newNode.next = head;
    head = newNode;
  }

  void insertBack(int data) {
    Node newNode = Node(data);
    if (isEmpty()) {
      head = newNode;
    } else {
      Node current = head!;
      while (current.next != null) {
        current = current.next!;
      }
      current.next = newNode;
    }
  }

  /// Insert a new node with [newData] after the node at [position] (1-based index).
  void insertAfterPosition(int position, int newData) {
    if (position < 1 || isEmpty()) {
      print("Invalid position or list is empty");
      return;
    }
    Node? current = head;
    int index = 1;
    // Traverse to the node at the given position
    while (index < position && current != null) {
      current = current.next;
      index++;
    }
    if (current == null) {
      print("Position out of bounds");
      return;
    }
    // Perform insertion
    Node newNode = Node(newData);
    newNode.next = current.next;
    current.next = newNode;
  }

  void deleteFront() {
    if (!isEmpty()) {
      head = head!.next;
    }
  }

  void deleteEnd() {
    if (isEmpty()) return;
    if (head!.next == null) {
      head = null;
      return;
    }
    Node current = head!;
    while (current.next!.next != null) {
      current = current.next!;
    }
    current.next = null;
  }

  void deleteMiddle(int value) {
    if (isEmpty() || head!.next == null) return;
    if (head!.nodeValue == value) {
      head = head!.next;
      return;
    }
    Node? prev = head;
    while (prev!.next != null && prev.next!.nodeValue != value) {
      prev = prev.next;
    }
    if (prev.next == null) return; // not found
    prev.next = prev.next!.next;
  }

  void printList() {
    if (isEmpty()) {
      print('Linked List is empty');
      return;
    }
    Node? current = head;
    while (current != null) {
      print('${current.nodeValue} ');
      current = current.next;
    }
  }
}

void main() {
  SingleLinkedList ll = SingleLinkedList();
  ll.insertFront(10);
  ll.insertFront(30);
  ll.insertBack(5);
  print("Before insertAfterPosition:");
  ll.printList();

  // Insert 20 after the 3rd node
  ll.insertAfterPosition(3, 20);
  print("After insertAfterPosition(3, 20):");
  ll.printList();

  // Deletions
  ll.deleteEnd();
  ll.deleteMiddle(5);
  print("After deletions:");
  ll.printList();
}
