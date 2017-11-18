# Sigep Web

[![Build Status](https://travis-ci.org/marceloperini/sigep_web.svg?branch=master)](https://travis-ci.org/marceloperini/sigep_web)
[![Gem Version](https://badge.fury.io/rb/sigep_web.svg)](https://badge.fury.io/rb/sigep_web)
[![Code Climate](https://codeclimate.com/github/Sidoniuns/sigep_web/badges/gpa.svg)](https://codeclimate.com/github/Sidoniuns/sigep_web)
[![Coverage Status](https://coveralls.io/repos/github/marceloperini/sigep_web/badge.svg?branch=master)](https://coveralls.io/github/marceloperini/sigep_web?branch=master)
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=DWFWT6N2YCZTG)

## About

This gem provide a easy way to integrate an application to Correios Sigep Web API, all features is based on this [API documentation](http://www.corporativo.correios.com.br/encomendas/sigepweb/doc/Manual_de_Implementacao_do_Web_Service_SIGEP_WEB.pdf)

## Getting started

You can add it to your Gemfile with:

``` ruby
gem 'sigep_web'
```

or in your console:

``` ruby
gem install sigep_web
```

### Configuration

If you are using Rails put this in your environments configuration files:

``` ruby
SigepWeb.configure do |config|
  config.user = 'YOUR_USER'
  config.password = 'YOUR_PASSWORD'
  config.administrative_code = 'YOUR_ADM_CODE'
  config.card = 'YOUR_CARD_NUMBER'
  config.contract = 'YOUR_CONTRACT_NUMBER'
end
```
### How It Works

####  Consulting service availability

This check whether a particular service is available from source zip code to target zip code.

``` ruby
SigepWeb.service_availability(service_number: '40215', source_zip: '70002900', target_zip: '74730490')
```

This method will return a hash like this if has a success response, the second attribute indicate if a particular service is available.

``` ruby
{ :success => true, :response => true }
```

#### Search Client
This method return the available services of specific post card

``` ruby
SigepWeb.search_client(id_contract: "0000000000", id_post_card: "0000000000")
```

The method will return something like this

``` ruby
{
  :success => true,
  :response => {
    :cnpj => '0000000000',
    :contratos => {
      :cartoes_postage => {
        :codigo_administrativo => '000000000',
        :numero => '000000000',
        :servicos => [
          {
            :codigo => '40096',
            :descricao => 'SEDEX - CONTRATO',
            :id => '104625'
          },
          ...
        ]
      }
    }
  }
}
```

#### Zip Query
This method return the address based on zip code

``` ruby
SigepWeb.zip_query(zip: "70002900")
```

This method will return a hash like this

``` ruby
{
  :success => true,
  :response => {
    :bairro => 'Asa Norte',
    :cep => '70002900',
    :cidade => 'Brasília',
    :complemento => nil,
    :complemento2 => nil,
    :end => 'SBN Quadra 1 Bloco A',
    :id => '0',
    :uf => 'DF'
  }
}
```

#### Request Labels For Posts
Return one label or a range of labels to use for posts
``` ruby
SigepWeb.request_labels(receiver_type: "C", identifier: "00000000000000", id_service: "104625", qt_labels: 1)
```
