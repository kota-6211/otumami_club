class ChatsController < ApplicationController
  def index
    if params[:question].present?
        client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"])
        response = client.chat(
          parameters: {
              model: "gpt-3.5-turbo",
              messages: [{ role: "user", content: "次の材料で作れるお酒に合う簡単アレンジおつまみを一品教えて。#{params[:question]}" }],
          })
        @answer = response.dig("choices", 0, "message", "content")
    end
    @genre = AlcoholGenre.all
  end

  def create
    @answer = Chat.new(text: params[:text])
    @answer.user_id = current_user.id
    @answer.save
    redirect_to user_path(current_user)
  end

  def destroy
    @answer = Chat.find(params[:id])
    @answer.destroy
    redirect_to chats_path
  end

  def show
    @answer = User.find(params[:id]).chats
    @genre = AlcoholGenre.all
  end

end
