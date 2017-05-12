def student_params(student)
  params = student.attributes
                  .with_indifferent_access
                  .extract!(:id, :first_name, :last_name, :birthdate, :gender)
                  .merge(age: student.age)
  if student.attachment
    file_url = "http://#{request.host}#{student.attachment.file.url(:thumb)}"
  end

  params.merge(url: file_url)
end
