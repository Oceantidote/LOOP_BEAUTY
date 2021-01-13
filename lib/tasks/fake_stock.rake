desc 'Fake Stock'
task fake_stock: :environment do
    Shade.find_each do |shade|
        shade.update(number_in_stock: rand(5..30), us_number_in_stock: rand(5..30))
    end
end
