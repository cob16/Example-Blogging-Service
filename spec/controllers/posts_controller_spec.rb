RSpec.describe PostsController, type: :controller do
	it { should route(:get, '/posts').to(action: :index) }
	it { should route(:post, '/posts').to(action: :create) }
	it { should route(:delete, '/posts/1').to(action: :destroy, id: 1) }
end