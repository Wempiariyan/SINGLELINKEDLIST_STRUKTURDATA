import 'PERCOBAAN1.DART';
void main() {
  SingleLinkedList ll = SingleLinkedList();
  print("Data:");
  ll.InsertFront(10);
  ll.InsertFront(30);
  print("Operasi Insertion Front of Linked List:");
  ll.PrintList();
  ll.InsertBack(5);
  print("Operasi Insertion Back of Linked List:");
  // ll.PrintList();
  print("Insert After Data: ");
  ll.InsertAfter(ll.head!.next!.next!, 20);
  ll.PrintList();
  print("Delete data:");
  // ll.deleteFront();
  ll.deleteEnd();
  ll.deleteMiddle(5);
  ll.PrintList();
}