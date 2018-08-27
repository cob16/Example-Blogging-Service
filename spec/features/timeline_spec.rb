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
      fill_in('post_body', with: "test post 3")
      click_button('Create Post')
    end

    within(:css, '.posts') do
      expect(page).to have_content "test post 3"
    end 
  end

    it 'User able to able to post a multiline message ' do
    visit '/posts'

    multiline_body = %q(
      This is the first line.
      of a manny line comment.
    )

    within(:css, '.new_post') do
      fill_in('post_body', with: multiline_body)
      click_button('Create Post')
    end

    within(:css, '.posts') do
      #use source so that cappybarra does not normalise newlines into spaces
      expect(source).to have_content multiline_body
    end 
  end
end
