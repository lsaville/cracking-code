# From: http://www.openbookproject.net/thinkcs/python/english2e/ch21.html
class Tree:
    def __init__(self, cargo, left=None, right=None):
        self.cargo = cargo
        self.left  = left
        self.right = right

    def __str__(self):
        return str(self.cargo)

tree = Tree(1, Tree(2), Tree(3))

def total(tree):
    if tree == None: return 0
    return total(tree.left) + total(tree.right) + tree.cargo

def in_order_print(tree):
    if tree == None: return
    in_order_print(tree.left)
    print tree.cargo
    in_order_print(tree.right)

def pre_order_print(tree):
    if tree == None: return
    print tree.cargo
    pre_order_print(tree.left)
    pre_order_print(tree.right)

def post_order_print(tree):
    if tree == None: return
    print tree.cargo
    post_order_print(tree.left)
    post_order_print(tree.right)

print "============="
print "Total"
print total(tree)
print "============="

print "============="
print "In order print"
print in_order_print(tree)
print "============="

print "============="
print "pre order print"
print pre_order_print(tree)
print "============="

print "============="
print "post order print"
print post_order_print(tree)
print "============="
