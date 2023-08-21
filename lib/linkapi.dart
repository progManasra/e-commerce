class AppLink {
  static const String server = "https://www.sbamobileapp.net/ecommerce";
  static const String imagestatic =
      "https://www.sbamobileapp.net/ecommerce/upload";

  // ==================== Image =================================

  static const String imagecategories = "$imagestatic/categories";
  static const String imageitems = "$imagestatic/items";

  static const String test = "$server/test.php";

  // ====================== Auth ================================
  static const String SignUp = "$server/auth/signup.php";
  static const String Login = "$server/auth/login.php";
  static const String verfiycodesignUp = "$server/auth/verfiycode.php";

  // ====================== Forget Passwor ======================
  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword =
      "$server/forgetpassword/verifycode.php";

// ======================== Home ================================
  static const String homepage = "$server/home.php";

  //static const String CategoriesView = "$server/categories/view.php";
// ======================== items ================================
  static const String items = "$server/items/items.php";
// ======================== favorite ================================
  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
}
