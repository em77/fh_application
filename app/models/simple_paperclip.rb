class SimplePaperclip
  extend ActiveModel::Callbacks
  include ActiveModel::Model
  include Paperclip::Glue

  # Paperclip required callbacks
  define_model_callbacks :save, only: [:after]
  define_model_callbacks :destroy, only: [:before, :after]  
  define_model_callbacks :commit, only: [:before, :after]

  def save
    run_callbacks :save
    return true
  end

  def destroy
    run_callbacks :destroy
  end

  def updated_at_short
    return Time.now.to_s(:autosave_time)
  end

  def errors
    obj = Object.new
    def obj.[](key)         [] end
    def obj.full_messages() [] end
    def obj.any?()       false end
    obj
  end
end
