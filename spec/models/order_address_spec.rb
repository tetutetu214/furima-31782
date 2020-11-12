require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入についてのテストコード' do
    context '商品登録がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingが不明でも保存できる' do
        @order_address.building = nil
        expect(@order_address).to be_valid
      end
    end

    context '商品購入ががうまくいくとき' do
      it 'tokenが空だと保存できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('カード情報を入力してください')
      end
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号を入力してください', '郵便番号は不正な値です')
      end
      it 'postal_codeにハイフンがないと保存できないこと' do
        @order_address.postal_code = 1_111_111
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it 'prefecture_idが空だと保存できないこと' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('都道府県を入力してください', '都道府県は数値で入力してください')
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('市町村を入力してください')
      end
      it 'addressが空だと保存できないこと' do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('番地を入力してください')
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号を入力してください', '電話番号は不正な値です')
      end
      it 'phone_numberが11桁以上だと保存できないこと' do
        @order_address.phone_number = 0o00000000000
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'phone_numberにハイフンがあると保存できないこと' do
        @order_address.phone_number = 0o00 - 0o000 - 0o000
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は不正な値です')
      end
    end
  end
end
