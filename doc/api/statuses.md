## GET /api/statuses
Returns the statuses.

### Example

#### Request
```
GET /api/statuses?uid=9caf3c52-24ef-4e04-a00c-9f68ef708374 HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: Token token=test_token
Content-Length: 0
Content-Type: application/x-www-form-urlencoded
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 751
Content-Type: application/json; charset=utf-8
ETag: "372293c21ad0d8f3eedb728b19135c4a"
Set-Cookie: request_method=GET; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 537cefaa-f938-4265-8fcf-b1ace460b813
X-Runtime: 0.012781
X-XSS-Protection: 1; mode=block

[
  {
    "id": 5,
    "userId": 5,
    "body": "こころぴょんぴょんぴょんぴょんぴょん",
    "user": {
      "id": 5,
      "name": "test_user5",
      "screenName": "てすとゆーざ5",
      "image": null
    }
  },
  {
    "id": 4,
    "userId": 4,
    "body": "こころぴょんぴょんぴょんぴょん",
    "user": {
      "id": 4,
      "name": "test_user4",
      "screenName": "てすとゆーざ4",
      "image": null
    }
  },
  {
    "id": 3,
    "userId": 3,
    "body": "こころぴょんぴょんぴょん",
    "user": {
      "id": 3,
      "name": "test_user3",
      "screenName": "てすとゆーざ3",
      "image": null
    }
  },
  {
    "id": 2,
    "userId": 2,
    "body": "こころぴょんぴょん",
    "user": {
      "id": 2,
      "name": "test_user2",
      "screenName": "てすとゆーざ2",
      "image": null
    }
  },
  {
    "id": 1,
    "userId": 1,
    "body": "こころぴょん",
    "user": {
      "id": 1,
      "name": "test_user1",
      "screenName": "てすとゆーざ1",
      "image": null
    }
  }
]
```
