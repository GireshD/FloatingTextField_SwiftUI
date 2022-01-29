//
//  FloatingTextFieldView.swift
//  FloatingTextfiled
//
//  Created by Giresh Dora on 29/01/22.
//

import SwiftUI

struct FloatingTextFieldView: View {
    
    var leftIcon: String? = nil
    var rightIcon: String? = nil
    var placeHolder: String? = nil
    
    @Binding var text: String
    
    @State var edges: EdgeInsets = EdgeInsets(top: 0, leading: 45, bottom: 0, trailing: 0)
    @State var isEditing: Bool = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            HStack{
                
                if leftIcon != nil {
                    Image(systemName: leftIcon ?? "")
                        .foregroundColor(.secondary)
                }
                
                TextField("", text: $text) { status in
                    isEditing = status
                    DispatchQueue.main.async {
                        var leading: CGFloat = 0
                        var bottom: CGFloat = 0
                        
                        if status{
                            leading = 15
                            bottom = 60
                        }else{
                            isEditing = text.count>0 ? true : false
                            if isEditing{
                                leading = 15
                                bottom = 60
                            }else{
                                leading = 45
                                bottom = 0
                            }
                        }
                        edges = EdgeInsets(top: 0, leading: leading, bottom: bottom, trailing: 0)
                    }
                }
                
                
                    
                
                if rightIcon != nil {
                    Image(systemName: rightIcon ?? "")
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.secondary)
            )
            .zIndex(isEditing ? 0 : 1)
            
            Text(placeHolder ?? "")
                .background(Color(UIColor.systemBackground))
                .foregroundColor(.secondary)
                .padding(edges)
                .animation(Animation.easeInOut(duration: 0.4), value: edges)
                .zIndex(isEditing ? 1 : 0)
        }
    }
}

struct FloatingTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingTextFieldView(leftIcon:"person",placeHolder: "Enter Email", text: .constant("Email"))
    }
}
