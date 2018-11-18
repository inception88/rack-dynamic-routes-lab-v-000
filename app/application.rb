class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    @@items = []

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = search_items(item_name)[0]
      if item.empty?
          resp.status = 400
          resp.write "Item not found"
        else
          resp.status = 200
          resp.write "#{item.price}"
        end
    else
      resp.status = 404
      resp.write "Route not found"
    end

    resp.finish
  end

  def search_items(item_name)
    @@items.select do |item|
     item.name == item_name
    end
  end
end
