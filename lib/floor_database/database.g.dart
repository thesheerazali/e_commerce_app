// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorProductDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ProductDatabaseBuilder databaseBuilder(String name) =>
      _$ProductDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ProductDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$ProductDatabaseBuilder(null);
}

class _$ProductDatabaseBuilder {
  _$ProductDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$ProductDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$ProductDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<ProductDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$ProductDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$ProductDatabase extends ProductDatabase {
  _$ProductDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CartDAO? _cartDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `Cart` (`id` INTEGER NOT NULL, `uid` TEXT NOT NULL, `image` TEXT NOT NULL, `title` TEXT NOT NULL, `type` TEXT NOT NULL, `description` TEXT NOT NULL, `sale` INTEGER NOT NULL, `price` REAL NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CartDAO get cartDao {
    return _cartDaoInstance ??= _$CartDAO(database, changeListener);
  }
}

class _$CartDAO extends CartDAO {
  _$CartDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _cartInsertionAdapter = InsertionAdapter(
            database,
            'Cart',
            (Cart item) => <String, Object?>{
                  'id': item.id,
                  'uid': item.uid,
                  'image': item.image,
                  'title': item.title,
                  'type': item.type,
                  'description': item.description,
                  'sale': item.sale,
                  'price': item.price
                },
            changeListener),
        _cartUpdateAdapter = UpdateAdapter(
            database,
            'Cart',
            ['id'],
            (Cart item) => <String, Object?>{
                  'id': item.id,
                  'uid': item.uid,
                  'image': item.image,
                  'title': item.title,
                  'type': item.type,
                  'description': item.description,
                  'sale': item.sale,
                  'price': item.price
                },
            changeListener),
        _cartDeletionAdapter = DeletionAdapter(
            database,
            'Cart',
            ['id'],
            (Cart item) => <String, Object?>{
                  'id': item.id,
                  'uid': item.uid,
                  'image': item.image,
                  'title': item.title,
                  'type': item.type,
                  'description': item.description,
                  'sale': item.sale,
                  'price': item.price
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Cart> _cartInsertionAdapter;

  final UpdateAdapter<Cart> _cartUpdateAdapter;

  final DeletionAdapter<Cart> _cartDeletionAdapter;

  @override
  Stream<List<Cart>> getAllCartItemsbyUid(String uid) {
    return _queryAdapter.queryListStream('SELECT * FROM Cart WHERE uid = ?1',
        mapper: (Map<String, Object?> row) => Cart(
            id: row['id'] as int,
            image: row['image'] as String,
            title: row['title'] as String,
            type: row['type'] as String,
            description: row['description'] as String,
            sale: row['sale'] as int,
            price: row['price'] as double,
            uid: row['uid'] as String),
        arguments: [uid],
        queryableName: 'Cart',
        isView: false);
  }

  @override
  Stream<List<Cart>> getCartItemsbyUId(
    String uid,
    int id,
  ) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM Cart WHERE uid = ?1 AND id=?2',
        mapper: (Map<String, Object?> row) => Cart(
            id: row['id'] as int,
            image: row['image'] as String,
            title: row['title'] as String,
            type: row['type'] as String,
            description: row['description'] as String,
            sale: row['sale'] as int,
            price: row['price'] as double,
            uid: row['uid'] as String),
        arguments: [uid, id],
        queryableName: 'Cart',
        isView: false);
  }

  @override
  Stream<List<Cart>> clearCartByUid(String uid) {
    return _queryAdapter.queryListStream('DELETE * FROM Cart WHERE uid = ?1',
        mapper: (Map<String, Object?> row) => Cart(
            id: row['id'] as int,
            image: row['image'] as String,
            title: row['title'] as String,
            type: row['type'] as String,
            description: row['description'] as String,
            sale: row['sale'] as int,
            price: row['price'] as double,
            uid: row['uid'] as String),
        arguments: [uid],
        queryableName: 'Cart',
        isView: false);
  }

  @override
  Future<void> insertCart(Cart product) async {
    await _cartInsertionAdapter.insert(product, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateCart(Cart product) async {
    await _cartUpdateAdapter.update(product, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteCart(Cart product) async {
    await _cartDeletionAdapter.delete(product);
  }
}
