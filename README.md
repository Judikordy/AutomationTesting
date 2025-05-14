
# API Test Scenarios

This document outlines the test scenarios for verifying the core functionality of the API endpoints related to users, products, authentication, and carts.

## 📌 Base URL
Replace with your API base URL, e.g., `https://fakestoreapi.com`

---

## ✅ Test Scenarios

### 1. Create User
- **Method**: `POST /users`
- **Body**: Valid user JSON (e.g., name, email, password, etc.)
- **Test**:
  - Status: `200 OK`
  - Response: Contains `user ID`
- **Negative Test**:
  - Missing required field (e.g., no email) should return `400 Bad Request`

---

### 2. Get All Users
- **Method**: `GET /users`
- **Test**:
  - Status: `200 OK`
  - Response: Non-empty array
- **Negative Test**:
  - Accessing with invalid token (if required) should return `401 Unauthorized`

---

### 3. Login User
- **Method**: `POST /auth/login`
- **Body**:
  ```json
  {
    "username": "mor_2314",
    "password": "83r5^_"
  }
  ```
- **Test**:
  - Status: `200 OK`
  - Response: Includes `token`
- **Negative Test**:
  - Wrong credentials return `401 Unauthorized`

---

### 4. Get All Products
- **Method**: `GET /products`
- **Test**:
  - Status: `200 OK`
  - Response: Non-empty array
- **Negative Test**:
  - Invalid endpoint (e.g., `/productz`) should return `404 Not Found`

---

### 5. Get Product by ID
- **Method**: `GET /products/1`
- **Test**:
  - Status: `200 OK`
  - Response: Contains `title` field
- **Negative Test**:
  - Invalid ID (e.g., `/products/9999`) returns `404 Not Found`

---

### 6. Create Cart
- **Method**: `POST /carts`
- **Body**:
  ```json
  {
    "userId": 5,
    "date": "2024-05-03",
    "products": [
      { "productId": 1, "quantity": 2 }
    ]
  }
  ```
- **Test**:
  - Status: `201 Created`
  - Response: Contains `cart ID`
- **Negative Test**:
  - Missing products list returns `400 Bad Request`

---

### 7. Get a Single Cart by ID
- **Method**: `GET /carts/1`
- **Test**:
  - Status: `200 OK`
  - Response: Contains `userId` and `products`
- **Negative Test**:
  - Invalid cart ID returns `404 Not Found`

---

### 8. Delete a Cart
- **Method**: `DELETE /carts/1`
- **Test**:
  - Status: `200 OK`
- **Negative Test**:
  - Re-deleting same cart returns `404 Not Found`

---

### 9. Get All Carts
- **Method**: `GET /carts`
- **Test**:
  - Status: `200 OK`
  - Response: Non-empty array
- **Negative Test**:
  - Invalid query parameter returns `400 Bad Request`

---

## 🔍 Notes
- Ensure the server is running before testing.
- Use tools like **Postman**, **Insomnia**, or **automated test frameworks** like Jest, Mocha, or Cypress.
