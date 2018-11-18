class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    @@item = []

    if req.path.match(/items/)
      item = req.path.split("/items/").last
      if @@items.exclude?(item)
          resp.status = 400
          resp.write "Error"
        else
          return item.price
        end
    else
      resp.status = 404
      resp.write "Route not found"
    end

    resp.finish
  end
end
