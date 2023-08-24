// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_me_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CartDao? _cartDaoInstance;

  FavDao? _favDaoInstance;

  UsersDao? _userdaoInstance;

  CategoryDao? _categoryDaoInstance;

  ProductDao? _productDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `categories` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `products` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `title` TEXT NOT NULL, `size` TEXT NOT NULL, `price` REAL NOT NULL, `discount` REAL NOT NULL, `isFavorite` INTEGER NOT NULL, `image` TEXT NOT NULL, `isInCart` INTEGER NOT NULL, `type` TEXT NOT NULL, `description` TEXT NOT NULL, `categoryId` INTEGER NOT NULL, FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Users` (`email` TEXT NOT NULL, `password` TEXT NOT NULL, `name` TEXT NOT NULL, `phone` TEXT NOT NULL, `gender` TEXT NOT NULL, `profilepic` TEXT NOT NULL, `age` TEXT NOT NULL, `country` TEXT NOT NULL, PRIMARY KEY (`email`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `cart_items` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `productId` INTEGER NOT NULL, `quantity` INTEGER NOT NULL, `userEmail` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `favorite_items` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `productId` INTEGER NOT NULL, `userEmail` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CartDao get cartDao {
    return _cartDaoInstance ??= _$CartDao(database, changeListener);
  }

  @override
  FavDao get favDao {
    return _favDaoInstance ??= _$FavDao(database, changeListener);
  }

  @override
  UsersDao get userdao {
    return _userdaoInstance ??= _$UsersDao(database, changeListener);
  }

  @override
  CategoryDao get categoryDao {
    return _categoryDaoInstance ??= _$CategoryDao(database, changeListener);
  }

  @override
  ProductDao get productDao {
    return _productDaoInstance ??= _$ProductDao(database, changeListener);
  }
}

class _$CartDao extends CartDao {
  _$CartDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _cartInsertionAdapter = InsertionAdapter(
            database,
            'cart_items',
            (Cart item) => <String, Object?>{
                  'id': item.id,
                  'productId': item.productId,
                  'quantity': item.quantity,
                  'userEmail': item.userEmail
                }),
        _cartUpdateAdapter = UpdateAdapter(
            database,
            'cart_items',
            ['id'],
            (Cart item) => <String, Object?>{
                  'id': item.id,
                  'productId': item.productId,
                  'quantity': item.quantity,
                  'userEmail': item.userEmail
                }),
        _cartDeletionAdapter = DeletionAdapter(
            database,
            'cart_items',
            ['id'],
            (Cart item) => <String, Object?>{
                  'id': item.id,
                  'productId': item.productId,
                  'quantity': item.quantity,
                  'userEmail': item.userEmail
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Cart> _cartInsertionAdapter;

  final UpdateAdapter<Cart> _cartUpdateAdapter;

  final DeletionAdapter<Cart> _cartDeletionAdapter;

  @override
  Future<List<Cart>> getAllFavData() async {
    return _queryAdapter.queryList('SELECT * FROM cart_items',
        mapper: (Map<String, Object?> row) => Cart(
            id: row['id'] as int?,
            productId: row['productId'] as int,
            quantity: row['quantity'] as int,
            userEmail: row['userEmail'] as String));
  }

  @override
  Future<Cart?> getCartItemByProductId(int productId) async {
    return _queryAdapter.query('SELECT * FROM cart_items WHERE productId = ?1',
        mapper: (Map<String, Object?> row) => Cart(
            id: row['id'] as int?,
            productId: row['productId'] as int,
            quantity: row['quantity'] as int,
            userEmail: row['userEmail'] as String),
        arguments: [productId]);
  }

  @override
  Future<void> deleteCartItemByProductId(int productId) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM cart_items WHERE productId = ?1',
        arguments: [productId]);
  }

  @override
  Future<List<Cart>> getCartItemsByUserId(String userEmail) async {
    return _queryAdapter.queryList(
        'SELECT * FROM cart_items WHERE userEmail = ?1',
        mapper: (Map<String, Object?> row) => Cart(
            id: row['id'] as int?,
            productId: row['productId'] as int,
            quantity: row['quantity'] as int,
            userEmail: row['userEmail'] as String),
        arguments: [userEmail]);
  }

  @override
  Future<void> removeCartItem(
    int productId,
    String userEmail,
  ) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM cart_items WHERE productId = ?1 AND userEmail = ?2',
        arguments: [productId, userEmail]);
  }

  @override
  Future<void> insertCartItem(Cart catItems) async {
    await _cartInsertionAdapter.insert(catItems, OnConflictStrategy.ignore);
  }

  @override
  Future<int> updateContacts(Cart cart) {
    return _cartUpdateAdapter.updateAndReturnChangedRows(
        cart, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteContacts(Cart cart) {
    return _cartDeletionAdapter.deleteAndReturnChangedRows(cart);
  }
}

class _$FavDao extends FavDao {
  _$FavDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _favInsertionAdapter = InsertionAdapter(
            database,
            'favorite_items',
            (Fav item) => <String, Object?>{
                  'id': item.id,
                  'productId': item.productId,
                  'userEmail': item.userEmail
                }),
        _favDeletionAdapter = DeletionAdapter(
            database,
            'favorite_items',
            ['id'],
            (Fav item) => <String, Object?>{
                  'id': item.id,
                  'productId': item.productId,
                  'userEmail': item.userEmail
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Fav> _favInsertionAdapter;

  final DeletionAdapter<Fav> _favDeletionAdapter;

  @override
  Future<List<Fav>> getAllFav() async {
    return _queryAdapter.queryList('SELECT * FROM favorite_items',
        mapper: (Map<String, Object?> row) => Fav(
            id: row['id'] as int?,
            productId: row['productId'] as int,
            userEmail: row['userEmail'] as String));
  }

  @override
  Future<List<Fav>> getFavoriteItemsByUserId(String userEmail) async {
    return _queryAdapter.queryList(
        'SELECT * FROM favorite_items WHERE userEmail = ?1',
        mapper: (Map<String, Object?> row) => Fav(
            id: row['id'] as int?,
            productId: row['productId'] as int,
            userEmail: row['userEmail'] as String),
        arguments: [userEmail]);
  }

  @override
  Future<void> removeFavoriteItem(
    int productId,
    String userEmail,
  ) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM favorite_items WHERE productId = ?1 AND userEmail = ?2',
        arguments: [productId, userEmail]);
  }

  @override
  Future<void> insertFavoriteItem(Fav favoriteItem) async {
    await _favInsertionAdapter.insert(favoriteItem, OnConflictStrategy.ignore);
  }

  @override
  Future<void> deleteFav(Fav fav) async {
    await _favDeletionAdapter.delete(fav);
  }
}

class _$UsersDao extends UsersDao {
  _$UsersDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _usersInsertionAdapter = InsertionAdapter(
            database,
            'Users',
            (Users item) => <String, Object?>{
                  'email': item.email,
                  'password': item.password,
                  'name': item.name,
                  'phone': item.phone,
                  'gender': item.gender,
                  'profilepic': item.profilepic,
                  'age': item.age,
                  'country': item.country
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Users> _usersInsertionAdapter;

  @override
  Future<Users?> getUserByEmailPassword(
    String email,
    String password,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM users WHERE email = ?1 AND password = ?2',
        mapper: (Map<String, Object?> row) => Users(
            email: row['email'] as String,
            password: row['password'] as String,
            name: row['name'] as String,
            phone: row['phone'] as String,
            gender: row['gender'] as String,
            profilepic: row['profilepic'] as String,
            age: row['age'] as String,
            country: row['country'] as String),
        arguments: [email, password]);
  }

  @override
  Future<List<String>> getAllUserEmails() async {
    return _queryAdapter.queryList('SELECT email FROM users',
        mapper: (Map<String, Object?> row) => row.values.first as String);
  }

  @override
  Future<Users?> getUserByEmail(String email) async {
    return _queryAdapter.query('SELECT * FROM users WHERE email = ?1',
        mapper: (Map<String, Object?> row) => Users(
            email: row['email'] as String,
            password: row['password'] as String,
            name: row['name'] as String,
            phone: row['phone'] as String,
            gender: row['gender'] as String,
            profilepic: row['profilepic'] as String,
            age: row['age'] as String,
            country: row['country'] as String),
        arguments: [email]);
  }

  @override
  Future<String?> getEmailByEmail(String email) async {
    return _queryAdapter.query('SELECT email FROM users WHERE email = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as String,
        arguments: [email]);
  }

  @override
  Future<void> insertUser(Users users) async {
    await _usersInsertionAdapter.insert(users, OnConflictStrategy.replace);
  }
}

class _$CategoryDao extends CategoryDao {
  _$CategoryDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _categoryInsertionAdapter = InsertionAdapter(
            database,
            'categories',
            (Category item) =>
                <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Category> _categoryInsertionAdapter;

  @override
  Future<List<Category>> getAllCategories() async {
    return _queryAdapter.queryList('SELECT * FROM categories',
        mapper: (Map<String, Object?> row) =>
            Category(row['id'] as int?, row['name'] as String));
  }

  @override
  Future<void> insertCategory(Category category) async {
    await _categoryInsertionAdapter.insert(category, OnConflictStrategy.abort);
  }
}

class _$ProductDao extends ProductDao {
  _$ProductDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _favInsertionAdapter = InsertionAdapter(
            database,
            'favorite_items',
            (Fav item) => <String, Object?>{
                  'id': item.id,
                  'productId': item.productId,
                  'userEmail': item.userEmail
                }),
        _cartInsertionAdapter = InsertionAdapter(
            database,
            'cart_items',
            (Cart item) => <String, Object?>{
                  'id': item.id,
                  'productId': item.productId,
                  'quantity': item.quantity,
                  'userEmail': item.userEmail
                }),
        _productInsertionAdapter = InsertionAdapter(
            database,
            'products',
            (Product item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'size': item.size,
                  'price': item.price,
                  'discount': item.discount,
                  'isFavorite': item.isFavorite ? 1 : 0,
                  'image': item.image,
                  'isInCart': item.isInCart ? 1 : 0,
                  'type': item.type,
                  'description': item.description,
                  'categoryId': item.categoryId
                }),
        _productUpdateAdapter = UpdateAdapter(
            database,
            'products',
            ['id'],
            (Product item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'size': item.size,
                  'price': item.price,
                  'discount': item.discount,
                  'isFavorite': item.isFavorite ? 1 : 0,
                  'image': item.image,
                  'isInCart': item.isInCart ? 1 : 0,
                  'type': item.type,
                  'description': item.description,
                  'categoryId': item.categoryId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Fav> _favInsertionAdapter;

  final InsertionAdapter<Cart> _cartInsertionAdapter;

  final InsertionAdapter<Product> _productInsertionAdapter;

  final UpdateAdapter<Product> _productUpdateAdapter;

  @override
  Future<List<Product>> getAllProducts() async {
    return _queryAdapter.queryList('SELECT * FROM products',
        mapper: (Map<String, Object?> row) => Product(
            title: row['title'] as String,
            image: row['image'] as String,
            type: row['type'] as String,
            description: row['description'] as String,
            id: row['id'] as int?,
            size: row['size'] as String,
            price: row['price'] as double,
            discount: row['discount'] as double,
            categoryId: row['categoryId'] as int,
            isFavorite: (row['isFavorite'] as int) != 0,
            isInCart: (row['isInCart'] as int) != 0));
  }

  @override
  Future<List<Product>> getProductsByCategoryId(int categoryId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM products WHERE categoryId = ?1',
        mapper: (Map<String, Object?> row) => Product(
            title: row['title'] as String,
            image: row['image'] as String,
            type: row['type'] as String,
            description: row['description'] as String,
            id: row['id'] as int?,
            size: row['size'] as String,
            price: row['price'] as double,
            discount: row['discount'] as double,
            categoryId: row['categoryId'] as int,
            isFavorite: (row['isFavorite'] as int) != 0,
            isInCart: (row['isInCart'] as int) != 0),
        arguments: [categoryId]);
  }

  @override
  Future<Product?> getProductById(int productId) async {
    return _queryAdapter.query('SELECT * FROM products WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Product(
            title: row['title'] as String,
            image: row['image'] as String,
            type: row['type'] as String,
            description: row['description'] as String,
            id: row['id'] as int?,
            size: row['size'] as String,
            price: row['price'] as double,
            discount: row['discount'] as double,
            categoryId: row['categoryId'] as int,
            isFavorite: (row['isFavorite'] as int) != 0,
            isInCart: (row['isInCart'] as int) != 0),
        arguments: [productId]);
  }

  @override
  Future<bool?> getProductFav() async {
    return _queryAdapter.query('SELECT isFavorite FROM products',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0);
  }

  @override
  Future<List<Product>> getFavoriteProductsForUser(
    bool isFav,
    String userEmail,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM products WHERE isFavorite = ?1 AND id IN (SELECT productId FROM favorite_items WHERE userEmail = ?2)',
        mapper: (Map<String, Object?> row) => Product(title: row['title'] as String, image: row['image'] as String, type: row['type'] as String, description: row['description'] as String, id: row['id'] as int?, size: row['size'] as String, price: row['price'] as double, discount: row['discount'] as double, categoryId: row['categoryId'] as int, isFavorite: (row['isFavorite'] as int) != 0, isInCart: (row['isInCart'] as int) != 0),
        arguments: [isFav ? 1 : 0, userEmail]);
  }

  @override
  Future<List<Product>> getCartProductsForUser(
    bool isInCart,
    String userEmail,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM products WHERE isInCart = ?1 AND id IN (SELECT productId FROM cart_items WHERE userEmail = ?2)',
        mapper: (Map<String, Object?> row) => Product(title: row['title'] as String, image: row['image'] as String, type: row['type'] as String, description: row['description'] as String, id: row['id'] as int?, size: row['size'] as String, price: row['price'] as double, discount: row['discount'] as double, categoryId: row['categoryId'] as int, isFavorite: (row['isFavorite'] as int) != 0, isInCart: (row['isInCart'] as int) != 0),
        arguments: [isInCart ? 1 : 0, userEmail]);
  }

  @override
  Future<void> addProductToFavorites(Fav favoriteItem) async {
    await _favInsertionAdapter.insert(favoriteItem, OnConflictStrategy.abort);
  }

  @override
  Future<void> addProductToCart(Cart cartItem) async {
    await _cartInsertionAdapter.insert(cartItem, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertProduct(Product product) async {
    await _productInsertionAdapter.insert(product, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateProduct(Product product) async {
    await _productUpdateAdapter.update(product, OnConflictStrategy.abort);
  }
}
