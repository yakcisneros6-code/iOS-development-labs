//
//  RepresentativeListCell.swift
//  Random API
//
//  Created by Yaquelin Cisneros on 12/10/25.
//

import SwiftUI

struct RepresentativeListCell: View {
    let representative: Representative
    
    var body: some View {
        Text(representative.name)
            .padding(.vertical, 8)
    }
}
