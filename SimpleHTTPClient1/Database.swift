//
//  Database.swift
//  RestServer
//
//  Created by Alex Mulvaney on 11/20/20.
//
import SQLite3
import Foundation

class Database {
    static var dbObj : Database!
    let dbname = "/Users/Guest/Documents/"
    var conn : OpaquePointer!

    init() {
        // 1. create database
        if sqlite3_open(dbname, &conn) == SQLITE_OK {
            // create tables
            initializeDB()
            sqlite3_close(conn)
        } else {
            let errcode = sqlite3_errcode(conn)
            print("Open database failed due to error \(errcode)")
        }
    }

    private func initializeDB() {
        let sqlStmt = "create table if not exists claim (id text, title text, dateOfClaim text, isSolved bool)"
        if sqlite3_exec(conn, sqlStmt, nil, nil, nil) != SQLITE_OK {
            let errcode = sqlite3_errcode(conn)
            print("Create table failed due to error \(errcode)")
        }
    }

    func getDbConnection() -> OpaquePointer? {
        var conn : OpaquePointer?
        if sqlite3_open(dbname, &conn) == SQLITE_OK {
            return conn
        } else {
            let errcode = sqlite3_errcode(conn)
            let errmsg = sqlite3_errmsg(conn)
            print("Open database failed due to error \(errcode)")
            print("Open database failed due to error \(errmsg!)")
            let _ = String(format:"%@", errmsg!)
            //let len = strlen(errmsg)
            //let data = Data(bytes: errmsg!, count: len)
        }
        return conn
    }
    
    static func getInstance() -> Database {
        if dbObj == nil {
            dbObj = Database()
        }
        return dbObj
    }
}
