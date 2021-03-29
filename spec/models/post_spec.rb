require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '投稿保存' do
    context '投稿が保存できるとき' do
      it 'title,textがあれば保存できる' do
        expect(@post).to be_valid
      end
    end
    context '投稿が保存できないとき' do
      it 'titleが空では保存できない' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end
      it 'textが空では保存できない' do
        @post.text = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end
