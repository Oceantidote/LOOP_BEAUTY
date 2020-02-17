desc 'Fake Stock'
task fake_stock: :environment do
    Shade.find_each do |shade|
        shade.update(number_in_stock: 0)
    end
end
