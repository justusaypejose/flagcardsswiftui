//
//  KeyValueCell.swift
//  FlagsSwiftUI
//
//  Created by Justus Aype Jose on 10/07/23.
//

import SwiftUI

struct KeyValueCell: View {
    let key: String
    let value: String
    
    var body: some View {
        HStack {
            Text(LocalizedStringKey(stringLiteral: key))
                .font(.headline)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
            Spacer()
            Text(LocalizedStringKey(stringLiteral: value))
                .font(.subheadline)
                .multilineTextAlignment(.trailing)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}


struct KeyValueCell_Previews: PreviewProvider {
    static var previews: some View {
        List {
            KeyValueCell(key: "Name :", value: "U.S.A")
            KeyValueCell(key: "Capital : ", value: "Washington D.C")
            KeyValueCell(key: "Population :", value: "10000000")
            KeyValueCell(key: "Language : ", value: "English")
        }
    }
}
