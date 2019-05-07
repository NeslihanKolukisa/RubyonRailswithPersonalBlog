module Authors
    class AccountsController < AuthorController

        def update_info
            # email must be formatted correctly
            # name is required on update
            if current_author.update(author_info_params)
                 flash[:success] = 'Bilgileriniz güncellendi.'
            else
                flash[:danger] = '! Lütfen tekrar deneyiniz.'
            end
            redirect_to authors_account_path
        end
        
        def edit
            
        end
        
        def change_password
            author = current_author
            if author.valid_password?(author_password_params[:current_password])
                if author.change_password(author_password_params)
                sign_in(author, bypass: true)
                 flash[:success] = 'Şifre başarıyla değiştirildi.'
                else
                 flash[:danger] =  '! Lütfen tekrar deneyiniz.'
                end
            else
                flash[:danger] ='Mevcut şifre hatalı.'
            end
            redirect_to authors_account_path
        end
        
        private
        
        def author_info_params
            params.require(:author).permit(:name, :email, :bio)
        end
        
        def author_password_params
            params.require(:author).permit(:currnet_password, :new_password, :new_password_confirmation)
        end
    end
end