//
//  SFSymbols.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 15/04/25.
//

import UIKit

internal typealias SF = SFSymbols
internal typealias IS = ImageStrings

fileprivate let largeConfig = UIImage.SymbolConfiguration(pointSize: 30,
                                                          weight: .regular,
                                                          scale: .default)
fileprivate let mediumConfig = UIImage.SymbolConfiguration(pointSize: 20,
                                                           weight: .regular,
                                                           scale: .default)

enum SFSymbols {
    static let house = UIImage(systemName: "house")
    static let arrowLeftRight = UIImage(systemName: "arrow.left.arrow.right")
    static let creditcard = UIImage(systemName: "creditcard")
    static let squareGrid = UIImage(systemName: "square.grid.2x2")
    static let eyeFill = UIImage(systemName: "eye.fill")
    static let eyeSlashFill = UIImage(systemName: "eye.slash.fill")
    static let ellipsis = UIImage(systemName: "ellipsis")
    static let creditcardLarge = UIImage(systemName: "creditcard", withConfiguration: largeConfig)
    static let gCircle = UIImage(systemName: "g.circle", withConfiguration: largeConfig)
    static let qrcodeViewfinder = UIImage(systemName: "qrcode.viewfinder", withConfiguration: largeConfig)
    static let magnifyingglass = UIImage(systemName: "magnifyingglass", withConfiguration: mediumConfig)
    static let bell = UIImage(systemName: "bell", withConfiguration: mediumConfig)
    static let chevronRight = UIImage(systemName: "chevron.right")
    static let photo = UIImage(systemName: "photo")
    static let rectangleGrid = UIImage(systemName: "rectangle.grid.1x2")
    static let lock = UIImage(systemName: "lock")
    static let checkmarkShield = UIImage(systemName: "checkmark.shield")
    static let iphone = UIImage(systemName: "iphone")
    static let network = UIImage(systemName: "network")
    static let headphones = UIImage(systemName: "headphones")
    static let rectangleArrowRight = UIImage(systemName: "rectangle.portrait.and.arrow.right")
    static let chevronLeft = UIImage(systemName: "chevron.left")
    static let pencil = UIImage(systemName: "pencil")
    static let chevronLeftMedium = UIImage(systemName: "chevron.left", withConfiguration: mediumConfig)
    static let listClipboard = UIImage(systemName: "list.clipboard")
    static let bolt = UIImage(systemName: "bolt")
    static let phone = UIImage(systemName: "phone")
    static let buildingColumns = UIImage(systemName: "building.columns")
    static let tv = UIImage(systemName: "tv")
    static let heart = UIImage(systemName: "heart")
    static let clockArrow = UIImage(systemName: "clock.arrow.trianglehead.counterclockwise.rotate.90")
}

enum ImageStrings {
    static let xmark = "xmark"
    static let questionmark = "questionmark"
    static let chevronBackward = "chevron.backward"
    static let magnifyingglass = "magnifyingglass"
    static let xmarkCircleFill = "xmark.circle.fill"
    static let exclamationmarkCircle = "exclamationmark.circle"
}
