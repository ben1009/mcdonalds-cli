# 🍟 McDonald's MCP Usage Examples

This document demonstrates how to use the McDonald's MCP Server in different scenarios.

## 📍 Scenario 1: Check Activities and Offers

### View Today's Activities
```
User: What activities does McDonald's have today?

AI: Let me check McDonald's activity calendar for today.

[Call campaign-calendar tool]

Today (December 9th), McDonald's has the following activities:

⏳ **Countdown! The super popular "Cheesy Ham McMuffin" is coming back!**
🍔 Soft Cheesy Ham McMuffin paired with fresh coffee
💥 A burger + a coffee! Still just ¥9.9 every day!
☀ One bite gives you a full charge of energy for the morning!
⏰ Starting December 15th, grab this great deal!
```

### View Available Coupons
```
User: What coupons can I collect?

AI: Let me check what coupons are currently available for collection.

[Call available-coupons tool]

### McDonald's Coupon List:

1. **¥11.9 Chicken McNuggets**
   - Status: Already collected
   
2. **¥9.9 Sweet Potato Deal** ⭐
   - Status: Not collected
   
3. **North African Egg McMuffin**
   - Status: Not available for collection
```

### One-Click Coupon Collection
```
User: Collect all available coupons for me

AI: Okay, I'll automatically collect all available coupons for you.

[Call auto-bind-coupons tool]

### 🎉 Collection Results
**Total**: 1 coupon
**Success**: 1
**Failed**: 0

---
#### ✅ Successfully collected coupons:
- **¥9.9 Sweet Potato Deal**
- couponId: 8ED8D8BEBEBDEF26B615682E92EFAC86
- couponCode: MCDD60T892ST5EV00N1090
```

---

## 💰 Scenario 2: Points Query and Redemption

### Check Points Balance
```
User: How many points do I have?

AI: Let me check your points account information.

[Call query-my-account tool]

# Your Points Account

| Item | Value |
|------|-------|
| **Available Points** | 7,592 |
| Total Points | 141,760.94 |
| Frozen Points | 30 |
| Expiring This Month | 0 |
| Expiring Next Month | 0 |
| Points Used | 115,474.14 |
```

### View Points Redemption Products
```
User: What can I redeem with my points?

AI: Let me check what products you can redeem with your points.

[Call mall-points-products tool]

Available points redemption products:

1. **Medium Latte/Americano** - 500 points
   - Valid until: 2026-04-30
   
2. **Spicy Chicken Wings (2pcs)** - 800 points
   - Valid until: 2026-04-30
   
3. **Big Mac** - 1200 points
   - Valid until: 2026-04-30
```

### Points Redemption
```
User: Redeem a coffee with points

AI: Okay, I'll help you redeem a Medium Latte/Americano for 500 points.

[Call mall-create-order tool, skuId=10997, count=1]

### ✅ Redemption Successful!

**Order ID**: ECS1202144786604392448
**Redeemed Product**: Medium Latte/Americano
**Points Used**: 500

**Voucher Code**: MCDD6E08N9100KC050F087

Please use it within the validity period. Show the voucher code at the store to redeem.
```

---

## 🍔 Scenario 3: Delivery Ordering

### View Delivery Addresses
```
User: I want to order delivery

AI: Okay, let me check your delivery addresses first.

[Call delivery-query-addresses tool]

You have the following delivery addresses:

1. **Zhang San** 152****6666
   📍 xx Province xx City xxx Community Building x Unit xxx Room
   🏪 Delivery Store: xxx Store
   
Please select or add a new delivery address?
```

### Query Store Menu
```
User: What's good on the menu?

AI: Let me check the current store's menu for you.

[Call query-meals tool, storeCode=12345, beCode=12345]

### 🍔 Popular Bestsellers

| Meal | Price | Tag |
|------|-------|-----|
| Bacon Angus Thick Beef Burger Meal | ¥55.5 | Second item 50% off |
| DC Combo Test | ¥14 | |
| Double Filet-O-Fish | ¥25 | |

### 🍟 Sides
...

### 🥤 Drinks
...
```

