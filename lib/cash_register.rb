class CashRegister
    attr_accessor :total, :title, :price, :discount, :cart, :prev_amt, :last_item

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @cart = []
    end

    def add_item(title, price, qty = 1)
        cur_amount = price * qty
        @last_item = [title, price, qty, cur_amount]
        @prev_amt = @total.to_i
        @total += cur_amount
        count = 1

        while count <= qty
            @cart << title
            count += 1
        end
    end

    def apply_discount
        if discount > 0 
            @total = (@total - (@total*discount)/100)
            apply_discount = "After the discount, the total comes to $#{total}."
        else
            apply_discount = "There is no discount to apply."
        end
    end
    def items
        @cart
    end
    def void_last_transaction
        @cart.pop()
        @total -= @last_item[3]
    end
end