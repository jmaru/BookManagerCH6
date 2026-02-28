//
//  SettingsView.swift
//  BookManagerCH6
//
//  Created by Jorge Gabriel Marin Urias on 2/26/26.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage(SETTINGS_THEME_KEY) private var currentTheme: Theme = .system
    @AppStorage(SETTINGS_GRID_COLUMNS) private var gridColumns: Int = 2
    @AppStorage(SETTINGS_ACCENT_COLOR_KEY) private var accentColor: Color = .blue
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Appearance")){
                    Picker("Theme", selection: $currentTheme){
                        ForEach(Theme.allCases, id:\.self){ theme in
                            Text(theme.rawValue).tag(theme)
                        }
                    }
                    ColorPicker("Accent Color", selection: $accentColor)
                }
                Section(header: Text("Favorites view")){
                    Stepper("Columns: \(gridColumns)", value: $gridColumns, in: 1...4)
                }
            }
        }
        
    }
}
