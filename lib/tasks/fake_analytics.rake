desc 'Fake Analytics'
task fake_analytics: :environment do
  puts 'Destroying old data'
  MonthlyVisit.destroy_all
  Order.destroy_all
  
  puts 'Finding User'  
  user = User.find(1)
  user.update(commission_rate: 5.0)
  user.addresses.destroy_all
  puts 'making addresses'
  2.times do |i|
    Address.create(
      user: user,
      address_line1: '123 Fake Street',
      city: 'Fakeville',
      county: 'Fakeshire',
      country: 'UK',
      postcode: 'FA1 ST5',
      delivery_address: i == 0
    )
  end
  puts 'faking views'
  user.lookbooks.each do |l|
    l.update(visits: rand(600..700))
    m1 = MonthlyVisit.create(visits: l.visits, tracked: l, month: Date.today.last_month.beginning_of_month)
    l.update(visits: l.visits + rand(300..350))
    m2 = MonthlyVisit.create(visits: l.visits, tracked: l, month: Date.today.beginning_of_month)
    l.update(visits: l.visits + rand(300..350))
  end
  user.tutorials.each do |t|
    t.update(visits: rand(600..700))
    m1 = MonthlyVisit.create(visits: t.visits, tracked: t, month: Date.today.last_month.beginning_of_month)
    t.update(visits: t.visits + rand(300..350))
    m2 = MonthlyVisit.create(visits: t.visits, tracked: t, month: Date.today.beginning_of_month)
    t.update(visits: t.visits + rand(300..350))
  end
  puts "faking sales for #{Date.today.months_ago(2).strftime('%B')}"
  Date.today.last_month.last_month.end_of_month.day.times do |i|
    rand(4..6).times do
      content = rand(1..2) == 2 ? user.tutorials.sample : user.lookbooks.sample
      o = Order.new(
        user: user,
        affiliation: content,
        delivery_type: 'standard',
        processed: true,
        delivery_address: user.delivery_addresses.first,
        billing_address: user.billing_addresses.first
      )
      o.set_delivery_costs_cents
      o.save
      o.update(created_at: o.created_at.change(month: Date.today.last_month.last_month.month, day: i + 1))
      product = content.products.sample
      OrderProduct.create(
        order: o,
        product: product,
        shade: product.shades.sample,
        quantity: rand(1..5)
      )
    end
  end
  puts "faking sales for #{Date.today.months_ago(1).strftime('%B')}"
  Date.today.last_month.end_of_month.day.times do |i|
    rand(4..6).times do
      content = rand(1..2) == 2 ? user.tutorials.sample : user.lookbooks.sample
      o = Order.new(
        user: user,
        affiliation: content,
        delivery_type: 'standard',
        processed: true,
        delivery_address: user.delivery_addresses.first,
        billing_address: user.billing_addresses.first
      )
      o.set_delivery_costs_cents
      o.save
      o.update(created_at: o.created_at.change(month: Date.today.last_month.month, day: i + 1))
      product = content.products.sample
      OrderProduct.create(
        order: o,
        product: product,
        shade: product.shades.sample,
        quantity: rand(1..5)
      )
    end
  end
  puts "faking sales for #{Date.today.strftime('%B')}"
  Date.today.day.times do |i|
    rand(8..10).times do
      content = rand(1..2) == 2 ? user.tutorials.sample : user.lookbooks.sample
      o = Order.new(
        user: user,
        affiliation: content,
        delivery_type: 'standard',
        processed: true,
        delivery_address: user.delivery_addresses.first,
        billing_address: user.billing_addresses.first
      )
      o.set_delivery_costs_cents
      o.save
      o.update(created_at: o.created_at.change(day: i + 1))
      product = content.products.sample
      OrderProduct.create(
        order: o,
        product: product,
        shade: product.shades.sample,
        quantity: rand(1..5)
      )
    end
  end
end
