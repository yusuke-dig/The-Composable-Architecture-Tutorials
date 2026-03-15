import SwiftUI
import ComposableArchitecture

struct ContactsView: View {
    let store: StoreOf<ContactsFeature>
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(store.contacts) { contact in
                    Text(contact.name)
                }
            }
            .navigationTitle("Contacts")
            .toolbar {
                ToolbarItem {
                    Button {
                        store.send(.addButtonTapped)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    let state = ContactsFeature.State(
        contacts: [
            Contact(id: UUID(), name: "Blob"),
            Contact(id: UUID(), name: "Blob Jr"),
            Contact(id: UUID(), name: "Blob Sr"),
        ]
    )
    let store = Store(initialState: ContactsFeature.State()) {
        ContactsFeature()
    }
    ContactsView(store: store)
}

struct Contact: Equatable, Identifiable {
    let id: UUID
    var name: String
}

@Reducer
struct ContactsFeature {
    @ObservableState
    struct State: Equatable {
        var contacts: IdentifiedArrayOf<Contact> = []
    }
    
    enum Action {
        case addButtonTapped
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .addButtonTapped:
                return .none
            }
        }
    }
}
