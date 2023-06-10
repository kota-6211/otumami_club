class ChatsController < ApplicationController
  def index
    if params[:question].present?
        client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"])
        response = client.chat(
          parameters: {
              model: "gpt-3.5-turbo",
              messages: [{ role: "user", content: "次の材料だけで作れるお酒に合う簡単なアレンジおつまみ一品を教えて#{params[:question]}" }],
          })

        @answer = response.dig("choices", 0, "message", "content")
    end
  end
end
