//
//  ServiceViewModel.swift
//  FinnovativesTeamProject
//
//  Created by Abdulvoxid on 13/04/25.
//

import Foundation

class ServiceViewModel: ObservableObject {
    @Published private(set) var services: [Service] = [
        Service(icon: "creditcard.fill", title: "Kredit", subtitle: "TBC BANKdan onlayn kredit oling"),
        Service(icon: "plus.square.fill", title: "payme PLUS", subtitle: "Bitta obuna — koʻplab imkoniyatlar"),
        Service(icon: "heart.circle.fill", title: "Keyinroq toʻlov", subtitle: "Hozir toʻlang, keyin qaytarasiz"),
        Service(icon: "ticket.fill", title: "payme tickets", subtitle: "Turli tadbirlar uchun chiptalar xarid qilish"),
        Service(icon: "airplane", title: "payme avia", subtitle: "Chiptaga Salon Card bilan toʻlasangiz, 5% keshbek"),
        Service(icon: "building.columns.fill", title: "Maʼlumotnomalar va davlat xizmatlari", subtitle: ""),
        Service(icon: "bell.fill", title: "Eslatmalar", subtitle: "Toʻlov haqida bildirishnoma olish uchun"),
        Service(icon: "dollarsign.circle.fill", title: "Hisob raqamiga to'lov", subtitle: ""),
        Service(icon: "exclamationmark.triangle.fill", title: "YHXBB jarimalari haqida xabarnomalar", subtitle: ""),
        Service(icon: "target", title: "Payme Goals", subtitle: "Maqsadlaringiz uchun pul to'plashning oddiy usuli"),
        Service(icon: "heart.fill", title: "Hayotiy vaziyatlar", subtitle: "Muhim hayotiy voqealar uchun qo'llanma"),
        Service(icon: "gift.fill", title: "Xayriya", subtitle: ""),
        Service(icon: "wave.3.right.circle", title: "Order NFC sticker", subtitle: "Order NFC sticker for your business")
    ]
}
