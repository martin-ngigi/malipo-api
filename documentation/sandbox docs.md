- Create MpesaSetting Model
```
php artisan make:model Mpesa/MpesaSetting -m 
```

# API
## Mpesa APIs
## Sandbox APIs
1. Generate Authorization token
- Method : GET
- Endpoind :  http://127.0.0.1:8000/api/v1/mpesa/generate-access-token
- Response: 
```
{
    "status": "true",
    "mpesa_data": {
        "access_token": "iH5xpH9E5WzabIXcZmGhJpx5NFbA",
        "expires_in": "3599"
    },
    "bs_64": "QkFmOGRvRXN4ejQydzVYR2VvTFVqR2s0dnc3ckdrNXk6Y2M2T1dxUXgzdGhoREFXMw=="
}
```

1. Simulate STK Push
- Method : POST
- Endpoind : http://127.0.0.1:8000/api/v1/mpesa/simulate-stk-push
- Body: 
```
{
    "user_number":"254797292290",
    "amount" : "1"
}
```
- Response: 
```
{
    "status": true,
    "message": "Received Mpesa response ...",
    "data": {
        "MerchantRequestID": "16907-4950714-1",
        "CheckoutRequestID": "ws_CO_13052023112911524797292290",
        "ResponseCode": "0",
        "ResponseDescription": "Success. Request accepted for processing",
        "CustomerMessage": "Success. Request accepted for processing"
    }
}
```