# Preview all emails at http://localhost:3000/rails/mailers/password_resets_mailer
class PasswordResetsMailerPreview < ActionMailer::Preview
    def reset
      # Set up a temporary user for the preview
      parent = Parent.new(name: "Parent 1", phone: 1234567890, first_name: "Parent", last_name: "1", image: "https://images.unsplash.com/photo-1519680772-8b1b0b2b1f1c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=3b1b1b2b1f1c&auto", password: "676767", password_confirmation: "676767", email: "johndula@gmail.com", username: "johndula")
  
      PasswordResetsMailer.with(parent: parent).reset
    end
  end