//
//  FormattedKeyPath.swift
//  SwifQL
//
//  Created by Mihael Isaev on 20/06/2019.
//

import Foundation

/// Formatting keypath
public typealias FKP = FormattedKeyPath

public struct FormattedKeyPath {
    let _table: String
    let _paths: [String]
    
    public init <T: Tableable>(_ table: T.Type, _ paths: String...) {
        _table = table.entity
        _paths = paths
    }
    
    public init <T: Tableable>(_ table: T.Type, _ paths: [String]) {
        _table = table.entity
        _paths = paths
    }
    
    public init (_ table: String, _ paths: String...) {
        _table = table
        _paths = paths
    }
    
    public init (_ table: String, _ paths: [String]) {
        _table = table
        _paths = paths
    }
}

extension FormattedKeyPath: SwifQLable {
    public var parts: [SwifQLPart] { return [SwifQLPartKeyPath(table: _table, paths: _paths)] }
}

extension FormattedKeyPath: KeyPathLastPath {
    public var lastPath: String { return _paths.last ?? "" }
}

extension Tableable {
    /// Manual key path. Alias to `\User.something`
    public static func manualKeyPath(_ paths: String...) -> FormattedKeyPath {
        return manualKeyPath(paths)
    }
    
    /// Manual key path. Alias to `\User.something`
    public static func manualKeyPath(_ paths: [String]) -> FormattedKeyPath {
        return FormattedKeyPath(entity, paths)
    }
    
    /// Manual key path. Alias to `\User.something`
    public static func mkp(_ paths: String...) -> FormattedKeyPath {
        return manualKeyPath(paths)
    }
    
    /// Manual key path. Alias to `\User.something`
    public static func mkp(_ paths: [String]) -> FormattedKeyPath {
        return manualKeyPath(paths)
    }
}
