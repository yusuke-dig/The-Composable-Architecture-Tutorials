import ComposableArchitecture
import Testing
import Foundation

@testable import The_Composable_Architecture_Tutorials


@MainActor
struct ContactsFeatureTests {
    @Test
    func addFlow() async {
        let store = TestStore(initialState: ContactsFeature.State()) {
            ContactsFeature()
        } withDependencies: {
            $0.uuid = .incrementing
        }
        store.exhaustivity = .off
        
        await store.send(.addButtonTapped)
        await store.send(\.destination.addContact.setName, "Blob Jr.")
        await store.send(\.destination.addContact.saveButtonTapped)
        await store.skipReceivedActions()
        
        store.assert {
            $0.contacts = [
                Contact(id: UUID(0), name: "Blob Jr.")
            ]
            $0.destination = nil
        }
    }
    
    @Test
    func deleteContact() async {
        let state = ContactsFeature.State(
            contacts: [
                Contact(id: UUID(0), name: "Blob"),
                Contact(id: UUID(1), name: "Blob Jr."),
            ]
        )
        let store = TestStore(initialState: state) {
            ContactsFeature()
        }
        
        await store.send(.deleteButtonTapped(id: UUID(1))) {
            $0.destination = .alert(.deleteConfirmation(id: UUID(1)))
        }
        await store.send(\.destination.alert.confirmDeletion, UUID(1)) {
            $0.contacts = [
                Contact(id: UUID(0), name: "Blob")
            ]
            $0.destination = nil
        }
    }
}

