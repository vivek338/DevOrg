public class DragDrop {
    public Integer dragStartId { get; set; }
    public Integer dragEndId { get; set; }

    public Item[] items { get; set; }

    public class Item {
        public Item(String theName, Integer theIndex) {
            Name = theName;
            index = theIndex;
        }
        public String Name { get; set; }
        public Integer index { get; set; }
    }

    public DragDrop() {
        items = new Item[0];
        while(items.size() < 5) {
            items.add(new Item('Value '+items.size(), items.size()));
        }
    }

    public void reorder() {
        Item temp = items[dragStartId];
        items[dragStartId] = items[dragEndId];
        items[dragEndId] = temp;
    }
}