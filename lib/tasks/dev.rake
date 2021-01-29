namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Drop..") {%x(rails db:drop)}
      show_spinner("Create..") {%x(rails db:create)}
      show_spinner("Migrate..") {%x(rails db:migrate)}
      %x(rails dev:add_minning_types)
      %x(rails dev:add_coins)
      
    else 
      puts 'Você não está em ambiente de desenvolvimento!'
    end
  end

  desc "Cadastra as Moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando Moedas..") do
      coins = [
          {
              description: "Bitcoin",
              acronym: "BTC",
              url_image: "https://img1.gratispng.com/20180604/eel/kisspng-bitcoin-com-cryptocurrency-logo-zazzle-kibuba-btc-5b15aa1ee35143.1933856615281464629311.jpg",
              minning_type: MinningType.all.sample
          },
          {
              description: "Ethereum",
              acronym: "ETR",
              url_image: "https://img1.gratispng.com/20180622/zos/kisspng-ethereum-cryptocurrency-bitcoin-blockchain-logo-5b2cc1ae1d4e68.5979084115296598221201.jpg",
              minning_type: MinningType.all.sample
          },
          {
              description: "Dash",
              acronym: "DASH",
              url_image: "https://e7.pngegg.com/pngimages/596/559/png-clipart-dash-virtual-currency-cryptocurrency-digital-currency-coin-emblem-label.png",
              minning_type: MinningType.all.sample
          }
      ]

      coins.each do |coin|
          Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Cadastra os Tipos de Mineração"
  task add_minning_types: :environment do
    show_spinner("Cadastrando Tipos..") do
      minning_types = [
        {description: 'Proof of Work', acronym: 'PoW'},
        {description: 'Proof of Stake', acronym: 'PoS'},
        {description: 'Proof of Capacity', acronym: 'PoC'}
      ]

      minning_types.each do |minning_type|
        MinningType.find_or_create_by!(minning_type)
      end
    end
  end

  private

  def show_spinner(msg_start, msg_end='Done!')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

end
