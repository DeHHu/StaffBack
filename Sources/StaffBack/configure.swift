import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
	app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
	guard let host = Environment.get("APP_HOST") else {
		fatalError("add a host to the .env file")
	}
	app.http.server.configuration.hostname = host
	
	guard let domain = Environment.get("APP_DOMAIN") else {
		fatalError("add a host to the .env file")
	}
	guard let port = Environment.get("APP_PORT"), let intValue = Int(port) else {
		fatalError("add a port to the .env file")
	}
	app.http.server.configuration.port = intValue
	
	let scheme = Environment.get("APP_SCHEME") ?? "http"
    // register routes
	let store = await Store(baseUrl: scheme + "://" + domain + ":" + port)
	await app.storage.setWithAsyncShutdown(StoreKey.self, to: store)
    try routes(app)
}


struct StoreKey: StorageKey {
		typealias Value = Store
	}
