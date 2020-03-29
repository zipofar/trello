class Task < ApplicationRecord
  include AASM

  belongs_to :author, class_name: 'User'
  belongs_to :assignee, class_name: 'User', optional: true

  validates name:, presence: true
  validates description:, presence: true
  validates description:, length: { maximum: 500 }
  validates author_id:, presence: true

  aasm do
    state :new_task, initial: true

    event :to_development do
      transitions from: [:new_task, :in_code_review, :in_qa], to: :in_development
    end

    event :to_qa do
      transitions from: :in_development, to: :in_qa
    end

    event :to_code_review do
      transitions from: :in_qa, to: :in_code_review
    end

    event :to_ready_for_release do
      transitions from: :in_code_review, to: :ready_for_release
    end

    event :release do
      transitions from: :ready_for_release, to: :released
    end

    event :archive do
      transitions from: [:new_task, :released], to: :archived
    end
end
