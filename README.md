# MALIPO API
This API includes: Mpesa, Paypal, Stripe, Pesapal payments.

# Mpesa References:
- [Daraja](https://developer.safaricom.co.ke)
- [Ian Komu Documentation](https://www.iankumu.com/blog/laravel-mpesa/)
- - [Ian Komu github](https://github.com/Iankumu/Payments)

## Setup
To run this project locally clone the repository and in the project directory,run the following commands:


```
cp.env.example .env
composer install
php artisan key:generate
php artisan migrate
php artisan serve
```

# API
## Mpesa A
## Sandbox APIs
1. Generate Authorization token
- Generate MpesaController:
```
php artisan make:controller MpesaController
```
- Create STKPush Model
```
php artisan make:model Mpesa/MpesaSTKPush -m
```