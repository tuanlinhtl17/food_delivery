class ObjectPresenter
  attr_reader :id, :class_name, :img_url, :name, :attr1, :attr2

  def initialize id, class_name, img_url, name, attr1, attr2
    @id = id
    @class_name = class_name
    @img_url = img_url
    @name = name
    @attr1 = attr1
    @attr2 = attr2
  end

  def food?
    self.class_name == "Food"
  end

  def user?
    self.class_name == "User"
  end
end
