//
//  Log.swift
//  Wegbringen
//
//  Created by Astha yadav on 19/11/21.
//

import os

private let subsystem = "com.wegbringen.restaurant"

struct Log {
  static let fileSyatem = OSLog(subsystem: subsystem, category: "fileSyatem")
  static let networking = OSLog(subsystem: subsystem, category: "networking")
  static let app = OSLog(subsystem: subsystem, category: "app")
}
