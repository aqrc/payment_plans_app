# Technical Details

## Endpoint A
Purpose: to fetch the initial data to show

`GET https://a21wk56avh.execute-api.us-east-1.amazonaws.com/default/flutter-home-exam`

No authentication, parameters or request body are needed.

Response structure:
```json
{
    "amount": 150050,     // [Field A]
    "payment_plans": [
        {
            "id": "1",     // [Field B]
            "payments": [
                {
                    "date": "2023-02-28",     // [Field C]
                    "amount": 75050     // [Field D]
                },
                {
                    "date": "2023-03-20",
                    "amount": 75000
                }
            ]
        },
        ...
    ]
}
```
NOTE: The values of the `amount` fields are in cents, not dollars.


## Endpoint B
Purpose: to split the rent

`POST https://a21wk56avh.execute-api.us-east-1.amazonaws.com/default/flutter-home-exam`

No authentication or parameters are needed.

Request body structure:
```json
{
    "id": 1,     // The id of the payment plan from [Field B] in the response of Endpoint A
    "dates": [    // The final dates chosen by the user in ISO 8601 format.
        "2023-02-28T00:00:00.000Z",
        "2023-03-02T00:00:00.000Z"
    ]
}
```

Resposne body: either empty or a simple string.
