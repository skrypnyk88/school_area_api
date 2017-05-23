json.(@current_user, :id, :first_name, :last_name, :email, :phone, :locale)
json.url @current_user.attachment ? asset_url(@current_user.attachment.file.url) : nil
