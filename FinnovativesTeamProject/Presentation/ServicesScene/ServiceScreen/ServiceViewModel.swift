//
//  ServiceViewModel.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 13/04/25.
//

import Foundation

class ServiceViewModel: ObservableObject {
    @Published private(set) var services: [Service] = [
        Service(icon: "creditcard.fill", title: "Kredit", subtitle: "TBC BANKdan onlayn kredit oling", type: .credit),
        Service(icon: "plus.square.fill", title: "payme PLUS", subtitle: "Bitta obuna — koʻplab imkoniyatlar", type: .plus),
        Service(icon: "heart.circle.fill", title: "Keyinroq toʻlov", subtitle: "Hozir toʻlang, keyin qaytarasiz", type: .deferredPayment),
        Service(icon: "ticket.fill", title: "payme tickets", subtitle: "Turli tadbirlar uchun chiptalar xarid qilish", type: .tickets),
        Service(icon: "airplane", title: "payme avia", subtitle: "Chiptaga Salon Card bilan toʻlasangiz, 5% keshbek", type: .avia),
        Service(icon: "building.columns.fill", title: "Maʼlumotnomalar va davlat xizmatlari", subtitle: "", type: .governmentServices),
        Service(icon: "bell.fill", title: "Eslatmalar", subtitle: "Toʻlov haqida bildirishnoma olish uchun", type: .reminders),
        Service(icon: "dollarsign.circle.fill", title: "Hisob raqamiga to'lov", subtitle: "", type: .accountPayment),
        Service(icon: "exclamationmark.triangle.fill", title: "YHXBB jarimalari haqida xabarnomalar", subtitle: "", type: .fines),
        Service(icon: "target", title: "Payme Goals", subtitle: "Maqsadlaringiz uchun pul to'plashning oddiy usuli", type: .goals),
        Service(icon: "heart.fill", title: "Hayotiy vaziyatlar", subtitle: "Muhim hayotiy voqealar uchun qo'llanma", type: .lifeSituations),
        Service(icon: "gift.fill", title: "Xayriya", subtitle: "", type: .charity),
        Service(icon: "wave.3.right.circle", title: "Order NFC sticker", subtitle: "Order NFC sticker for your business", type: .nfcSticker)
    ]
}
