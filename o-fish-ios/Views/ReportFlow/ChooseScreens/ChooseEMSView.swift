//
//  EMSTypeList.swift
//
//  Created on 3/2/20.
//  Copyright © 2020 WildAid. All rights reserved.
//

import SwiftUI

struct ChooseEMSView: View {

    private var items: [String] {
        var array = [String]()
        EMSViewModel.EMSType.allCases.forEach { type in
            array.append(type.rawValue)
        }
        return array
    }

    @Binding var selectedItem: String

    var body: some View {
        TextPickerView(selectedItem: $selectedItem,
            items: items,
            title: "Electronic Monitoring System",
            searchBarPlaceholder: "Search EMS's")
    }
}

struct ChooseEMSView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseEMSView(selectedItem: .constant("Other"))
    }
}
