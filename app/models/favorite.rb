class Favorite
  attr_reader :content

  def initialize(initial_contents)
    @content = initial_contents || Hash.new(0)
  end

  def count_of(id) #setting the key value to zero if it's nil
    @content[id.to_s].to_i
  end

  def add_favorite(id) #setting the key to the pet_id and the value to 1
    @content[id.to_s] = count_of(id) + 1
  end

  def favorite_count
    @content.values.sum
  end

  def favorite_delete(pets)
    pets.each do |pet|
      @content.delete(pet.id.to_s)
    end
  end

  def keys
    @content.keys 
  end

  def include?(pet_id)
    @content.keys.include?(pet_id.to_s)
  end
end
