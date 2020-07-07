# Running the app
 We will be using a postgresql database so we need to have postgresql installed via homebrew o application which ever you prefer. And of course we need to have rails installed in our system. You need to have postgres running for this API to work.
 
Now we need to create the database with this command:

`rails db:create`

We then migrate the database:

`rails db:migrate`

We now run seeds to create master user and the gifts for orders:

`rails db:seed`

After this we now have to run the server and everything is up and running and ready to reveive requests:

`rails s`

# Requests to the API

You can use postman to do all the requests and in the url you can either use it locally using localhost:3000 or you can use this url which is deployed in heroku https://thrillshare-apptegy.herokuapp.com

In the documentation I will be using the endpoints from the API deployed in heroku. I you want to run them locally just change the url to localhost:3000

# API Documentation
In each call we need to pass an authentication token and user email to be able to use all the features. In the postman collection that I have provided here is the auth token and the email for you to use in postman with all endpoints.

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/46b67fc2e5a4e40d3eff)

- Create School
`https://thrillshare-apptegy.herokuapp.com/v1/schools`
  - body example:
  ```
  {
    "school":{
        "name": "Anahuac",
        "address": "Mariot"
    }
  }
  ```
   
- Update School
`https://thrillshare-apptegy.herokuapp.com/v1/schools/:school_id`
  - body example:
  ```
  {
    "school":{
        "name": "Anahuac",
        "address": "Mariot"
    }
  }
  ```

- Delete School
`https://thrillshare-apptegy.herokuapp.com/v1/schools/:school_id`

- Create Recipient
`https://thrillshare-apptegy.herokuapp.com/v1/recipient/:school_id`
  - body example:
  ```
  {
    "recipient":{
        "name": "Victor Elizalde",
        "address": "Weslaco"
    }
  }
  ```

- Update Recipient
`https://thrillshare-apptegy.herokuapp.com/v1/recipients/:recipient_id`
  - body example:
  ```
  {
    "recipient":{
        "name": "Victor Elizalde",
        "address": "Weslaco"
    }
  }
  ```

- Delete Recipient
`https://thrillshare-apptegy.herokuapp.com/v1/recipients/2`

- List Recipients
`https://thrillshare-apptegy.herokuapp.com/v1/recipients`

- Create Order
`https://thrillshare-apptegy.herokuapp.com/v1/orders`
  - body example:
  ```
  {
    "order":{
        "school_id": "2",
        "recipient_ids": ["1"],
        "gift_ids": ["1", "2"]
    }
  }
  ```
- Update Order
`https://thrillshare-apptegy.herokuapp.com/v1/orders/:order_id`
  - body example:
  ```
  {
    "order":{
        "school_id": "2",
        "recipient_ids": ["1"],
        "gift_ids": ["1", "2"]
    }
  }
  ```
- Cancel Order
`https://thrillshare-apptegy.herokuapp.com/v1/orders/:order_id/cancel`

- Ship Order
`https://thrillshare-apptegy.herokuapp.com/v1/orders/:order_id/ship`

- List Orders
`https://thrillshare-apptegy.herokuapp.com/v1/orders/:school_id`

- Create user
`https://thrillshare-apptegy.herokuapp.com/users`
  - body example
  ```
  {
    "user": {
        "email": "victor@mail.com",
        "password": "asdfasdf",
        "password_confirmation": "adsfasdf"
    }
  }
  ```
