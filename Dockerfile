FROM ruby:2.7.6

# 必要なパッケージをインストール
RUN apt-get update -qq && \
    apt-get install -y build-essential nodejs default-mysql-client default-libmysqlclient-dev

# RubyGemsを更新
RUN gem update --system 3.3.22

# 作業ディレクトリを設定
WORKDIR /app

# 特定のバージョンのBundlerをインストール
RUN gem uninstall bundler
RUN gem install bundler -v 2.1.4

# Gemfileだけを先にコピー
COPY Gemfile* ./

# 依存関係をインストール
# 特定のバージョンを設定せずRuby プラットフォームのネイティブ拡張をビルドするように強制
RUN bundle config set force_ruby_platform true
RUN bundle instal

# アプリケーションコードをコピー
COPY . .

# Railsサーバーを起動するコマンド
CMD ["rails", "server", "-b", "0.0.0.0"]