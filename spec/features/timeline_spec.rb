describe 'Timeline', type: :feature do
  describe 'User able to see all messages on the timeline' do
    it do
      Post.create(body: 'test post 2')
      Post.create(body: 'test post 1', created_at: (Time.now - 5.days))

      visit '/posts'

      within(:css, '.posts') do
        page.assert_selector('.post_item', count: 2)
        expect(page).to have_content 'test post 1'
        expect(page).to have_content 'test post 2'
        expect(page).to have_content '5 days ago'
      end
    end
  end

  describe 'User able to able to post a message to the timeline' do
    it 'using the form at the top of the page' do
      visit '/posts'

      within(:css, '.new_post') do
        fill_in('post_body', with: 'test post 3')
        click_button('Create Post')
      end

      expect(page).to have_content 'Post succesfully submitted'

      within(:css, '.posts') do
        page.assert_selector('.post_item', count: 1)
        expect(page).to have_content 'test post 3'
      end
    end

    describe 'recive valadation errors messages' do
      it 'if only whitespace' do
        visit '/posts'

        within(:css, '.new_post') do
          fill_in('post_body', with: '    ')
          click_button('Create Post')
        end

        page.assert_selector('.post_item', count: 0)
        expect(page).to have_content "Body can't be blank"
      end

      it 'if message is over 150 char' do
        visit '/posts'

        within(:css, '.new_post') do
          over_150_char = '
          111111111111111111111111111111111111111111111111111111111111
          111111111111111111111111111111111111111111111111111111111111
          111111111111111111111111111111111111111111111111111111111111
          '

          fill_in('post_body', with: over_150_char)
          click_button('Create Post')
        end

        page.assert_selector('.post_item', count: 0)
        expect(page).to have_content 'Body is too long (maximum is 150 characters)'
      end
    end

    it 'including multi line messages' do
      visit '/posts'

      multiline_body = '
        This is the first line.
        of a manny line comment.
      '

      within(:css, '.new_post') do
        fill_in('post_body', with: multiline_body)
        click_button('Create Post')
      end

      within(:css, '.posts') do
        page.assert_selector('.post_item', count: 1)
        # use source so that cappybarra does not normalise newlines into spaces
        expect(source).to have_content multiline_body
      end
    end
  end

  describe 'User able to able to delete a message from the timeline' do
    it 'by clicking on the delete button' do
      post = Post.create(body: 'please try to delete me!')

      visit '/posts'

      within(:css, '.posts') do
        page.assert_selector('.post_item', count: 1)
        expect(page).to have_content 'please try to delete me!'
      end

      click_link(post.id.to_s)

      page.assert_selector('.post_item', count: 0)
    end
  end
end
