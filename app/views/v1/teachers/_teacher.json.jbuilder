json.(teacher, :id, :first_name, :last_name, :email, :phone, :locale)
json.url teacher.attachment ? asset_url(teacher.attachment.file.url) : nil
