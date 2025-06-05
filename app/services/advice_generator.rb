class AdviceGenerator
  def initialize(user, start_date: 7.days.ago.to_date, end_date: Date.today)
    @user = user
    @start_date = start_date
    @end_date = end_date
  end

  def generate
    cache_key = "advice_#{@user.id}_#{@start_date}_#{@end_date}"

    Rails.cache.fetch(cache_key, expires_in: 1.hour) do
      generate_advice_from_openai
    end
  end

  private

  def generate_advice_from_openai
    food_data = FoodRecord.where(user_id: @user.id, recorded_on: @start_date..@end_date).pluck(:menu, :calories)
    exercise_data = ExerciseRecord.where(user_id: @user.id, recorded_on: @start_date..@end_date).pluck(:activity, :calories_burned)
    weight_data = WeightRecord.where(user_id: @user.id, recorded_on: @start_date..@end_date).pluck(:recorded_on, :weight)

    prompt = build_prompt(food_data, exercise_data, weight_data)

    client = OpenAI::Client.new(access_token: Rails.application.credentials.openai_api_key)

    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [
          { role: "system", content: "あなたはダイエットアドバイザーです。" },
          { role: "user", content: prompt }
        ]
      }
    )

    response.dig("choices", 0, "message", "content") || "アドバイスを取得できませんでした。"
  end

  def build_prompt(food_data, exercise_data, weight_data)
    <<~PROMPT
      以下はユーザーの1週間の記録です。

      食事: #{food_data.inspect}
      運動: #{exercise_data.inspect}
      体重: #{weight_data.inspect}

      この情報をもとに、健康的なダイエットアドバイスを日本語で簡潔に3〜5行でください。
    PROMPT
  end
end
