//
//  PruebaCeibaApp.swift
//  PruebaCeiba
//
//  Created by Andres Camilo Lezcano on 15/10/22.
//

import SwiftUI

@main
struct PruebaCeibaApp: App {
    
    init () {
        
        setupTheme()
        
        Task { [self] in
            await self.importData()
        }
    }
    
    private func importData() async {
        do {
            try await DataController.shared.importData()
        } catch {
            print(error)
        }
    }
    
    private func setupTheme() {
        
        let headerAppearance = UINavigationBarAppearance()
        
        headerAppearance.backgroundColor = UIColor(#colorLiteral(red: 43/255, green: 94/255, blue: 50/255, alpha: 1.0))
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        headerAppearance.titleTextAttributes = textAttributes
        headerAppearance.largeTitleTextAttributes = textAttributes
        UINavigationBar.appearance().tintColor = .white
        
        UINavigationBar.appearance().scrollEdgeAppearance = headerAppearance
        
    }
    
    var body: some Scene {
        WindowGroup {
            UserScreenView()
            
        }
    }
}
