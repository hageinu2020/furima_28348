require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザーの新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail,password,password_confirmation,family_name,first_name,family_kana,first_kana,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが６文字以上であれば登録できる' do
        @user.password = 'a1b3sd'
        @user.password_confirmation = 'a1b3sd'
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字混合であれば登録できる' do
        @user.password = 'a1b2c3'
        @user.password_confirmation = 'a1b2c3'
        expect(@user).to be_valid
      end
      it 'family_nameが全角であれば登録できる' do
        @user.family_name = 'あいう'
        expect(@user).to be_valid
      end
      it 'first_nameが全角であれば登録できる' do
        @user.first_name = 'あいう'
        expect(@user).to be_valid
      end
      it 'family_kanaが全角のカタカナであれば登録できる' do
        @user.family_kana = 'アイウ'
        expect(@user).to be_valid
      end
      it 'first_kanaが全角のカタカナであれば登録できる' do
        @user.first_kana = 'アイウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが５文字以下であれば登録できない' do
        @user.password = 'a1b2c'
        @user.password_confirmation = 'a1b2c'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数字混合でなければ登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name 全角文字を使用してください')
      end
      it 'family_nameが全角でなければ登録できない' do
        @user.family_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name 全角文字を使用してください')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end
      it 'first_nameが全角でなければ登録できない' do
        @user.first_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end
      it 'family_kanaが空では登録できない' do
        @user.family_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Family kana 全角文字を使用してください')
      end
      it 'family_kanaが全角カタカナでなければ登録できない' do
        @user.family_kana = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family kana 全角文字を使用してください')
      end
      it 'first_kanaが空では登録できない' do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana 全角文字を使用してください')
      end
      it 'first_kanaが全角カタカナでなければ登録できない' do
        @user.first_kana = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana 全角文字を使用してください')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
