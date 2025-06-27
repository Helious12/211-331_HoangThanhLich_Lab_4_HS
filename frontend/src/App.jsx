import React, { useEffect, useState } from "react";
import { fetchProducts, getUserInfo, placeOrder } from "./api";
import "./App.css";

function groupOrdersByPrice(orders) {
  const grouped = {};
  for (const order of orders) {
    const price = order.price;
    if (!grouped[price]) {
      grouped[price] = order.amount;
    } else {
      grouped[price] += order.amount;
    }
  }
  return Object.entries(grouped)
    .map(([price, amount]) => ({ price: parseFloat(price), amount }))
    .sort((a, b) => b.price - a.price);
}

function App() {
  const [userId, setUserId] = useState("");
  const [userInfo, setUserInfo] = useState(null);
  const [orders, setOrders] = useState([]);
  const [selectedCoin, setSelectedCoin] = useState("");

  const handleCheckUser = async () => {
    if (!userId) return alert("Please enter User ID");
    try {
      const data = await getUserInfo(userId);
      setUserInfo(data);
    } catch (err) {
      alert("User not found or error fetching info");
      setUserInfo(null);
    }
  };

  const handleCreateOrder = async (action) => {
    const coin = prompt("Enter coin name:");
    let amount;
    do {
        const input = prompt("Enter a non-negative integer amount:");
        amount = Number(input);
    } while (!Number.isInteger(amount) || amount < 0);

    let price;
    do {
        const input = prompt("Enter price per coin:");
        price = parseFloat(input);
    } while (isNaN(price) || price < 0);

    if (!coin || !amount || !price || !userId) {
      alert("Missing required fields");
      return;
    }

    const order = {
      user_id: parseInt(userId),
      coin,
      amount,
      price,
      action,
    };

    try {
      const res = await placeOrder(order);
      alert(`Order sent! Status: ${res.status || "queued"}`);
      fetchProducts().then(setOrders);
    } catch (err) {
      alert("Failed to place order");
    }
  };

  useEffect(() => {
    fetchProducts().then(setOrders);
  }, []);

  const coinOptions = [...new Set(orders.map(o => o.coin))];
  const filteredOrders = selectedCoin
    ? orders.filter(o => o.coin === selectedCoin)
    : orders;

  const buyOrdersRaw = filteredOrders.filter(o => o.action === "buy");
  const sellOrdersRaw = filteredOrders.filter(o => o.action === "sell");

  const buyOrdersGrouped = groupOrdersByPrice(buyOrdersRaw);
  const sellOrdersGrouped = groupOrdersByPrice(sellOrdersRaw);

  const allPrices = Array.from(new Set([
    ...buyOrdersGrouped.map(o => o.price),
    ...sellOrdersGrouped.map(o => o.price),
  ])).sort((a, b) => b - a);

  return (
    <div className="container">
      <h2>Mini Trading Platform</h2>

      <div className="input-group">
        <input
          placeholder="Enter User ID"
          value={userId}
          onChange={e => setUserId(e.target.value)}
        />
        <button className="check" onClick={handleCheckUser}>Check User Info</button>
      </div>

      {userInfo && (
        <div>
          <h3>User Info</h3>
          <p>ID: {userInfo.user_id}</p>
          <p>Username: {userInfo.username}</p>
          <p>Balance: ${userInfo.balances}</p>
          <h4>Tickers:</h4>
          <ul>
            {userInfo.coins.map(c => (
              <li key={c.coin}>{c.coin}: {c.amount}</li>
            ))}
          </ul>
          <div className="input-group">
            <button onClick={() => handleCreateOrder("buy")} className="buy">Buy</button>
            <button onClick={() => handleCreateOrder("sell")} className="sell">Sell</button>
          </div>
        </div>
      )}

      <div className="input-group">
        <label><b>Filter:</b></label>
        <select value={selectedCoin} onChange={(e) => setSelectedCoin(e.target.value)}>
          <option value="">-- All --</option>
          {coinOptions.map(coin => (
            <option key={coin} value={coin}>{coin}</option>
          ))}
        </select>
      </div>

      <h3>📊 Order Book {selectedCoin ? `for ${selectedCoin}` : ""}</h3>
      <table>
        <thead>
          <tr>
            <th>Buy Amount</th>
            <th>Price</th>
            <th>Sell Amount</th>
          </tr>
        </thead>
        <tbody>
          {allPrices.map((price, i) => {
            const buy = buyOrdersGrouped.find(o => o.price === price);
            const sell = sellOrdersGrouped.find(o => o.price === price);
            return (
              <tr key={i}>
                <td className="buy">
                  {buy ? (buy.amount % 1 === 0 ? buy.amount : buy.amount.toFixed(2)) : ""}
                </td>
                <td><strong>{price}</strong></td>
                <td className="sell">
                  {sell ? (sell.amount % 1 === 0 ? sell.amount : sell.amount.toFixed(2)) : ""}
                </td>
              </tr>
            );
          })}
        </tbody>
      </table>
    </div>
  );
}

export default App;
