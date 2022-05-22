require 'rails_helper'

RSpec.describe PurchasesBuyers, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchases_buyers = FactoryBot.build(:purchases_buyers, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchases_buyers).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchases_buyers.building_name = ''
        expect(@purchases_buyers).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @purchases_buyers.user_id = ''
        @purchases_buyers.valid?
        expect(@purchases_buyers.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @purchases_buyers.item_id = ''
        @purchases_buyers.valid?
        expect(@purchases_buyers.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @purchases_buyers.post_code = ''
        @purchases_buyers.valid?
        expect(@purchases_buyers.errors.full_messages).to include("Post code can't be blank", "Post code is invalid. Include hyphen(-)")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchases_buyers.post_code = 1_234_567
        @purchases_buyers.valid?
        expect(@purchases_buyers.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県が「---」だと保存できないこと' do
        @purchases_buyers.prefecture_id = 0
        @purchases_buyers.valid?
        expect(@purchases_buyers.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が空だと保存できないこと' do
        @purchases_buyers.prefecture_id = ''
        @purchases_buyers.valid?
        expect(@purchases_buyers.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @purchases_buyers.city = ''
        @purchases_buyers.valid?
        expect(@purchases_buyers.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @purchases_buyers.address = ''
        @purchases_buyers.valid?
        expect(@purchases_buyers.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @purchases_buyers.phone_number = ''
        @purchases_buyers.valid?
        expect(@purchases_buyers.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it '電話番号に半角数字以外を含むと保存できないこと' do
        @purchases_buyers.phone_number = '０１２３４５６７８９'
        @purchases_buyers.valid?
        expect(@purchases_buyers.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が9桁以下だと保存できないこと' do
        @purchases_buyers.phone_number = 12_345_678
        @purchases_buyers.valid?
        expect(@purchases_buyers.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @purchases_buyers.phone_number = 12_345_678_910_123_111
        @purchases_buyers.valid?
        expect(@purchases_buyers.errors.full_messages).to include("Phone number is invalid")
      end
      it 'トークンが空だと保存できないこと' do
        @purchases_buyers.token = ''
        @purchases_buyers.valid?
        expect(@purchases_buyers.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end