describe Post, type: :feature do
  before :each do
    Post.create(body: 'test post 2', updated_at: Time.now)
    Post.create(body: 'test post 1', updated_at: Time.now)
  end

  it 'User able to see all messages on the timeline' do
    visit '/posts'
    within(:css, '.posts') do
      expect(page).to have_content 'test post 1'
      expect(page).to have_content 'test post 2'
    end
  end

  it 'User able to able to post a message to the timeline' do
    visit '/posts'

    within(:css, '.new_post') do
      fill_in('post_body', with: 'this is test post 3')
      click_button('Create Post')
    end

    expect(page).to have_content 'this is test post 3'
  end
end
