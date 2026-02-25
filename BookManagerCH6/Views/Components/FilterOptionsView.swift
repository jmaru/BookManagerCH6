//
//  FilterOptionsView.swift
//  BookManagerCH6
//
//  Created by Jorge Gabriel Marin Urias on 2/24/26.
//

import SwiftUI

struct FilterOptionsView: View {

    @Binding var selectedGenre: Genre?
    
    var body: some View {
        Form{
            Section(header: Text("Filter by Genre")){
                Picker("Genre", selection: $selectedGenre){
                    Text("All").tag(nil as Genre?)
                    ForEach(Genre.allCases, id:\.self){ genre in
                        Text(genre.rawValue).tag(genre)
                    }
                }
            }
        }
    }
}
