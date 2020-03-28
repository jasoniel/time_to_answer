namespace :dev do

  DEFAULT_PASSWORD = 123456

  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando DB..") { %x(rails db:drop)}
      show_spinner("Criando  DB..") { %x(rails db:create)}
      show_spinner("Migrando DB..") { %x(rails db:migrate)}
      show_spinner("Criando Admin.."){%x(rails dev:add_default_admin)}
      show_spinner("Criando User.."){%x(rails dev:add_default_user)}      
    else
      puts 'Você não está no ambiente de desenvolvimento'
    end
  end

  desc "Adiciona adm padrão"
  task add_default_admin: :environment do
    Admin.create!(
      email: 'admin@admin.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Adiciona user padrão"
  task add_default_user: :environment do
    User.create!(
      email: 'user@user.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  private

  def show_spinner(msg_start, msg_end = 'Concluído')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
