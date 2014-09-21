module ControllerMacros
  def sign_in_as_admin
    FactoryGirl.create(:admin).tap { |admin| sign_in admin }
  end

  def attributes_with_foreign_keys(*args)
    exclude_default_column(FactoryGirl.build(*args).attributes)
  end

  def exclude_default_column(attributes)
    attributes.delete_if do |k, v|
      %w(id type created_at updated_at).member?(k)
    end
  end
end
