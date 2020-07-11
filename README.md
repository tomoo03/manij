# README

# manij DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false, add_index|
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
- has_many :goals
- has_many :tasks
- has_many :messages
- has_many :teams
- has_many :projects, through: :teams
- has_many :project_tasks
- has_many :project_comments

## goalsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|phase_title|string||
### Association
- belongs_to :user
- has_many :phases
- has_many :comments
- has_many :actions

## phasesテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
### Association
- belongs_to :goal
- has_many :tasks

## tasksテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|status|string|null: false, default'wip'|
### Association
- belongs_to :user
- belongs_to :phase

## actionsテーブル
|Column|Type|Options|
|------|----|-------|
|title|text|null: false|
### Association
- belongs_to :goal

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content|string|null: false|
### Association
- belongs_to :goal

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
### Association
- belongs_to :user

## projectsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|phase_title|string||
### Association
- has_many :users, through: :groups
- has_many :teams
- has_many :project_phases
- has_many :project_actions
- has_many :project_comments

## project_phasesテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
### Association
- belongs_to :project
- has_many :project_tasks

## project_tasksテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|status|string|null: false, default'wip'|
### Association
- belongs_to :user
- belongs_to :project_phase

## project_actionsテーブル
|Column|Type|Options|
|------|----|-------|
|title|text|null: false|
### Association
- belongs_to :project

## project_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content|string|null: false|
### Association
- belongs_to :user
- belongs_to :project

## teamsテーブル
|Column|Type|Options|
|------|----|-------|
|project|reference|null: false, foreign_key: true|
|user|reference|null:false, foreign_key: true|
### Association
- belongs_to :project
- belongs_to :user


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
