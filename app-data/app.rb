require 'sinatra'
require 'faker'

set :bind, '0.0.0.0'
set :port, 4000

locals = {
  income: {
    cat: {
      table: 0,
      chair: 0,
      tv: 0
    },
    total: 0
  },
  products: {
    cat: {
      table: 0,
      chair: 0,
      tv: 0
    },
    total: 0
  },
  stock: {
    cat: {
      table: 1000,
      chair: 2000,
      tv: 300
    }
  }
}

get '/metrics' do
  content_type 'text/plain;charset=utf8'
  run(locals)
  erb :metrics, locals: locals, format: :text
end

def run(locals)
  [:table, :chair, :tv].each do |cat|
    sold = [0, 16 - rand(20)].max
    if sold > 0 && rand(4) > 2 && sold <= locals[:stock][:cat][cat]
      val = Faker::Number.between(5, 100)
      locals[:income][:cat][cat] += val
      locals[:income][:total] += val
      locals[:products][:cat][cat] += sold
      locals[:products][:total] += sold
      locals[:stock][:cat][cat] -= sold
      if locals[:stock][:cat][cat] < 200 && rand(10) == 1
        locals[:stock][:cat][cat] += Faker::Number.between(50, 100)
      end
    end
  end
end