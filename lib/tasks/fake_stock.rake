desc 'Fake Stock'
task fake_stock: :environment do
    Shade.find_each do |shade|
        shade.update(number_in_stock: rand(0..5))
    end
end
