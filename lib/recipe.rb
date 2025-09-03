class Recipe
  attr_reader :name, :ingredients

  def initialize(name)
    @name = name
    @ingredients = []
  end

  def add_ingredient(ingredient)
    @ingredients << ingredient
  end

  def vegetarian?
    !@ingredients.any? { |i| i.name.downcase =~ /chicken|beef|pork|fish|bacon/ }
  end

  def ingredient_names
    @ingredients.map(&:name)
  end

  def remove_ingredient(ingredient)
    @ingredients.delete(ingredient)
  end

end
