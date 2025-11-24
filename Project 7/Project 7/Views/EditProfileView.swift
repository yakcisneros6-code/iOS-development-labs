//
//  EditProfileView.swift
//  Project 7
//
//  Created by Yaquelin Cisneros on 11/12/25.
//

import SwiftUI

struct EditProfileView: View {
    //enviorment will dismmiss and close the sheet
    @Environment(\.dismiss) var dismiss
    
    @State private var firstName = ""
       @State private var lastName = ""
       @State private var username = ""
       @State private var bio = ""
    
    var body: some View {
        NavigationStack {
                    Form {
                        Section(header: Text("Name")) {
                            TextField("First Name", text: $firstName)
                            TextField("Last Name", text: $lastName)
                        }
                        
                        Section(header: Text("Username")) {
                            TextField("Username", text: $username)
                        }
                        
                        Section(header: Text("Bio")) {
                            TextField("Bio", text: $bio)
                        }
                        
                        Section {
                            Button("Save") {
                                //dismis is just closing rn not acutally saving it
                                dismiss()
                            }
                            .foregroundColor(.blue)
                        }
                    }
                    .navigationTitle("Edit Profile")
                }
            }
        }

        struct EditProfileView_Previews: PreviewProvider {
            static var previews: some View {
                EditProfileView()
            }
        }
    
