//
//  CompanyImageService.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 21/04/25.
//

import SwiftUI
import Combine

class CompanyImageService {
    @Published var image: UIImage? = nil
    
    var imageSubscribtion: AnyCancellable?
    private let company: CompanyModel
    private let fileManager = LocalFileManager.instance
    private let folderName = "company_images"
    private var isLoadingImage: Bool = false
    
    init(company: CompanyModel) {
        self.company = company
        getCompanyImage()
    }
    
    func getCompanyImage() {
        guard !isLoadingImage else { return }
        
            if let savedImage = fileManager.getImage(imageName: company.id, folderName: folderName) {
                image = savedImage
                print("Image from filemanager")
            } else {
                downloadCompanyImage()
                print("Downloading image")
            }
    }
    
    func downloadCompanyImage() {
        guard let url = URL(string: company.imageUrl), !isLoadingImage else { return }
        
        imageSubscribtion = NetworkManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let downlodadedImage = returnedImage else { return }
                self.image = downlodadedImage
                self.imageSubscribtion?.cancel()
                self.fileManager.saveImage(image: downlodadedImage, imageName: self.company.id, folderName: self.folderName)
            })
    }
}
