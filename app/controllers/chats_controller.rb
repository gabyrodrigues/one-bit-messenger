class ChatsController < ApplicationController
		def index 
			#listar todos os usuários com quem já houve troca de mensagens
			@users = User.joins(:sent).where(messages: { receiver_id: current_user }) #mensagens que eu recebi
			@users += User.joins(:received).where(messages: { sender_id: current_user }) #lista usuários: mensagens que eu enviei
			@users.uniq!
		end

		def show
			@user = User.find(params[:id])
			#exibir mensagem trocadas
			@messages = Message.where(sender: current_user, receiver: @user).or(Message.where(sender: @user, receiver: current_user)).order(:created_at)
    end
end
