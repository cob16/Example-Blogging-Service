require 'rails_helper'

describe Post, type: :model do
  it 'can requires text and a timestamp' do
    post = Post.new
    expect(post.valid?).to be false

    post.body = 'foo'
    expect(post.valid?).to be true

    post.save!
    expect(post.body).to eq('foo')
    expect(post.created_at).not_to be_nil
  end

  it 'must be between 0 to 150 char' do
    post = Post.new
    expect(post.valid?).to be false

    post.body = ''
    expect(post.valid?).to be false

    post.body = msg_body_of_len(150)
    expect(post.valid?).to be true

    post.body = msg_body_of_len(151)
    expect(post.valid?).to be false
  end

  def msg_body_of_len(length)
    msg_body = ''
    length.times do
      msg_body << 'a'
    end
    msg_body
  end
end
