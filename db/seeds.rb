load File.expand_path("../../categories_travel.txt", __dir__)
load File.expand_path("../../subcategories_travel.txt", __dir__)

puts "Seeding categories and subcategories..."

CATEGORIES_TRAVEL.each do |cat_name|
  slug = cat_name.parameterize
  category = Category.find_or_create_by!(slug: slug) do |c|
    c.name = cat_name
  end

  if SUBCATEGORIES_TRAVEL[cat_name]
    SUBCATEGORIES_TRAVEL[cat_name].each do |sub_name|
      sub_slug = sub_name.parameterize
      category.subcategories.find_or_create_by!(slug: sub_slug) do |s|
        s.name = sub_name
      end
    end
  end
end

puts "Done! #{Category.count} categories and #{Subcategory.count} subcategories created."
