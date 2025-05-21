class ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat, only: %i[show destroy]

  def index
    @chats = Chat.all.where(user: current_user).order(id: :desc)
  end

  def show
  end

  def create
    response = CreateAiChatMessageService.call(
      prompt: params[:prompt],
      user_id: current_user.id
    )
    @chat = response.result.chat
    redirect_to @chat
  end

  def destroy
    @chat.destroy!

    redirect_to chats_path
  end

 def create
  prompt = params[:prompt].to_s.strip

  if prompt.blank?
    flash[:alert] = "El mensaje no puede estar vacío."
    redirect_to chats_path
    return
  end

  response = CreateAiChatMessageService.call(
    prompt: prompt,
    user_id: current_user.id
  )

  if response.result.present? && response.result.respond_to?(:chat)
    @chat = response.result.chat
    redirect_to @chat, notice: "Chat creado con éxito"
  else
    flash[:alert] = "No se pudo crear el chat. Intenta nuevamente."
    redirect_to chats_path
  end
end



  private

  def set_chat
    @chat = Chat.find(params[:id])
  end
end
