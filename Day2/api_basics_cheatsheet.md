# API Basics Cheat Sheet — Day 2

**Date**: 2026-06-26  
**Tested on**: JSONPlaceholder + Supabase REST

## 1. GET Request
**Purpose**: Read data from server  
**URL**: `https://jsonplaceholder.typicode.com/posts/1`  
**Method**: GET  
**Headers**: None required for public APIs  
**Status**: `200 OK`  
**Response**: 
```json
{
  "userId": 1,
  "id": 1,
  "title": "sunt aut facere repellat",
  "body": "quia et suscipit..."
}
``` 

## 2. POST Request
**Purpose**: Create new data on server  
**URL**: `https://jsonplaceholder.typicode.com/posts`  
**Method**: POST  
**Headers**: `Content-Type: application/json`  
**Body**:
```json
{
  "title": "toqeer test",
  "body": "learning api",
  "userId": 1
}
```
**Status**: 201 Created
**Note**: JSONPlaceholder fakes it — returns id: 101 but doesn’t save


## 3. Key Headers
| Header | What it does | Example |
| --- | --- | --- |
| `Content-Type` | Tells server what format you're sending | `application/json` |
| `Authorization` | Proves who you are | `Bearer your-service-role-key` |
| `apikey` | Supabase specific auth | `your-service-role-key` |
| `Prefer` | Supabase: return data after insert | `return=representation` |
