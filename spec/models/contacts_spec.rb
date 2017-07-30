require 'rails_helper'

describe Contact do
  # 名前、メール、内容があれば有効
  it "is valid with name, email and content" do
    contact = Contact.new(name:'テスト', email: 'hoge@fuga.com', content: 'テスト')
    expect(contact).to be_valid
  end

  # 名前がなければ無効
  it "is invalid without name" do
    contact = Contact.new(email: 'hoge@fuga.com', content: 'テスト')
    expect(contact).not_to be_valid
  end

  # メールがなければ無効
  it "is invalid without email" do
    contact = Contact.new(name:'テスト', content: 'テスト')
    expect(contact).not_to be_valid
  end

  # 本文がなければ無効
  it "is invalid without content" do
    contact = Contact.new(name:'テスト', email: 'hoge@fuga.com')
    expect(contact).not_to be_valid
  end

  # 本文の長さが255文字以下であれば有効
  it "is valid because length of content is less than 256" do
    contact = Contact.new(name:'テスト', email: 'hoge@fuga.com', content: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
    expect(contact).to be_valid
  end

  # 本文の長さが255文字より大きいならば無効
  it "is invalid because length of content is more than 255" do
    contact = Contact.new(name:'テスト', email: 'hoge@fuga.com', content: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
    expect(contact).not_to be_valid
  end
end