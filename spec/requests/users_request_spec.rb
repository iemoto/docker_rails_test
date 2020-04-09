require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe 'GET #new' do
  before do
    get new_user_path 
  end
    it 'レスポンスコードが200であること' do
      expect(response).to have_http_status(200)
    end
    
    it 'newテンプレートをレンダリングすること' do
      expect(response).to render_template :new
    end

    it '新しいuserオブジェクトがビューに渡されていること' do
      expect(assigns(:user)).to be_a_new User
    end
  end

  describe 'POST #create' do
    before do
      @referer = 'http://localhost'
    #   @request.env['HTTP_REFERER'] = @referer
    end
    context '正しいユーザー情報が渡って来た場合' do
      let(:params) do
        { user: {
          name: 'user',
          password: 'password',
          password_confirmation: 'password'
          }
        }
      end
      
      it 'ユーザーが一人増えていること' do
        expect { post users_path, params: params}.to change(User, :count).by(1)
      end

      it 'マイページにリダイレクトされること' do
        expect(post users_path, params: params).to redirect_to(mypage_path)
      end
    end
    context 'パラメーターに正しいユーザ名、確認パスワードが含まれていない場合' do
      before do
        post(users_path, params: {
            user:{
              name: 'ユーザー１',
              password: 'password',
              password_confirmation: 'invalid_password'
            }
          }
        )
      end
      it 'リファラーにリダイレクトされること' do
        expect(resoponse).to redirect_to(@referer)
      end

      it 'ユーザー名のエラーメッセージが含まれていること' do
        expect(flash[:error_messages]).to include 'ユーザー名は小文字英数字で入力してください'
      end

      it 'パスワード確認のエラーメッセージが含まれていること' do
        expect(flash[:error_messages]).to include 'パスワード（確認）とパスワードの入力が一致しません'
      end
    end
  end
end
