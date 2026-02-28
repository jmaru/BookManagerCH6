//
//  ColorExtension.swift
//  BookManagerCH6
//
//  Created by Jorge Gabriel Marin Urias on 2/26/26.
//

import SwiftUI

extension Color: RawRepresentable {
    
    public init?(rawValue: String){
        guard let data = Data(base64Encoded: rawValue) else{
            self = .black
            return
        }
        do {
            if let color = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data){
                self = Color(color)
            } else{
                self = .black
            }
        } catch {
            self = .black
        }
    }
    
    public var rawValue: String {
        do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: UIColor(self), requiringSecureCoding: false)
            return data.base64EncodedString()
        } catch {
            return ""
        }
    }
    
}
