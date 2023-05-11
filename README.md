# MALIPO API
This API includes: Mpesa, Paypal, Stripe, Pesapal payments.

## Setup
To run this project locally clone the repository and in the project directory,run the following commands:


```
cp.env.example .env
composer install
php artisan key:generate
php artisan migrate
php artisan serve
```