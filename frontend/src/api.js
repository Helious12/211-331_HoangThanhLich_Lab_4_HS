const BASE_URL = "/api";

export async function fetchProducts() {
  const res = await fetch(`${BASE_URL}/product/products`);
  return res.json();
}

export async function getUserInfo(userId) {
  const res = await fetch(`${BASE_URL}/users/users/${userId}/coins`);
  return res.json();
}

export async function placeOrder(order) {
  const res = await fetch(`${BASE_URL}/order/order`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(order),
  });
  return res.json();
}