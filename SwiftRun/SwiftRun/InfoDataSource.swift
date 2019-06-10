//
//  InfoDataSource.swift
//  SwiftRun
//
//  Created by Robert Harrison on 6/3/19.
//  Copyright © 2019 Robert Harrison. All rights reserved.
//

import UIKit

class InfoDataSource: NSObject, UITableViewDataSource {

    enum SectionType: Int {
        case general
        case version
    }

    enum ItemType: Int {
        case gitHub
        case license
        case version
    }

    struct Item {
        var type: ItemType
        var cellIdentifier: String
    }

    struct Section {
        var type: SectionType
        var items: [Item]
    }

    let sections = [
        Section(
            type: .general,
            items: [
                Item(type: .gitHub, cellIdentifier: "InfoCell"),
                Item(type: .license, cellIdentifier: "InfoCell")
            ]
        ),
        Section(
            type: .version,
            items: [
                Item(type: .version, cellIdentifier: "VersionCell")
            ]
        )
    ]

    // MARK: - UITableViewDatasource

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = sections[indexPath.section].items[indexPath.row]
        let cellIdentifier = item.cellIdentifier
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        switch item.type {
        case .gitHub:
            cell.textLabel?.text = "GitHub"

        case .license:
            cell.textLabel?.text = "License"

        case .version:
            let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
            let build = Bundle.main.infoDictionary!["CFBundleVersion"] as! String
            cell.textLabel?.text = "Version \(version) (\(build))"
        }

        return cell
    }

}

