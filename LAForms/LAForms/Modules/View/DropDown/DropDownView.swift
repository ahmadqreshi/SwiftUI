//
//  OptionsDropDownView.swift
//  LAForms
//
//  Created by Ahmad Qureshi on 04/08/23.
//

import SwiftUI

struct DropDownView: View {
    
    var placeholder: String
    @Binding var selectedOption: String
    var questionType: QuestionType = .mcq
    
    @State private var selectedSlot: String = ""
    @State private var isOptionsPresented: Bool = false
    
    var options: [String] = []
    var slots: [Slot] = []
    
    var body: some View {
        ZStack(alignment: .top){
            Button {
                withAnimation {
                    isOptionsPresented.toggle()
                }
            } label: {
                HStack {
                    if questionType == .slot {
                        Text(selectedSlot.isEmpty ? placeholder : selectedSlot)
                            .foregroundColor(Color(hex: "666666"))
                            .font(.system(size: 14))
                    } else {
                        Text(selectedOption.isEmpty ? placeholder : selectedOption)
                            .foregroundColor(Color(hex: "666666"))
                            .font(.system(size: 14))
                    }
                    Spacer()
                    Image(systemName: self.isOptionsPresented ? "chevron.up" : "chevron.down")
                        .fontWeight(.light)
                        .foregroundColor(Color(hex: "666666"))
                }
                .padding(.all, 16)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(hex: "#181818"))
                )
                .overlay (
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(hex: "#333333"), lineWidth: 1)
                )
                
                
            }
            
            VStack(spacing: 0) {
                if self.isOptionsPresented {
                    if questionType == .slot {
                        SlotDropDownMenuList(options: slots) { option in
                            withAnimation {
                                self.isOptionsPresented = false
                                self.selectedOption = option.slotID
                                self.selectedSlot = option.timingText
                                
                            }
                        }
                    } else {
                        DropdownMenuList(options: self.options) { option in
                            withAnimation {
                                self.isOptionsPresented = false
                                self.selectedOption = option
                            }
                        }
                    }
                }
            }
            .padding(.top, 50)
            
        }
        
    }
}

struct DropDownView_Previews: PreviewProvider {
    static var previews: some View {
        DropDownView(placeholder: "Select any option", selectedOption: .constant(""), options: ["ahmad", "asad", "ayan"])
    }
}
