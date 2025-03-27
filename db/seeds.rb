# テーブルを正しい順序でクリア
puts 'Cleaning database...'
Notification.delete_all
Comment.delete_all
Task.delete_all
Project.delete_all
TeamMember.delete_all
Team.delete_all
User.delete_all

# 管理者ユーザー作成
puts 'Creating users...'
admin = User.create!(
  email: 'admin@example.com',
  password: 'password',
  name: '管理者'
)

# テストユーザー作成
user1 = User.create!(
  email: 'user1@example.com',
  password: 'password',
  name: 'ユーザー1'
)

user2 = User.create!(
  email: 'user2@example.com',
  password: 'password',
  name: 'ユーザー2'
)

# チーム作成
puts 'Creating teams...'
team = Team.create!(
  name: '開発チーム',
  description: 'アプリケーション開発を担当するチーム'
)

# チームメンバー設定
puts 'Setting up team members...'
TeamMember.create!(
  team: team,
  user: admin,
  role: 'admin'
)

TeamMember.create!(
  team: team,
  user: user1,
  role: 'member'
)

TeamMember.create!(
  team: team,
  user: user2,
  role: 'member'
)

# プロジェクト作成
puts 'Creating projects...'
project = Project.create!(
  name: 'ウェブアプリ開発',
  description: '新しいウェブアプリケーションの開発プロジェクト',
  team: team
)

# タスク作成
puts 'Creating tasks...'
task1 = Task.create!(
  title: 'デザイン作成',
  description: 'UIデザインの作成',
  status: 'todo',
  priority: 'high',
  due_date: Date.today + 7.days,
  project: project,
  assignee: user1,
  created_by: admin
)

task2 = Task.create!(
  title: 'バックエンド実装',
  description: 'APIエンドポイントの実装',
  status: 'todo',
  priority: 'medium',
  due_date: Date.today + 14.days,
  project: project,
  assignee: user2,
  created_by: admin
)

# コメント作成
puts 'Creating comments...'
Comment.create!(
  content: 'デザインについて打ち合わせが必要です',
  task: task1,
  user: admin
)

# 通知作成
puts 'Creating notifications...'
Notification.create!(
  user: user1,
  content: '新しいタスクが割り当てられました',
  read: false,
  notifiable: task1
)

Notification.create!(
  user: user2,
  content: '新しいタスクが割り当てられました',
  read: false,
  notifiable: task2
)

puts 'Seed data created successfully!'