### View Meal Details
```
User: What's in the DC combo meal?

AI: Let me check the details of this combo meal for you.

[Call query-meal-detail tool, code=9900008139]

### DC Combo Test - ¥14

**Combo Contents:**

1. **Hamburger** x 1
   - Default: Hamburger-pool1
   
**Price**: ¥14
```

### Calculate Price
```
User: How much for a Big Mac meal plus Coke?

AI: Let me calculate the price for you.

[Call calculate-price tool]

### 💰 Price Details

| Item | Amount |
|------|--------|
| Original Product Price | ¥16.00 |
| Current Product Price | ¥16.00 |
| Original Delivery Fee | ¥6.00 |
| Current Delivery Fee | ¥6.00 |
| **Total Original Price** | **¥22.00** |
| Discount Amount | ¥0.00 |
| **Total Payable** | **¥22.00** |
```

### Create Order
```
User: Place order

AI: Okay, I'll create the order for you.

[Call create-order tool]

### ✅ Order Created Successfully!

**Order ID**: 1030938730000733964700499858
**Order Status**: Pending Payment

**Store**: xxx Store
**Address**: xxxx Community-Building xx Room xxx
**Contact**: Zhang San 152****6666

**Item List**:
- DC Combo Test x 1 - ¥16
  - Hamburger-pool1 with extra cream (add)

| Fee Details | Amount |
|-------------|--------|
| Product Amount | ¥16 |
| Delivery Fee | ¥6 |
| **Total** | **¥22** |

**⏰ Payment Link**: [Click to Pay](https://m.mcd.cn/mcp/scanToPay?orderId=1030779030000000000000000)

Please complete payment within 15 minutes.
```

### Check Order Status
```
User: How is my order doing?

AI: Let me check the order details for you.

[Call query-order tool, orderId=1030938730000733964700499858]

### 📋 Order Details

**Order ID**: 1030938730000733964700499858
**Status**: 🟡 Pending Payment
**Created At**: 2026-02-09 14:42:51

**Delivery Info**:
- Delivery Method: Immediate delivery
- Delivery Address: xxxx Community-Building xx Room xxx
- Contact: Zhang San 152****6666

**Product**: DC Combo Test x 1 - ¥16
**Total**: ¥22 (includes delivery fee ¥6)
```

---

## 🥗 Scenario 4: Nutrition Information Query

```
User: How many calories in a Big Mac?

AI: Let me check the nutrition information for the Big Mac.

[Call list-nutrition-foods tool]

### 🍔 Big Mac Nutrition Information

| Nutrient | Amount |
|----------|--------|
| Energy | 2153 kJ / 514 kcal |
| Protein | 26 g |
| Fat | 26 g |
| Carbohydrates | 44 g |
| Sodium | 889 mg |
| Calcium | 123 mg |

**Note**: The Big Mac is a high-calorie meal, accounting for about 25% of the recommended daily calorie intake for adults.
```

---

## 📝 Common Conversation Templates

| Need | Conversation Example |
|------|---------------------|
| Check activities | "What activities does McDonald's have today?" / "Any recent promotions?" |
| Collect coupons | "Collect coupons for me" / "Auto-collect coupons" / "One-click collect" |
| Check coupons | "What coupons do I have?" / "What coupons can I use?" |
| Check points | "How many points do I have?" / "Check my points" |
| Points redemption | "What can I redeem with points?" / "Redeem a coffee with points" |
| Order meal | "Order a Big Mac meal for me" / "I want to order delivery" |
| Check nutrition | "How many calories in a Big Mac?" / "Check nutrition info" |
| Check order | "How is my order doing?" / "Check order status" |

---

## ⚠️ Notes

1. **First Use**: You need to configure a delivery address before ordering
2. **Payment Method**: After creating an order, a payment link will be returned; payment must be completed manually
3. **Coupon Usage**: You can specify coupon usage when placing an order
4. **Time Limit**: Orders must be paid within 15 minutes of creation
