json.(student, :id, :first_name, :last_name, :birthdate, :gender, :age)
json.url student.attachment ? asset_url(student.attachment.file.url(:thumb)) : nil
