//
//  ServiceViewModel.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 13/04/25.
//

import Foundation

class ServiceViewModel: ObservableObject {
    @Published private(set) var services: [Service] = [
        Service(image: SFSymbols.creditcard?.withRenderingMode(.alwaysTemplate),
                title: .credit,
                subtitle: .getOnlineCredit,
                type: .credit
               ),
        Service(image: SFSymbols.plusSquare?.withRenderingMode(.alwaysTemplate),
                title: .paymePlus,
                subtitle: .oneSubscriptionManyOpportunities,
                type: .plus
               ),
        Service(image: SFSymbols.heartCircle?.withRenderingMode(.alwaysTemplate),
                title: .deferredPayment,
                subtitle: .payNowRepayLater,
                type: .deferredPayment
               ),
        Service(image: SFSymbols.ticket?.withRenderingMode(.alwaysTemplate),
                title: .paymeTickets,
                subtitle: .purchaseTickets,
                type: .tickets
               ),
        Service(image: SFSymbols.airplane?.withRenderingMode(.alwaysTemplate),
                title: .paymeAvia,
                subtitle: .cashbackWithSalonCard,
                type: .avia
               ),
        Service(image: SFSymbols.buildingColumns?.withRenderingMode(.alwaysTemplate),
                title: .certificatesAndGovernmentServices,
                subtitle: .empty,
                type: .governmentServices
               ),
        Service(image: SFSymbols.bell?.withRenderingMode(.alwaysTemplate),
                title: .reminders,
                subtitle: .paymentNotifications,
                type: .reminders
               ),
        Service(image: SFSymbols.dollarSignCircle?.withRenderingMode(.alwaysTemplate),
                title: .accountPayment,
                subtitle: .empty,
                type: .accountPayment
               ),
        Service(image: SFSymbols.exclamationmark?.withRenderingMode(.alwaysTemplate),
                title: .notificationsAboutTrafficPoliceFines,
                subtitle: .empty,
                type: .fines
               ),
        Service(image: SFSymbols.target?.withRenderingMode(.alwaysTemplate),
                title: .paymeGoals,
                subtitle: .saveForGoals,
                type: .goals
               ),
        Service(image: SFSymbols.heartFill?.withRenderingMode(.alwaysTemplate),
                title: .lifeSituations,
                subtitle: .guideForLifeEvents,
                type: .lifeSituations
               ),
        Service(image: SFSymbols.gift?.withRenderingMode(.alwaysTemplate),
                title: .charity,
                subtitle: .empty,
                type: .charity
               ),
        Service(image: SFSymbols.waveCircle?.withRenderingMode(.alwaysTemplate),
                title: .orderNFCSticker,
                subtitle: .orderNFCSticker,
                type: .nfcSticker
               )
    ]
}
