require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録についてのテストコード' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、姓名、カナ、生年月日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない場合' do
      it 'ニックネームが空では登録ができないこと' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'Emailが空では登録ができないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it 'Emailに@が無いと登録ができないこと' do
        @user.email = 'tanukicom'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it '重複したEmailだと登録ができないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'パスワードが空では登録ができないこと' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'パスワードが6文字未満だと登録ができないこと' do
        @user.password = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません', 'パスワードは6文字以上で入力してください')
      end
      it 'パスワードが半角英数字混合でないと登録できない' do
        @user.password = 'た狸タた狸タ'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'パスワードは確認で2回入力しないと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'パスワードとパスワード（確認用）の値が一致しないと登録できない' do
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end

      it '姓がないと登録できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('姓を入力してください')
      end
      it '名がないと登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('名を入力してください')
      end
      it '姓が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.last_name = 'tanuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓は不正な値です')
      end
      it '名が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.first_name = 'tanuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('名は不正な値です')
      end
      it '姓（カナ）がないと登録できない' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('姓カナを入力してください')
      end
      it '名（カナ）がないと登録できない' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('名カナを入力してください')
      end
      it '姓が全角（カタカナ）でないと登録できない' do
        @user.last_name_kana = 'tanuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓カナは不正な値です')
      end
      it '名が全角（カタカナ）でないと登録できない' do
        @user.first_name_kana = 'tanuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('名カナは不正な値です')
      end
      it '生年月日をいれないと登録できない' do
        @user.birth_date = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('生年月日を入力してください')
      end
    end
  end
end
