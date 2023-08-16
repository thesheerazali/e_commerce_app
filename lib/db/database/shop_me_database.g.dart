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
            'CREATE TABLE IF NOT EXISTS `Cart` (`productId` INTEGER NOT NULL, `title` TEXT NOT NULL, `type` TEXT NOT NULL, `image` TEXT NOT NULL, `uid` TEXT NOT NULL, `price` REAL NOT NULL, `quaintity` INTEGER NOT NULL, PRIMARY KEY (`productId`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Fav` (`productId` INTEGER, `title` TEXT NOT NULL, `type` TEXT NOT NULL, `image` TEXT NOT NULL, `uid` TEXT NOT NULL, `price` REAL NOT NULL, `quaintity` INTEGER NOT NULL, PRIMARY KEY (`productId`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Users` (`email` TEXT NOT NULL, `password` TEXT NOT NULL, `name` TEXT, `phone` TEXT, `gender` TEXT, PRIMARY KEY (`email`))');

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
}

class _$CartDao extends CartDao {
  _$CartDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _cartInsertionAdapter = InsertionAdapter(
            database,
            'Cart',
            (Cart item) => <String, Object?>{
                  'productId': item.productId,
                  'title': item.title,
                  'type': item.type,
                  'image': item.image,
                  'uid': item.uid,
                  'price': item.price,
                  'quaintity': item.quaintity
                }),
        _cartUpdateAdapter = UpdateAdapter(
            database,
            'Cart',
            ['productId'],
            (Cart item) => <String, Object?>{
                  'productId': item.productId,
                  'title': item.title,
                  'type': item.type,
                  'image': item.image,
                  'uid': item.uid,
                  'price': item.price,
                  'quaintity': item.quaintity
                }),
        _cartDeletionAdapter = DeletionAdapter(
            database,
            'Cart',
            ['productId'],
            (Cart item) => <String, Object?>{
                  'productId': item.productId,
                  'title': item.title,
                  'type': item.type,
                  'image': item.image,
                  'uid': item.uid,
                  'price': item.price,
                  'quaintity': item.quaintity
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Cart> _cartInsertionAdapter;

  final UpdateAdapter<Cart> _cartUpdateAdapter;

  final DeletionAdapter<Cart> _cartDeletionAdapter;

  @override
  Future<List<Cart>> getAllFavData() async {
    return _queryAdapter.queryList('SELECT * FROM cart',
        mapper: (Map<String, Object?> row) => Cart(
            productId: row['productId'] as int,
            title: row['title'] as String,
            type: row['type'] as String,
            image: row['image'] as String,
            price: row['price'] as double,
            quaintity: row['quaintity'] as int,
            uid: row['uid'] as String));
  }

  @override
  Future<List<Cart>> getCartForUser(String uid) async {
    return _queryAdapter.queryList('SELECT * FROM cart WHERE uid=?1',
        mapper: (Map<String, Object?> row) => Cart(
            productId: row['productId'] as int,
            title: row['title'] as String,
            type: row['type'] as String,
            image: row['image'] as String,
            price: row['price'] as double,
            quaintity: row['quaintity'] as int,
            uid: row['uid'] as String),
        arguments: [uid]);
  }

  @override
  Future<Cart?> getCartInDataByUid(
    String uid,
    int id,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM cart WHERE uid=?1 AND productId=?2',
        mapper: (Map<String, Object?> row) => Cart(
            productId: row['productId'] as int,
            title: row['title'] as String,
            type: row['type'] as String,
            image: row['image'] as String,
            price: row['price'] as double,
            quaintity: row['quaintity'] as int,
            uid: row['uid'] as String),
        arguments: [uid, id]);
  }

  @override
  Future<List<Cart>> clearCartByUId(String uid) async {
    return _queryAdapter.queryList('DELETE FROM cart WHERE uid =?1',
        mapper: (Map<String, Object?> row) => Cart(
            productId: row['productId'] as int,
            title: row['title'] as String,
            type: row['type'] as String,
            image: row['image'] as String,
            price: row['price'] as double,
            quaintity: row['quaintity'] as int,
            uid: row['uid'] as String),
        arguments: [uid]);
  }

  @override
  Future<void> updateUidCart(String uid) async {
    await _queryAdapter
        .queryNoReturn('UPDATE cart SET uid=?1', arguments: [uid]);
  }

  @override
  Future<void> addContacts(Cart cart) async {
    await _cartInsertionAdapter.insert(cart, OnConflictStrategy.abort);
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
            'Fav',
            (Fav item) => <String, Object?>{
                  'productId': item.productId,
                  'title': item.title,
                  'type': item.type,
                  'image': item.image,
                  'uid': item.uid,
                  'price': item.price,
                  'quaintity': item.quaintity
                }),
        _favUpdateAdapter = UpdateAdapter(
            database,
            'Fav',
            ['productId'],
            (Fav item) => <String, Object?>{
                  'productId': item.productId,
                  'title': item.title,
                  'type': item.type,
                  'image': item.image,
                  'uid': item.uid,
                  'price': item.price,
                  'quaintity': item.quaintity
                }),
        _favDeletionAdapter = DeletionAdapter(
            database,
            'Fav',
            ['productId'],
            (Fav item) => <String, Object?>{
                  'productId': item.productId,
                  'title': item.title,
                  'type': item.type,
                  'image': item.image,
                  'uid': item.uid,
                  'price': item.price,
                  'quaintity': item.quaintity
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Fav> _favInsertionAdapter;

  final UpdateAdapter<Fav> _favUpdateAdapter;

  final DeletionAdapter<Fav> _favDeletionAdapter;

  @override
  Future<List<Fav>> getAllFavData() async {
    return _queryAdapter.queryList('SELECT * FROM fav',
        mapper: (Map<String, Object?> row) => Fav(
            productId: row['productId'] as int?,
            title: row['title'] as String,
            type: row['type'] as String,
            image: row['image'] as String,
            price: row['price'] as double,
            quaintity: row['quaintity'] as int,
            uid: row['uid'] as String));
  }

  @override
  Future<List<Fav>> clearCartByUId(int id) async {
    return _queryAdapter.queryList('SELECT * FROM fav WHERE id =?1',
        mapper: (Map<String, Object?> row) => Fav(
            productId: row['productId'] as int?,
            title: row['title'] as String,
            type: row['type'] as String,
            image: row['image'] as String,
            price: row['price'] as double,
            quaintity: row['quaintity'] as int,
            uid: row['uid'] as String),
        arguments: [id]);
  }

  @override
  Future<List<Fav>> getFavoritesForUser(String uid) async {
    return _queryAdapter.queryList('SELECT * FROM fav WHERE uid = ?1',
        mapper: (Map<String, Object?> row) => Fav(
            productId: row['productId'] as int?,
            title: row['title'] as String,
            type: row['type'] as String,
            image: row['image'] as String,
            price: row['price'] as double,
            quaintity: row['quaintity'] as int,
            uid: row['uid'] as String),
        arguments: [uid]);
  }

  @override
  Future<Fav?> getFavInDataByUid(
    String uid,
    int id,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM fav WHERE uid=?1 AND productId=?2',
        mapper: (Map<String, Object?> row) => Fav(
            productId: row['productId'] as int?,
            title: row['title'] as String,
            type: row['type'] as String,
            image: row['image'] as String,
            price: row['price'] as double,
            quaintity: row['quaintity'] as int,
            uid: row['uid'] as String),
        arguments: [uid, id]);
  }

  @override
  Future<void> addContacts(Fav fav) async {
    await _favInsertionAdapter.insert(fav, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateContacts(Fav fav) async {
    await _favUpdateAdapter.update(fav, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteContacts(Fav fav) async {
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
                  'gender': item.gender
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
            name: row['name'] as String?,
            phone: row['phone'] as String?,
            gender: row['gender'] as String?),
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
            name: row['name'] as String?,
            phone: row['phone'] as String?,
            gender: row['gender'] as String?),
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
    await _usersInsertionAdapter.insert(users, OnConflictStrategy.abort);
  }
}
