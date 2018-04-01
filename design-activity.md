Prompts
Once you have read through the above code, add a file to your Hotel project called design-activity.md. This file will be submitted with the rest of this exercise. In that file, please respond to the following prompts:

What classes does each implementation include? Are the lists the same?
  The two implementations have the same classes; CartEntry, ShoppingCart and Order. The methods within are different.

Write down a sentence to describe each class.
  CartEntry contains data on each item and its price.
  ShoppingCart class contains an array of all items.
  Order gives the total for all items in the Shopping card calculated with sales tax.

How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.
  CartEntry seems to be independent of the two other classes.
  ShoppingCart seems like it will be a collection of CartEntries.
  Orders have ShoppingCarts.

What data does each class store? How (if at all) does this differ between the two implementations?
    CartEntry stores: @unit_price and @quantity
    ShoppingCart stores: @entries
    Order stores: @cart and SALES_TAX

What methods does each class have? How (if at all) does this differ between the two implementations?
  Implementation A: total_price
  Implementation B: price, price, total_price

Consider the Order#total_price method. In each implementation:
Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order?
  Implementation A: retained in Order
  Implementation B: Delated to other classes.

Does total_price directly manipulate the instance variables of other classes?
  Implementation A: Yes
  Implementation B: No

If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?
  We could use a conditional to on quantity and a discount rate or bulk price.
  Both implementations seems like they are of similar amounts of work to modify.

Which implementation better adheres to the single responsibility principle?
  Implementation B follows the single responsibility principle more than A.

Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled?
  Implementation B is more loosely coupled. 
Once you've responded to the prompts, git add design-activity.md and git commit!
