module Response
  def json_response(hash, status = :ok)
    hash = serializable_hash(hash) unless hash.is_a?(Hash)

    render json: hash, status: status
  end

  private

  def serializable_hash(object)
    class_name = if object.try(:first)
                   object.first.class.name
                 else
                   object.class.name
                 end

    serializer = "#{class_name}Serializer".constantize
    serializer.new(object).serializable_hash
  end
end
