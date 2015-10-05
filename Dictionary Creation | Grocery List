## Lyle A. Stewart 
# Dictionary Creation and Manipulation Example | Grocery List 

#(1) create dictionary named prices and attach values 
prices = { "banana":4,"apple":2,"orange":1.5,"pear":3}

#(2) create a stock dictionary with proposed values
stock = {"banana":6,"apple":0,"orange":32,"pear":15}

#(3) loop through each key in prices and print values from prices and stock 
#note because we know that both dictionaries have the same keys, we can loop throgh one dictonary

for key in prices:
    print key
    print "prices: %s" % prices[key]
    print "stock: %s" % stock[key]

total = 0  #record the value of the inventory 

for key in prices:

    value = prices[key] * stock[key]
    print key
    print value 
    total += value # REMEMBER THAT a+=b is the same as a = a+b
   # so total += value means total = total plus value 

print "total value of inventory"
print total 

#(4) create a shopping list and show prices of purchases

shopping_list = ["banana", "orange", "apple"]

stock = {
    "banana": 6,
    "apple": 0,
    "orange": 32,
    "pear": 15
}
    
prices = {
    "banana": 4,
    "apple": 2,
    "orange": 1.5,
    "pear": 3
}

def compute_bill(food): #define function compute_bill W one argument, food
    total = 0 # create a variable total with an initial value of zero 
    for item in food: # iterate over the function compute_bill's food list in order
        ## to add price of the item  to total 
        total += prices[item] # total = total + prices[item]. item stands for
        ## objects in the food list of the compute_bill function 
    return total
    # function will work for any food

# (5) Change compute_bill function to take stock/inventory of a particular
## item into account when computing the cost - If an item is not in
### stock then it can not be included in the total - you can not sell 
#### what you do not have 

shopping_list = ["banana", "orange", "apple"]

stock = {
    "banana": 6,
    "apple": 0,
    "orange": 32,
    "pear": 15
}
    
prices = {
    "banana": 4,
    "apple": 2,
    "orange": 1.5,
    "pear": 3
}

def compute_bill(food): # 
    total = 0
    for item in food:
        if stock[item] > 0:
            total +=prices[item]
            stock[item] -= 1 
            print item
            print stock[item]
        else:
        	print item 
        	print "sorry we do not have %ss" % (item)
    return total

a = compute_bill(shopping_list)
