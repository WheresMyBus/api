# Where's My Bus? API

[![Build Status](https://travis-ci.org/WheresMyBus/api.svg?branch=master)](https://travis-ci.org/WheresMyBus/api)

## For Users

[User Documentation](https://github.com/WheresMyBus/android/wiki/User-Documentation)

## For Developers

[Developer Documentation](https://github.com/WheresMyBus/android/wiki/Developer-Documentation)

## API Reference

### [GET] /neighborhoods

Returns a list of all neighborhoods

```
[
  { 
    "id": 1, 
    "name": "Admiral" 
  },
  {
    "id": 2, 
    "name": "Alki"
  },
  {
    "id": 3, 
    "name": "Ballard"
  },
  ...
]
```

### [GET] /neighborhoods?filter=hill

Returns a list of all neighborhoods where the name contains the given filter parameter. If the filter is blank, all neighborhoods will be returned.

```
[
  {
    "id": 4,
    "name": "Beacon Hill"
  },
  {
    "id": 10,
    "name": "Capitol Hill"
  },
  {
    "id": 13,
    "name": "Crown Hill"
  },
  ...
]
```

### [GET] /neighborhoods/{id}

Returns the neighborhood with the given id.

```
{
  "id": 3,
  "name": "Ballard"
}
```

### [GET] /neighborhoods/{id}/alerts

Returns a list of alerts for the neighborhood with the given id.

```
[
  {
    "id": 1,
    "user_id": "50d1ce8e-a213-40a0-8228-587ea7fd604c",
    "alert_type": 0,
    "description": "Alert description goes here...",
    "upvotes": 0,
    "downvotes": 0,
    "neighborhood_id": 1,
    "created_at": "2016-11-10T17:29:53.626Z"
  },
  ...
]
```

### [POST] /neighborhoods/{id}/alerts

#### Parameters

- `alert_type` : A number representing a specific type of alert
- `description` [optional] : Text for describing the issue more specifically
- `user_id` [optional] : The UUID for a given user

Submits an alert about the neighborhood with the given id and returns the created alert.

```
{
  "id": 1,
  "user_id": "50d1ce8e-a213-40a0-8228-587ea7fd604c",
  "alert_type": 0,
  "description": "Alert description goes here...",
  "upvotes": 0,
  "downvotes": 0,
  "neighborhood_id": 1,
  "created_at": "2016-11-10T17:29:53.626Z"
}
```

### [GET] /neighborhood_alerts/{id}

Returns the neighborhood alert with the given id.

```
{
  "id": 1,
  "user_id": "50d1ce8e-a213-40a0-8228-587ea7fd604c",
  "alert_type": 0,
  "description": "Alert description goes here...",
  "upvotes": 0,
  "downvotes": 0,
  "neighborhood_id": 1,
  "created_at": "2016-11-10T17:29:53.626Z"
}
```

### [POST] /neighborhood_alerts/{id}/upvote

#### Parameters

- `user_id` [optional] : The UUID for a given user

Submits an upvote for the neighborhood alert with the given id and returns the vote.

```
{
  "id": 1,
  "user_id": "2f815de9-0726-4af6-9fca-ab251a2cbf29",
  "value": "up"
}
```

### [POST] /neighborhood_alerts/{id}/downvote

#### Parameters

- `user_id` [optional] : The UUID for a given user

Submits a downvote for the neighborhood alert with the given id and returns the vote.

```
{
  "id": 2,
  "user_id": "0b26919d-64df-4ad2-9f8b-b7feb9f289c5",
  "value": "down"
}
```

### [GET] /neighborhood_alerts/{id}/comments

Returns a list of comments for the neighborhood alert with the given id.

```
[
  {
    "id": 1,
    "user_id": "2af040ec-35de-49f5-9634-b3cd012799e3",
    "message": "Comment message goes here...",
    "upvotes": 0,
    "downvotes": 0,
    "created_at": "2016-11-10T17:51:32.984Z"
  },
  ...
]
```

### [POST] /neighborhood_alerts/{id}/comments

#### Parameters

- `message` : The content of the comment
- `user_id` [optional] : The UUID for a given user

Submits a comment about the neighborhood alert with the given id and returns the created comment.

```
{
  "id": 1,
  "user_id": "2af040ec-35de-49f5-9634-b3cd012799e3",
  "message": "Comment message goes here...",
  "upvotes": 0,
  "downvotes": 0,
  "created_at": "2016-11-10T17:51:32.984Z"
}
```

### [GET] /neighborhood_alert_comments/{id}

Returns the neighborhood alert comment with the given id.

```
{
  "id": 1,
  "user_id": "2af040ec-35de-49f5-9634-b3cd012799e3",
  "message": "Comment message goes here...",
  "upvotes": 0,
  "downvotes": 0,
  "created_at": "2016-11-10T17:51:32.984Z"
}
```

### [POST] /neighborhood_alert_comments/{id}/upvote

#### Parameters

- `user_id` [optional] : The UUID for a given user

Submits an upvote for the neighborhood alert comment with the given id and returns the vote.

```
{
  "id": 3,
  "user_id": "64f03753-0927-4c32-bd3a-3dbaace36851",
  "value": "up"
}
```

### [POST] /neighborhood_alert_comments/{id}/downvote

#### Parameters

- `user_id` [optional] : The UUID for a given user

Submits a downvote for the neighborhood alert comment with the given id and returns the vote.

```
{
  "id": 4,
  "user_id": "c2184ea5-a039-4bcc-9e71-3077ecbcfde3",
  "value": "down"
}
```
