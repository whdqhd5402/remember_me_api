class JsonRes

  def self.token(msg, token)
    {msg: msg, token: token}
  end

  def self.success(msg, obj)
    {msg: msg, obj: obj}
  end

  def self.errors(msg, errors)
    {msg: msg, errors: errors}
  end

  def self.create(type, id)
    {msg: "#{type}/#{id} is created"}
  end

  def self.update(type, id)
    {msg: "#{type}/#{id} is updated"}
  end

  def self.destroy(type, id)
    {msg: "#{type}/#{id} is destroyed"}
  end
end
