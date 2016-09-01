require 'spec_helper.rb'
require 'rspec'

describe "Request class - entry in lacedeamon" do

  it "should execute crud tests" do

    #positive POST test

  	#creating an id
    r = HTTParty.post "http://lacedeamon.spartaglobal.com/todos/", query: {title:"Snoop Doggy Dog!!", due: "2012-12-31"}
    # binding.pry
    #storing the id into a variable
    id = r['id']
    #storing the title into a variable
    title = r['title']
    #storing r.get into a variable
    d = HTTParty.get("http://lacedeamon.spartaglobal.com/todos/#{id}")

    expect(id).to eq d['id']
    expect(title).to eq d['title']

    #negative POST test

    #creating an id
    n = HTTParty.post "http://lacedeamon.spartaglobal.com/todos/", query: {title:"", due: "2012-12-31"}
    #storing the id into a variable
    n_id = n['id']
    #storing the title into a variable
    n_title = n['title']
    #storing n.get into a variable
    b = HTTParty.get("http://lacedeamon.spartaglobal.com/todos/#{n_id}")

    expect(n_id).to eq b['id']
    expect(n_title).to eq b['title']

    #positive UPDATE test

    #creating an id
    param = HTTParty.patch "http://lacedeamon.spartaglobal.com/todos/7798", query: {title:"Delicious! Scrumptious! Marvelous!!!", due: "2002-09-09"}
    #storing the id into a variable
    some_id = param['id']
    #storing the title into a variable
    some_title = param['title']
    #
    some_param = HTTParty.get("http://lacedeamon.spartaglobal.com/todos/#{some_id}")

    # expect(some_id).to eq some_param['id']
    # expect(some_title).to eq some_param['title']

    #negative UPDATE test

    #creating an id
    n_param = HTTParty.patch "http://lacedeamon.spartaglobal.com/todos/", query: {title:"crap!crap!crappy!", due: "2012-12-31"}
    #storing the id into a variable
    some_n_id = n_param['id']
    # binding.pry
    #storing the title into a variable
    some_n_title = n_param['title']
    #storing n.get into a variable
    another_param = HTTParty.get("http://lacedeamon.spartaglobal.com/todos/#{some_n_id}")

    # expect(some_n_id).to eq another_param['id']
    # expect(some_n_title).to eq another_param['title']


    #positive DELETE test

    #creating an id
    arg = HTTParty.delete "http://lacedeamon.spartaglobal.com/todos/7888"
    #storing the id into a variable
    arg_id = arg['id']
    #storing the title into a variable
    arg_title = arg['title']


    #negative DELETE test

    #creating an id
    some_arg = HTTParty.delete "http://lacedeamon.spartaglobal.com/todos/7888"
    #storing the id into a variable
    some_arg_id = some_arg['id']
    #storing the title into a variable
    some_arg_title = some_arg['title']

  end
end
