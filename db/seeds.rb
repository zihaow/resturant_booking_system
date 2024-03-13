# frozen_string_literal: true

rake_tasks = [
  'initialized:create_default',
]

rake_tasks.each { |task| Rake::Task[task].invoke }