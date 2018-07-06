require 'rails_helper'

feature 'A user' do
  context 'can log in' do
    it 'by creating an account' do
      visit root_path

      click_on 'Create Account'

      fill_in 'user[email]', with: 'test@email.com'
      fill_in 'user[password]', with: 'password'

      click_on 'Create Account'

      expect(current_path).to eq(chatroom_path)
    end

    it 'by logging in' do
      user = User.create(email: 'test@mail.com', password: 'password')

      visit root_path

      click_on 'Log In'

      fill_in 'email', with: user.email
      fill_in 'password', with: user.password

      click_on 'Log In'

      expect(current_path).to eq(chatroom_path)
    end
  end

  context 'can log out' do
    it 'from the chatroom page' do
      user = User.create(email: 'test@mail.com', password: 'password')

      visit root_path

      click_on 'Log In'

      fill_in 'email', with: user.email
      fill_in 'password', with: user.password

      click_on 'Log In'

      expect(page).to have_content('Log Out')

      click_on 'Log Out'

      expect(current_path).to eq(root_path)
    end
  end
end
