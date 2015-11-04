require 'rails_helper'

RSpec.describe "articles/index", type: :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        :article_title => "Article Title",
        :article_type => 1,
        :article_content => "MyText",
        :aritle_read_times => 2,
        :user_id => 3
      ),
      Article.create!(
        :article_title => "Article Title",
        :article_type => 1,
        :article_content => "MyText",
        :aritle_read_times => 2,
        :user_id => 3
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "tr>td", :text => "Article Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
