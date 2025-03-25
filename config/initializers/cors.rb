Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*'  # 開発環境では全てのオリジンを許可。本番環境では適切に制限すべき
  
      resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head],
        expose: ['Authorization'] # JWTトークンを使用する場合に必要
    end
  end