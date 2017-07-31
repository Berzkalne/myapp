module ApplicationHelper

  def attribute_name(object, attribute)
    object.class.human_attribute_name(attribute)
  end

  def table_attribute_name(klass, attribute)
    klass.human_attribute_name(attribute)
  end  

  def statistics_graph(records, options)
    haml_tag 'div.ul-content' do
      haml_tag 'div.ul.prices' do
        options[:interval].each do |price|
          haml_tag 'li.bar-price' do
            haml_concat price
          end
        end
      end
      haml_tag 'ul.content-names' do
        records.each do |record|
          haml_tag 'div.namez' do
            haml_tag 'li.bar' do 
              haml_tag 'div.bar-tag', style: "height: #{record.send(options[:height])}px" do
              end
            end
            haml_tag 'li.bar-name' do
              haml_concat record.name
            end
          end
        end
      end
    end
  end
end
