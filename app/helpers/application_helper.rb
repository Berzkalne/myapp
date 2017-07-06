module ApplicationHelper

  def attribute_name(object, attribute)
    object.class.human_attribute_name(attribute)
  end

  def table_attribute_name(klass, attribute)
    klass.human_attribute_name(attribute)
  end
end
