module ApplicationHelper
  def office_name
    if current_user.office == 1
      "Greenpeace Belgium"
    elsif current_user.office == 99
      "Greenpeace International"
    elsif current_user.office == 2
      "France"
    elsif current_user.office == 3
      "Mediterranean"
    elsif current_user.office == 4
      "Greece"
    elsif current_user.office == 5
      "New Zealand"
    elsif current_user.office == 6
      "Germany"
    #for testing round skillshare June
    elsif current_user.office == 7
      "Office A"
    elsif current_user.office == 8
      "Office B"
    else
      "To be defined"
    end
  end

def home_page
  if current_user.office == 1
    belgium_path
  elsif current_user.office == 99
    home_GPI_path
  elsif current_user.office == 2
    france_path
  elsif current_user.office == 3
    med_path
  elsif current_user.office == 4
    greece_path
  elsif current_user.office == 5
    new_zealand_path
  elsif current_user.office == 6
    germany_path
  #for testing round skillshare June
  elsif current_user.office == 7
    office_a_path
  elsif current_user.office == 8
    office_b_path
  else
    home_index_path
  end
end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def link_to_add_conceptual_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_conceptual_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def link_to_add_implementation_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_implementation_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def link_to_add_support_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_support_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def link_to_add_compliance_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_compliance_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
