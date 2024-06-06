<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Form</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .order-form {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .order-form .form-group label {
            font-weight: bold;
        }
        .order-form .btn {
            width: 100%;
            font-size: 16px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="order-form col-md-6">
        <h2 class="text-center mb-4">Order Form</h2>
        <form>
            <div class="form-group">
                <label for="name">Name</label>
                <input name="name" type="text" id="name" class="form-control" placeholder="Name" required autofocus>
            </div>
            <div class="form-group">
                <label for="phoneNumber">Phone number</label>
                <input name="phoneNumber" type="text" id="phoneNumber" class="form-control" placeholder="Phone number" required>
            </
            <div class="form-group">
                <label for="email">Email</label>
                <input name="email" type="email" id="email" class="form-control" placeholder="Email" required>
            </div>
            <div class="form-group">
                <label for="deliveryAddress">Delivery Address</label>
                <input name="deliveryAddress" type="text" id="deliveryAddress" class="form-control" placeholder="Delivery Address" required>
            </div>
            <button class="btn btn-success" type="submit"><i class="fas fa-american-sign-language-interpreting"></i> Đặt Hàng</button>
        </form>
    </div>
</div>

<!-- Font Awesome for the icon -->
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

