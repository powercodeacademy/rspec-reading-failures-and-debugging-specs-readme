require 'recipe'
require 'ingredient'

RSpec.describe Recipe do
  let(:flour) { Ingredient.new("Flour", 2, "cups") }
  let(:egg) { Ingredient.new("Egg", 1, "large") }
  let(:milk) { Ingredient.new("Milk", 1, "cup") }
  let(:bacon) { Ingredient.new("Bacon", 3, "slices") }
  let(:recipe) { Recipe.new("Pancakes") }

  it "has a name" do
    expect(recipe.name).to eq("Pancakes")
  end

  it "starts with no ingredients" do
    expect(recipe.ingredients).to be_empty
  end

  it "can add ingredients" do
    recipe.add_ingredient(flour)
    recipe.add_ingredient(egg)
    expect(recipe.ingredients).to include(flour, egg)
  end

  it "lists ingredient names" do
    recipe.add_ingredient(flour)
    recipe.add_ingredient(egg)
    expect(recipe.ingredient_names).to eq(["Flour", "Egg"])
  end

  it "is vegetarian if no meat ingredients" do
    recipe.add_ingredient(flour)
    recipe.add_ingredient(egg)
    expect(recipe.vegetarian?).to be true
  end

  it "is not vegetarian if it contains bacon" do
    recipe.add_ingredient(bacon)
    expect(recipe.vegetarian?).to be false
  end



  it "fails if ingredient is missing" do
    recipe.add_ingredient(milk)
    expect(recipe.ingredient_names).to include("Milk")
  end

  it "fails if wrong quantity" do
    recipe.add_ingredient(milk)
    expect(milk.quantity).to eq(2) # Fix this spec
  end

  it "fails if ingredient is present but with wrong case" do
    recipe.add_ingredient(egg)
    expect(recipe.ingredient_names).to include("egg") # Fix this spec
  end

  it "fails if ingredient is present but with wrong unit" do
    recipe.add_ingredient(flour)
    expect(flour.unit).to eq("grams") # Fix this spec
  end

  it "fails if ingredient is present but off-by-one in quantity" do
    recipe.add_ingredient(bacon)
    expect(bacon.quantity).to eq(2) # Fix this spec
  end

  it "fails if vegetarian? logic is misunderstood" do
    recipe.add_ingredient(Ingredient.new("Chicken", 1, "breast"))
    expect(recipe.vegetarian?).to be true # Fix this spec
  end

  pending "is gluten-free if it contains no flour" # for students
  pending "can remove an ingredient from the recipe" # for students
end
