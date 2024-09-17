//
//  AddContactView.swift
//  swiftui_tca_practice
//
//  Created by KS on 2024/09/18.
//

import ComposableArchitecture
import SwiftUI

struct AddContactView: View {
    @Bindable var store: StoreOf<AddCountactFeature>


    var body: some View {
        Form {
            TextField("Name", text: $store.contact.name.sending(\.setName))
            Button("Save") {
                store.send(.saveButtonTapped)
            }
        }
        .toolbar {
            ToolbarItem {
                Button("Cancel") {
                    store.send(.cancelButtonTapped)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddContactView(store:
                        Store(initialState: AddCountactFeature.State(contact: Contact(id: UUID(), name: "john"))) {
            AddCountactFeature()
        })
    }
}
