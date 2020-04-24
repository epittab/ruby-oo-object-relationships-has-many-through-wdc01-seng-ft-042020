class Waiter

    attr_accessor :name, :years

    @@all = []

    def initialize(name, years)
        @name, @years = name, years
        @@all << self
    end


    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals()
        Meal.all.select { |m| m.waiter == self }
    end

    def best_tipper()

        largest_tip = [ self.meals[0].tip, self.meals[0].customer ]
        self.meals.each { |t| largest_tip = [ t.tip, t.customer ] if t.tip > largest_tip[0]  }      
        largest_tip[1]
        
    end


end