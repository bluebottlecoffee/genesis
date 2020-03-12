# frozen_string_literal: true

require 'genesis/persistence'

namespace :database do
  DB_ROLE_PREFIX = 'genesis'

  desc 'Create database and user roles'
  task :setup, [:env] => [:drop] do |task, args|
    env = args[:env].to_sym
    validate_env(env)

    p "Creating fresh database env for: '#{env}'..."
    config = db_config(env)
    create_user(config)
    create_database(config)
  end

  desc 'Drop existing database and user roles'
  task :drop, [:env] do |task, args|
    env = args[:env].to_sym
    validate_env(env)

    p "Dropping any existing database env for: #{env}..."
    config = db_config(env)
    drop_database(config)
    drop_user(config)
  end

  def validate_env(env)
    raise "invalid environment: '#{env}'" unless valid?(env) unless
      %i[development test production].include?(env)
  end

  def db_config(env)
    @db_config ||= Genesis::Persistence.configure(env)
  end

  def create_user(config)
    sh <<~CREATE_USER
      createuser #{DB_ROLE_PREFIX}_#{config.environment} \
      --host #{config.host} --port #{config.port} \
      --createdb --login --no-password
    CREATE_USER
  end

  def create_database(config)
    sh <<~CREATE_DATABASE
      createdb #{config.database} \
      --host #{config.host} --port #{config.port} \
      --owner #{DB_ROLE_PREFIX}_#{config.environment}
    CREATE_DATABASE
  end

  def drop_user(config)
    sh <<~DROP_USER
      dropuser #{DB_ROLE_PREFIX}_#{config.environment} --if-exists
    DROP_USER
  end

  def drop_database(config)
    sh <<~DROP_DATABASE
      dropdb #{config.database} --if-exists
    DROP_DATABASE
  end
end
