## GET /api/beacons
Returns the beacons.

### Example

#### Request
```
GET /api/beacons?uid=9617ed06-07a5-4667-b6ac-74db2500495a HTTP/1.1
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
Content-Length: 959
Content-Type: application/json; charset=utf-8
ETag: "e4f2d7c7aec2fe488931f0cbe81fdde7"
Set-Cookie: request_method=GET; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: e0caa563-2ce8-4b54-bba7-6ae8a9d2b3ef
X-Runtime: 0.016727
X-XSS-Protection: 1; mode=block

[
  {
    "id": 1,
    "uuid": "379502e7-f178-4ba5-92e1-4d20f6c513df",
    "minor": 1,
    "major": 2,
    "latitude": 139.75560025701523,
    "longitude": 39.80197843365847,
    "floor": 2,
    "boundId": 1,
    "bound": {
      "id": 1,
      "name": "地点1"
    }
  },
  {
    "id": 2,
    "uuid": "379502e7-f178-4ba5-92e1-4d20f6c513df",
    "minor": 2,
    "major": 4,
    "latitude": 139.75570025701523,
    "longitude": 39.802078433658465,
    "floor": 3,
    "boundId": 2,
    "bound": {
      "id": 2,
      "name": "地点2"
    }
  },
  {
    "id": 3,
    "uuid": "379502e7-f178-4ba5-92e1-4d20f6c513df",
    "minor": 3,
    "major": 6,
    "latitude": 139.75580025701524,
    "longitude": 39.80217843365847,
    "floor": 1,
    "boundId": 3,
    "bound": {
      "id": 3,
      "name": "地点3"
    }
  },
  {
    "id": 4,
    "uuid": "379502e7-f178-4ba5-92e1-4d20f6c513df",
    "minor": 4,
    "major": 8,
    "latitude": 139.75590025701524,
    "longitude": 39.802278433658465,
    "floor": 2,
    "boundId": 4,
    "bound": {
      "id": 4,
      "name": "地点4"
    }
  },
  {
    "id": 5,
    "uuid": "379502e7-f178-4ba5-92e1-4d20f6c513df",
    "minor": 5,
    "major": 10,
    "latitude": 139.75600025701522,
    "longitude": 39.80237843365847,
    "floor": 3,
    "boundId": 5,
    "bound": {
      "id": 5,
      "name": "地点5"
    }
  }
]
```
