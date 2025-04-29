//
//  HomeViewController.swift
//  FinnovativesTeamProject
//
//  Created by Uygun Tursunov on 09/04/25.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func displayContent(_ viewModel: HomeModels.FetchContent.ViewModel)
    func displayNFCResult(_ url: URL)
    func displayError(_ message: String)
}

final class HomeViewController: UIViewController {
    // MARK: - Dependencies
    
    var router: HomeRouterProtocol?
    var interactor: HomeInteractorProtocol?
    
    // MARK: - Properties
    
    private let width = UIScreen.main.bounds.width
    private var events: [EventUiTile] = []
    private var financialServices: [FinancialServiceUiTile] = []
    private var paymentForServices: [PaymentForServiceUiTile] = []
    
    // MARK: - Views
    
    private let backgroundView = HomeBackgroundView()
    private let navigationBarView = HomeNavigationBarView()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.refreshControl = refreshControl
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        
        registerCellsAndSupplementaryViews(for: collectionView)
        
        return collectionView
    }()
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(didRefresh), for: .valueChanged)
        return refreshControl
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        interactor?.onViewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - Draw
    
    private func setupSubviews() {
        setupBackgroundView()
        setupCollectionView()
        setupNavigationBarView()
    }
    
    private func setupBackgroundView() {
        view.addSubview(backgroundView)
        backgroundView.frame = view.frame
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupNavigationBarView() {
        view.addSubview(navigationBarView)
        navigationBarView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func registerCellsAndSupplementaryViews(for collectionView: UICollectionView) {
        collectionView.register(CustomSectionHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: String(describing: CustomSectionHeaderView.self))
        
        let cellTypes: [HomeCellType] = [
            .homeHeader,
            .homeEvent,
            .homeFinancialService,
            .paymentForService
        ]
        
        cellTypes.forEach { cellType in
            collectionView.register(cellType.cellClass, forCellWithReuseIdentifier: cellType.reuseIdentifier)
        }
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
                                                            layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let section: NSCollectionLayoutSection
            
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            )
            
            let backgroundItem = NSCollectionLayoutDecorationItem.background(
                elementKind: "background"
            )
            backgroundItem.contentInsets = NSDirectionalEdgeInsets(
                top: 0, leading: 0, bottom: 0, trailing: 0
            )
            
            let headerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(50)
            )
            
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
            
            switch HomeSectionType(rawValue: sectionIndex) {
            case .header:
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(290)
                )
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize,
                    subitems: [item]
                )
                section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                section.decorationItems = [backgroundItem]
                sectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                return section
                
            case .finServices:
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(
                    (self.width - 36) / 2),
                                                       heightDimension: .estimated(60))
                let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize,
                    subitems: [item])
                section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 10
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 13, bottom: 10, trailing: 13)
                section.decorationItems = [backgroundItem]
                section.boundarySupplementaryItems = [sectionHeader]
                sectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: -13, bottom: 0, trailing: -13)
                return section
                
            case .events:
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .absolute(self.width - 32),
                    heightDimension: .estimated(127))
                let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize,
                    subitems: [item])
                section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 10
                section.orthogonalScrollingBehavior = .groupPagingCentered
                section.contentInsets = .init(top: 0, leading: 0, bottom: 10, trailing: 0)
                section.decorationItems = [backgroundItem]
                return section
                
            case .paymentForServices:
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .absolute(105),
                    heightDimension: .estimated(105))
                let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize,
                    subitems: [item])
                
                section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 10
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 10, bottom: 50, trailing: 10)
                section.decorationItems = [backgroundItem]
                section.boundarySupplementaryItems = [sectionHeader]
                sectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: -13, bottom: 0, trailing: -13)
                return section
                
            case .none:
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(0))
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize,
                    subitems: [item])
                section = NSCollectionLayoutSection(group: group)
                return section
            }
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        layout.configuration = config
        layout.register(ColoredSectionBackgroundView.self, forDecorationViewOfKind: "background")
        
        return layout
    }
    
    // MARK: - Events
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            interactor?.onScanNFC()
        }
    }
    
    // MARK: - Actions
    
    @objc func didRefresh() {
        refreshControl.endRefreshing()
    }
    
    // MARK: - Helpers
    
    private func dequeueCell(for cellType: HomeCellType, at indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier,
                                                      for: indexPath)
        return cell
    }
}

// MARK: - HomeViewProtocol

extension HomeViewController: HomeViewProtocol {
    func displayContent(_ viewModel: HomeModels.FetchContent.ViewModel) {
        events = viewModel.events
        financialServices = viewModel.financialServices
        paymentForServices = viewModel.paymentForServices
        collectionView.reloadData()
    }
    
    func displayNFCResult(_ url: URL) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    func displayError(_ message: String) {
        self.displayErrorAlert(message)
    }
}

// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { HomeSectionType.allCases.count }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch HomeSectionType(rawValue: section) {
        case .header: return 1
        case .events: return events.count
        case .finServices: return financialServices.count
        case .paymentForServices: return paymentForServices.count
        case .none: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let sectionType = HomeSectionType(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }
        
        switch sectionType {
        case .header:
            return dequeueCell(for: .homeHeader, at: indexPath)
            
        case .finServices:
            let cell = dequeueCell(for: .homeFinancialService, at: indexPath)
            if let financialCell = cell as? HomeFinancialServiceCollectionViewCell {
                financialCell.configure(model: financialServices[indexPath.item])
            }
            return cell
            
        case .events:
            let cell = dequeueCell(for: .homeEvent, at: indexPath)
            if let eventCell = cell as? HomeEventCollectionViewCell {
                eventCell.configure(model: events[indexPath.item])
            }
            return cell
            
        case .paymentForServices:
            let cell = dequeueCell(for: .paymentForService, at: indexPath)
            if let paymentCell = cell as? PaymentForServiceCollectionViewCell {
                paymentCell.configure(model: paymentForServices[indexPath.item])
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch HomeSectionType(rawValue: indexPath.section) {
        case .events:
            self.router?.openEventDetails()
        default:
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: CustomSectionHeaderView.self), for: indexPath) as? CustomSectionHeaderView else {
            return UICollectionReusableView()
        }
        
        if let sectionTitle = HomeSectionType(rawValue: indexPath.section)?.sectionTitle {
            header.configure(with: sectionTitle)
        }
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        if elementKind == "background" {
            if let backgroundView = view as? ColoredSectionBackgroundView {
                backgroundView.configure(with: indexPath.section)
            }
        }
    }
}
