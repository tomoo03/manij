# 概要
- アプリケーションの内容について紹介します

## アプリケーション情報
- 接続先情報
  - URL [https://tranquil-shore-75098.herokuapp.com/](https://tranquil-shore-75098.herokuapp.com/)
  - Githubリポジトリ  
[https://github.com/tomoo03/manij](https://github.com/tomoo03/manij)
- 開発状況
  - 開発環境
    - Ruby/Ruby on Rails/jQuery/Postgresql/Github/Heroku/Visual Studio Code
  - 開発期間
    - 7/10 ~ 7/21(11日間), 8/18 ~ 現在
    - 1日あたりの作業時間 11日間の間は、1日約16 ~ 20
# 制作背景
- 自分で立てた目標を達成するまでの間、可視化して管理したい、という目的で制作しました。  
プロジェクト管理よりも、個人的、プライベートな範囲での利用を想定しています。  
仲間同士で目標を共有出来る為に、チーム機能も実装しました。
# DEMO
画像追加予定
# 実装予定の内容
- より簡単に任意のユーザーをチームに追加する事が出来るよう、ユーザーをID検索出来る機能  
- 他のユーザーやチームが立てた目標や進捗を参考に出来るよう、公開範囲を指定してプロフィールを公開出来る機能  
- 他ユーザーに対してメッセージを送信出来る機能  
- 進捗をグラフで表示し、視覚的に把握しやすくする機能  
- ビューを全面的に改善する予定
# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
- has_many :goals, dependent: :destroy
- has_many :memberships, dependent: :destroy
- has_many :teams, through: :memberships
- has_many :activated_memberships, -> { where(activate: true) }, class_name: 'Membership'
- has_many :activated_teams, through: :activated_memberships, source: :team
- has_many :deactivated_memberships, -> { where(activate: false) }, class_name: 'Membership'
- has_many :deactivated_teams, through: :deactivated_memberships, source: :team
- has_many :project_tasks
- has_many :project_comments, dependent: :destroy

## goalsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|phase_title|string||
|user|references|foreign_key: true|
### Association
- belongs_to :user
- has_many :phases, dependent: :destroy
- has_many :minds, dependent: :destroy

## phasesテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|goal|references|foreign_key: true|
### Association
- belongs_to :goal
- has_many :tasks, dependent: :destroy
- has_many :comments, dependent: :destroy

## tasksテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|task_flg|boolean|null: false, default: false|
|phase|references|foreign_key: true|
### Association
- belongs_to :phase

## mindsテーブル
|Column|Type|Options|
|------|----|-------|
|title|text|null: false|
|goal|references|foreign_key: true|
### Association
- belongs_to :goal

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content|string|null: false|
|phase|references|foreign_key: true|
### Association
- belongs_to :phase

## projectsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|phase_title|string||
|team|references|foreign_key: true|
### Association
- belongs_to :team
- has_many :project_phases, dependent: :destroy
- has_many :project_minds, dependent: :destroy

## project_phasesテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|project|references|foreign_key: true|
### Association
- belongs_to :project
- has_many :project_tasks, dependent: :destroy
- has_many :project_comments, dependent: :destroy

## project_tasksテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|task_flg|boolean|null: false, default: false|
### Association
- belongs_to :project_phase
- belongs_to :user

## project_mindsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|project|references|foreign_key: true|
### Association
- belongs_to :project

## project_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content|string|null: false|
|project_phase|references|foreign_key: true|
|user|references|foreign_key: true|
### Association
- belongs_to :project_phase
- belongs_to :user

## teamsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|admin_user_id|integer|null:false|
|project|reference|null: false, foreign_key: true|
|user|reference|null:false, foreign_key: true|
### Association
- belongs_to :admin_user, class_name: 'User'
- has_many :memberships, dependent: :destroy
- has_many :users, through: :memberships
- has_many :projects, dependent: :destroy
- has_many :activated_memberships, -> { where(activate: true) }, class_name: 'Membership'
- has_many :activated_users, through: :activated_memberships, source: :user
- has_many :deactivated_memberships, -> { where(activate: false) }, class_name: 'Membership'
- has_many :deactivated_users, through: :deactivated_memberships, source: :user

## membershipsテーブル
|Column|Type|Options|
|------|----|-------|
|team|references|foreign_key: true|
|user|references|foreign_key: true|
|activate|boolean|null: false, default: false|
### Association
- belongs_to :team
- belongs_to :user