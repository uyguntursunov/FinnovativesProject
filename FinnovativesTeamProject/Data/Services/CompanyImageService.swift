//
//  CompanyImageService.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 21/04/25.
//

import SwiftUI

class CompanyImageService {
    @Published var image: UIImage? = nil
    private let company: CompanyUiTile
    private let fileManager = LocalFileManager.instance
    private let folderName = "company_images".localized
    private var isLoadingImage: Bool = false
    
    init(company: CompanyUiTile) {
        self.company = company
        getCompanyImage()
    }
    
    func getCompanyImage() {
        guard !isLoadingImage else { return }
        if let savedImage = fileManager.getImage(imageName: company.id, folderName: folderName) {
            image = savedImage
            print("image_from_file_manager".localized)
        } else {
            downloadCompanyImage()
            print("image_from_network".localized)
        }
    }
    
    func downloadCompanyImage() {
        guard !isLoadingImage else { return }
        NetworkManager.shared.getCompanyImage(url: company.imageUrl) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    guard let image = UIImage(data: data) else { return }
                    self.image = image
                    self.fileManager.saveImage(image: image, imageName: self.company.id, folderName: self.folderName)
                }
            case .failure(let error):
                print(NetworkManagerErrorMessage.getCompanyImageError + error.localizedDescription)
            }
        }
    }
}
