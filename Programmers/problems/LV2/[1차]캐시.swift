func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    
    var cache: [String] = []
    var count: Int = 0
    var cities = cities.map { $0.lowercased() }
    
    if cacheSize == 0 { return cities.count * 5 }
    
    for city in cities { 
        if cache.contains(city) { // cache hit
            cache.removeAll { $0 == city }
            cache.append(city)
            count += 1
            continue
        } else { // cache miss
            if cache.count < cacheSize { 
                cache.append(city)
            } else {
                cache.removeFirst()
                cache.append(city)
            }
            count += 5
        }
    }
    
    return count
}
