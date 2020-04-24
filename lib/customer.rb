class Customer

    attr_accessor :name, :age

    @@all = []

    def initialize (name, age)
        @name, @age = name, age
        @@all << self

    end

    #Class Methods

    def self.all
        @@all
    end


    #Instance Methods
    def new_meal(waiter, total, tip)
        Meal.new(waiter, self, total, tip)
    end

    def meals()
        Meal.all.select { |m| m.customer == self }
    end

    def waiters()
        self.meals.map { |m| m.waiter }
    end





end