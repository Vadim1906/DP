//
//  Package.swift
//  DP
//
//  Created by Вадим Иванов on 24.04.2018.
//  Copyright © 2018 Вадим Иванов. All rights reserved.
//

import Foundation
import PackageDescription

let package = Package(
    name: "swift_mysql",
    dependencies:[
        .Package(url:"https://github.com/vapor/mysql", majorVersion:1)
    ]
)
