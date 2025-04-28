//
//  String + Ext.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 28/04/25.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
