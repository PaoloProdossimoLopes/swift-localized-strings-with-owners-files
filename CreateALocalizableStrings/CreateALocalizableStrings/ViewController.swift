//
//  ViewController.swift
//  CreateALocalizableStrings
//
//  Created by Paolo Prodossimo Lopes on 26/03/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableNameEnum = LocalizedStringTable.localizedString
        let keyFromTableEnum = LocalizedStringKey.key1
        print("DEBUG:", LocalizedString.getStringFrom(
            table: tableNameEnum, withKey: keyFromTableEnum)
        )
    }
}

struct LocalizedString {
    static func getStringFrom(
        table: LocalizableTableNameEnumProtocol, withKey key: LocalizableKeyEnumProtocol
    ) -> String {
        Bundle.main.localizedString(forKey: key.keyName, value: nil, table: table.tableName)
    }
}

//Todas as chaves do arquivo (Criar um desse para cada arquivo)
enum LocalizedStringKey: String, LocalizableKeyEnumProtocol {
    case key1
    case key2
    case key3
    case key4
    
    var keyName: String  { return self.rawValue }
}

//Todos os arquivos do tipo .string
enum LocalizedStringTable: LocalizableTableNameEnumProtocol {
    case localizedString
    
    var tableName: String {
        switch self {
            case .localizedString: return "LocalizableString"
        }
    }
}

protocol LocalizableTableNameEnumProtocol {
    var tableName: String { get }
}

protocol LocalizableKeyEnumProtocol {
    var keyName: String { get }
}
