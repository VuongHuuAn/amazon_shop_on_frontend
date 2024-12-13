import 'package:amazon_shop_on/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
    type: '',
    token: '',
    cart: [],
  );
  bool _isLoading = false;

  User get user => _user;
  bool get isLoading => _isLoading;

  // Getter để lấy tổng số lượng sản phẩm trong giỏ hàng
  int get cartQuantity {
    int total = 0;
    for (var item in _user.cart) {
      if (item is Map<String, dynamic> && item.containsKey('quantity')) {
        total += (item['quantity'] as int);
      }
    }
    return total;
  }

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }

  void clearUser() {
    _user = User(
      id: '',
      name: '',
      email: '',
      password: '',
      address: '',
      type: '',
      token: '',
      cart: [],
    );
    notifyListeners();
  }

  bool get isLoggedIn => _user.token.isNotEmpty;
  bool get isAdmin => _user.type == 'admin';
}