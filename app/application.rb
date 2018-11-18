class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
        if !item.included?
          resp.status = 400
          resp.write "Error"
        else
        return item.price
    else
      resp.status = 404
    end

    resp.finish
  end
end
