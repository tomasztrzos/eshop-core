module Response
  def json_response(hash, status = :ok)
    hash = serializable_hash(hash) if hash[:message].blank?

    render json: hash, status: status
  end

  private

  def serializable_hash(object)
    serializer = "#{object.class.name}Serializer".constantize
    serializer.new(object).serializable_hash
  end
end
