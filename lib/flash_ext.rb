class ActionDispatch::Flash::FlashHash
  def success
    self[:success]
  end

  def success=(message)
    self[:success] = message
  end
end
