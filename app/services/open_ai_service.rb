class OpenAiService
  include HTTParty
  base_uri "https://api.openai.com/v1"
  default_timeout 30

  def self.generate_image(prompt, size: "1024x1024",
                                  quality: "standard",
                                  style: 'vivid',
                                  response_format: "url",
                                  user: nil)
    body = {
      model:           "dall-e-3",
      prompt:          prompt,
      size:            size,
      quality:         quality,
      n:               1,
      style:           style,
      user:            user,
      response_format: response_format
    }.compact

    # <<< 修正点 1: 手動でJSONに変換する
    json_body = body.to_json

    # <<< 修正点 2: 送信するJSONの内容をログに出力して確認する
    Rails.logger.debug "[OpenAI Request Body]: #{json_body}"

    resp = post("/images/generations",
                headers: {
                  "Authorization" => "Bearer #{ENV.fetch('OPENAI_API_KEY')}",
                  "Content-Type"  => "application/json"
                },
                body: json_body)


unless resp.success?
  Rails.logger.error("[OpenAI] #{resp.code} #{resp.body}") # ← body を追記
  return { error: begin
                    JSON.parse(resp.body).dig("error", "message")
                  rescue
                    resp.body
                  end }
end

    resp.parsed_response["data"].map { _1["url"] }
  rescue StandardError => e
    Rails.logger.error("[OpenAI] #{e.message}")
    { error: e.message }
  end
end
